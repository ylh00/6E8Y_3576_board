/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Single-core 24-state EKF + quadrotor rate-control benchmark.
 *
 * PC -> FC: environment / IMU / GPS / baro / mag / rate setpoint
 * FC -> PC: EKF position, velocity, quaternion + rate-control torque
 *
 * Transport: CherryUSB WinUSB by default; UART3 @ 2 Mbaud if USE_UART3=1.
 *
 * Benchmark modes:
 *   type 1 = one combined EKF + control step
 *   type 2 = N combined iterations
 *   type 3 = N EKF-only full updates (prediction + all aiding updates)
 *   type 4 = N rate-control-only iterations
 */

#include <stdio.h>
#include <string.h>

#include "board.h"
#include "hpm_mchtmr_drv.h"
#include "usb_config.h"

#include "ekf24.h"
#include "protocol.h"
#include "rate_control.h"
#include "transport.h"

#define MCHTMR_HZ           24000000ULL
#define MAX_ANGULAR_ACCEL   500.0f

#define BENCH_MODE_COMBINED  0u
#define BENCH_MODE_EKF_ONLY  1u
#define BENCH_MODE_CTRL_ONLY 2u

static ekf24_t g_ekf;
static rate_control_t g_rate;
static float g_prev_gyro[3];
static uint8_t g_have_prev_gyro;
static volatile float g_sink;

/* Visible from the debugger (nm + mdw) after the startup self-test. */
volatile uint32_t g_bench_hz;
volatile uint32_t g_bench_us;
volatile uint32_t g_bench_iters;
volatile uint32_t g_bench_ekf_us;
volatile uint32_t g_bench_ctrl_us;
volatile float g_bench_quat[4];
volatile float g_bench_pos[3];

static float clampf(float v, float lo, float hi)
{
    if (v < lo) {
        return lo;
    }
    if (v > hi) {
        return hi;
    }
    return v;
}

static void ekf_input_from_req(const proto_request_t *req, float dt, ekf24_input_t *in)
{
    in->dt = dt;
    for (uint32_t i = 0; i < 3; i++) {
        in->gyro[i] = req->gyro[i];
        in->accel[i] = req->accel[i];
        in->mag[i] = req->mag[i];
        in->gps_pos[i] = req->gps_pos[i];
        in->gps_vel[i] = req->gps_vel[i];
    }
    in->baro_alt = req->baro_alt;
}

/* One EKF full update: prediction + GPS position/velocity + baro + mag. */
ATTR_RAMFUNC static void ekf_full_update(const proto_request_t *req, float dt)
{
    ekf24_input_t in;

    ekf_input_from_req(req, dt, &in);
    ekf24_predict(&g_ekf, &in);
    ekf24_update_gps_pos(&g_ekf, req->gps_pos, 0.5f);
    ekf24_update_gps_vel(&g_ekf, req->gps_vel, 0.1f);
    ekf24_update_baro(&g_ekf, req->baro_alt, 0.5f);
    ekf24_update_mag(&g_ekf, req->mag, 0.02f);
}

/* PX4-style rate controller, angular acceleration from gyro difference. */
ATTR_RAMFUNC static void control_update(const proto_request_t *req, float dt, float torque[3])
{
    float angular_accel[3] = { 0.0f, 0.0f, 0.0f };

    if (g_have_prev_gyro) {
        for (uint32_t i = 0; i < 3; i++) {
            angular_accel[i] = clampf((req->gyro[i] - g_prev_gyro[i]) / dt,
                                     -MAX_ANGULAR_ACCEL,
                                      MAX_ANGULAR_ACCEL);
        }
    }
    for (uint32_t i = 0; i < 3; i++) {
        g_prev_gyro[i] = req->gyro[i];
    }
    g_have_prev_gyro = 1;

    rate_control_update(&g_rate, req->gyro, req->rate_sp, angular_accel, dt, torque);
}

ATTR_RAMFUNC static void run_one(const proto_request_t *req, float dt,
                                 uint32_t iter, uint32_t update_div,
                                 proto_response_t *rsp)
{
    const uint8_t do_update = (update_div == 1u)
                            || ((update_div > 1u) && ((iter % update_div) == 0u));

    if (do_update) {
        ekf_full_update(req, dt);
    } else {
        /* Prediction only; used by update_div=0 (highest loop rate). */
        ekf24_input_t in;
        ekf_input_from_req(req, dt, &in);
        ekf24_predict(&g_ekf, &in);
    }

    float torque[3];
    control_update(req, dt, torque);

    for (uint32_t i = 0; i < 3; i++) {
        rsp->pos[i] = g_ekf.x[EKF24_PN + i];
        rsp->vel[i] = g_ekf.x[EKF24_VN + i];
        rsp->torque[i] = torque[i];
    }
    rsp->quat[0] = g_ekf.x[EKF24_QW];
    rsp->quat[1] = g_ekf.x[EKF24_QX];
    rsp->quat[2] = g_ekf.x[EKF24_QY];
    rsp->quat[3] = g_ekf.x[EKF24_QZ];
    rsp->thrust = clampf(req->thrust, 0.0f, 1.0f);

    g_sink += rsp->pos[0] + rsp->vel[2] + rsp->torque[0] + rsp->quat[0];
}

ATTR_RAMFUNC static void run_ekf_only(const proto_request_t *req, float dt)
{
    ekf_full_update(req, dt);
    g_sink += g_ekf.x[EKF24_PN] + g_ekf.x[EKF24_VD];
}

