/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Fixed-size PC <-> FC protocol for the 24-state EKF/rate-control benchmark.
 * All multi-byte fields are little-endian. Both sides run on little-endian
 * CPUs, so the structures are used directly on the wire.
 */

#ifndef PROTOCOL_H
#define PROTOCOL_H

#include <stdint.h>

#define PROTO_MAGIC             0x32464B45u   /* "EKF2" */
#define PROTO_VERSION           2u

#define PROTO_TYPE_STEP         1u            /* one EKF + control iteration */
#define PROTO_TYPE_BENCH        2u            /* N combined iterations      */
#define PROTO_TYPE_EKF_ONLY     3u            /* N EKF full updates only    */
#define PROTO_TYPE_CTRL_ONLY    4u            /* N rate-control only        */

#define PROTO_MAX_BENCH_ITERS   100000u

#pragma pack(push, 1)

typedef struct {
    uint32_t magic;
    uint16_t version;
    uint16_t type;

    float dt;                 /* nominal loop period, seconds */
    float gyro[3];            /* rad/s, body frame */
    float accel[3];           /* m/s^2, body frame, specific force */
    float mag[3];             /* arbitrary unit, body frame */
    float baro_alt;           /* m, positive up */
    float gps_pos[3];         /* m, NED */
    float gps_vel[3];         /* m/s, NED */
    float rate_sp[3];         /* rad/s, roll/pitch/yaw */
    float thrust;             /* 0..1 */
    uint32_t bench_iters;     /* iterations for types 2/3/4 */
    uint32_t update_div;     /* 0=prediction+control only, 1=every iter, N=every N */
} proto_request_t;

typedef struct {
    uint32_t magic;
    uint16_t version;
    uint16_t type;

    float pos[3];             /* m, NED */
    float vel[3];             /* m/s, NED */
    float quat[4];            /* w, x, y, z */
    float torque[3];          /* roll, pitch, yaw, normalized */
    float thrust;             /* 0..1 */
    uint32_t total_ns;        /* measured average time per iteration, ns */
    uint32_t ekf_ns;          /* EKF-only time, valid for type 3, ns */
    uint32_t ctrl_ns;         /* control-only time, valid for type 4, ns */
    uint32_t max_hz;          /* 1e9 / total_ns */
    uint32_t iters;           /* number of iterations measured */
    uint32_t status;          /* 0 = ok */
} proto_response_t;

#pragma pack(pop)

#endif /* PROTOCOL_H */