ATTR_RAMFUNC static void run_ctrl_only(const proto_request_t *req, float dt)
{
    float torque[3];
    control_update(req, dt, torque);
    g_sink += torque[0] + torque[1] + torque[2];
}

static void measure(const proto_request_t *req, uint32_t iters,
                    uint32_t update_div, uint32_t mode,
                    proto_response_t *rsp)
{
    const float dt = clampf(req->dt, 0.0001f, 0.02f);

    const uint64_t t0 = mchtmr_get_count(HPM_MCHTMR);

    for (uint32_t i = 0; i < iters; i++) {
        if (mode == BENCH_MODE_EKF_ONLY) {
            run_ekf_only(req, dt);
        } else if (mode == BENCH_MODE_CTRL_ONLY) {
            run_ctrl_only(req, dt);
        } else {
            run_one(req, dt, i, update_div, rsp);
        }
    }

    const uint64_t t1 = mchtmr_get_count(HPM_MCHTMR);
    uint64_t ticks = t1 - t0;
    if (ticks == 0) {
        ticks = 1;
    }

    const uint32_t ns_per_iter = (uint32_t)(((ticks * 1000ULL) / 24ULL) / iters);

    rsp->iters = iters;
    rsp->total_ns = ns_per_iter;
    rsp->ekf_ns = (mode == BENCH_MODE_EKF_ONLY) ? ns_per_iter : 0u;
    rsp->ctrl_ns = (mode == BENCH_MODE_CTRL_ONLY) ? ns_per_iter : 0u;
    rsp->max_hz = (uint32_t)(((uint64_t)iters * MCHTMR_HZ) / ticks);
    rsp->status = 0;

    g_bench_hz = rsp->max_hz;
    g_bench_us = rsp->total_ns / 1000u;
    g_bench_iters = iters;
    g_bench_ekf_us = rsp->ekf_ns / 1000u;
    g_bench_ctrl_us = rsp->ctrl_ns / 1000u;
    for (uint32_t i = 0; i < 4; i++) {
        g_bench_quat[i] = rsp->quat[i];
    }
    for (uint32_t i = 0; i < 3; i++) {
        g_bench_pos[i] = rsp->pos[i];
    }
}

static void process_request(const proto_request_t *req, proto_response_t *rsp)
{
    memset(rsp, 0, sizeof(*rsp));
    rsp->magic = PROTO_MAGIC;
    rsp->version = PROTO_VERSION;
    rsp->type = req->type;

    if (req->magic != PROTO_MAGIC || req->version != PROTO_VERSION) {
        rsp->status = 1;
        return;
    }

    uint32_t iters = 1;
    if (req->type == PROTO_TYPE_BENCH
        || req->type == PROTO_TYPE_EKF_ONLY
        || req->type == PROTO_TYPE_CTRL_ONLY) {
        iters = req->bench_iters;
        if (iters == 0) {
            iters = 1;
        }
        if (iters > PROTO_MAX_BENCH_ITERS) {
            iters = PROTO_MAX_BENCH_ITERS;
        }
    }

    uint32_t mode = BENCH_MODE_COMBINED;
    if (req->type == PROTO_TYPE_EKF_ONLY) {
        mode = BENCH_MODE_EKF_ONLY;
    } else if (req->type == PROTO_TYPE_CTRL_ONLY) {
        mode = BENCH_MODE_CTRL_ONLY;
    }

    measure(req, iters, req->update_div, mode, rsp);
}

/*
 * Startup self-test: combined EKF + control, full aiding updates.
 * The result is stored in g_bench_* so it can be read through the debugger
 * even when no WinUSB/UART host is attached.
 */
static void selftest(void)
{
    proto_request_t req;
    proto_response_t rsp;

    memset(&req, 0, sizeof(req));
    memset(&rsp, 0, sizeof(rsp));

    req.magic = PROTO_MAGIC;
    req.version = PROTO_VERSION;
    req.type = PROTO_TYPE_BENCH;
    req.dt = 0.001f;
    req.gyro[0] = 0.01f;
    req.gyro[1] = -0.02f;
    req.gyro[2] = 0.005f;
    req.accel[0] = 0.1f;
    req.accel[1] = 0.2f;
    req.accel[2] = -9.80665f;
    req.mag[0] = 0.2f;
    req.mag[1] = 0.0f;
    req.mag[2] = 0.4f;
    req.baro_alt = 0.0f;
    req.rate_sp[0] = 0.1f;
    req.rate_sp[1] = 0.0f;
    req.rate_sp[2] = -0.05f;
    req.thrust = 0.5f;
    req.bench_iters = 1000;
    req.update_div = 1;

    measure(&req, req.bench_iters, req.update_div, BENCH_MODE_COMBINED, &rsp);

    printf("selftest: %lu us/iter, %lu Hz, status %lu\r\n",
           (unsigned long)g_bench_us,
           (unsigned long)g_bench_hz,
           (unsigned long)rsp.status);
}

int main(void)
{
    proto_request_t req;
    proto_response_t rsp;

    board_init();

#if !USE_UART3
    intc_set_irq_priority(CONFIG_HPM_USBD_IRQn, 1);
#endif

    ekf24_init(&g_ekf);
    rate_control_init(&g_rate);

    printf("HPM6E8Y single-core EKF24 rate-control benchmark\r\n");
    printf("transport: %s\r\n", USE_UART3 ? "UART3 @ 2M" : "CherryUSB WinUSB");

    selftest();

    transport_init();

    while (1) {
        if (transport_read(&req)) {
            process_request(&req, &rsp);

            while (transport_write(&rsp) != 0) {
                board_delay_us(10);
            }
        }
    }
}

