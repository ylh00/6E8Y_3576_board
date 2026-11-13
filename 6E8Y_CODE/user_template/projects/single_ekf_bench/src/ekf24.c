/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "ekf24.h"

#include <math.h>
#include <string.h>

#include "hpm_math.h"

#define N               EKF24_N
#define GRAVITY_MSS     9.80665f
#define QUAT_EPS        1.0e-4f

/* F, F^T, F*P and the new P. Kept static to avoid a large stack frame. */
static float s_F[N * N];
static float s_FT[N * N];
static float s_FP[N * N];
static float s_Pnew[N * N];

/* Process noise spectral density (per second), added as q * dt. */
static const float s_qdiag[N] = {
    1.0e-7f, 1.0e-7f, 1.0e-7f, 1.0e-7f,     /* quaternion */
    1.0e-4f, 1.0e-4f, 1.0e-4f,              /* velocity */
    1.0e-6f, 1.0e-6f, 1.0e-6f,              /* position */
    1.0e-9f, 1.0e-9f, 1.0e-9f,              /* gyro bias */
    1.0e-7f, 1.0e-7f, 1.0e-7f,              /* accel bias */
    1.0e-8f, 1.0e-8f, 1.0e-8f,              /* mag earth */
    1.0e-6f, 1.0e-6f,                       /* wind */
    1.0e-9f, 1.0e-9f, 1.0e-9f                /* mag bias */
};

static void mat_identity(float *m)
{
    memset(m, 0, (size_t)N * N * sizeof(float));
    for (uint32_t i = 0; i < N; i++) {
        m[i * N + i] = 1.0f;
    }
}

ATTR_RAMFUNC static void mat_mul(const float *a, const float *b, float *c)
{
    riscv_dsp_mat_mul_f32(a, b, c, N, N, N);
}

ATTR_RAMFUNC static void mat_trans(const float *a, float *at)
{
    riscv_dsp_mat_trans_f32(a, at, N, N);
}

ATTR_RAMFUNC static void quat_normalize(float q[4])
{
    const float n = sqrtf(q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3]);

    if (n > 1.0e-12f) {
        const float inv = 1.0f / n;
        q[0] *= inv;
        q[1] *= inv;
        q[2] *= inv;
        q[3] *= inv;
    } else {
        q[0] = 1.0f;
        q[1] = 0.0f;
        q[2] = 0.0f;
        q[3] = 0.0f;
    }
}

/* Body -> NED rotation matrix, row major. */
ATTR_RAMFUNC static void quat_to_rot(const float q[4], float R[9])
{
    const float w = q[0];
    const float x = q[1];
    const float y = q[2];
    const float z = q[3];

    R[0] = 1.0f - 2.0f * (y * y + z * z);
    R[1] = 2.0f * (x * y - z * w);
    R[2] = 2.0f * (x * z + y * w);

    R[3] = 2.0f * (x * y + z * w);
    R[4] = 1.0f - 2.0f * (x * x + z * z);
    R[5] = 2.0f * (y * z - x * w);

    R[6] = 2.0f * (x * z - y * w);
    R[7] = 2.0f * (y * z + x * w);
    R[8] = 1.0f - 2.0f * (x * x + y * y);
}

ATTR_RAMFUNC static void rot_apply(const float R[9], const float v[3], float out[3])
{
    out[0] = R[0] * v[0] + R[1] * v[1] + R[2] * v[2];
    out[1] = R[3] * v[0] + R[4] * v[1] + R[5] * v[2];
    out[2] = R[6] * v[0] + R[7] * v[1] + R[8] * v[2];
}

void ekf24_init(ekf24_t *ekf)
{
    static const float p0[N] = {
        1.0e-3f, 1.0e-3f, 1.0e-3f, 1.0e-3f,
        1.0e-1f, 1.0e-1f, 1.0e-1f,
        1.0e-1f, 1.0e-1f, 1.0e-1f,
        1.0e-4f, 1.0e-4f, 1.0e-4f,
        1.0e-3f, 1.0e-3f, 1.0e-3f,
        1.0e-2f, 1.0e-2f, 1.0e-2f,
        1.0e-1f, 1.0e-1f,
        1.0e-3f, 1.0e-3f, 1.0e-3f
    };

    memset(ekf, 0, sizeof(*ekf));
    ekf->x[EKF24_QW] = 1.0f;
    ekf->x[EKF24_MEX] = 0.2f;
    ekf->x[EKF24_MEY] = 0.0f;
    ekf->x[EKF24_MEZ] = 0.4f;

    for (uint32_t i = 0; i < N; i++) {
        ekf->P[i * N + i] = p0[i];
    }
}

/*
 * Build F = d(x_dot)/dx for one prediction step.
 * The state transition is F = I + A * dt, with the sparse A entries below.
 */
ATTR_RAMFUNC static void ekf24_build_F(const ekf24_t *ekf, const ekf24_input_t *in, const float q[4], const float a_body[3])
{
    const float *x = ekf->x;
    const float dt = in->dt;

    const float wx = in->gyro[0] - x[EKF24_GBX];
    const float wy = in->gyro[1] - x[EKF24_GBY];
    const float wz = in->gyro[2] - x[EKF24_GBZ];

    mat_identity(s_F);

    /* Quaternion derivative: q_dot = 0.5 * q (x) omega. */
    const float O[4][4] = {
        { 0.0f, -wx,   -wy,   -wz  },
        { wx,    0.0f,  wz,   -wy  },
        { wy,   -wz,    0.0f,  wx  },
        { wz,    wy,   -wx,    0.0f}
    };
    for (uint32_t i = 0; i < 4; i++) {
        for (uint32_t j = 0; j < 4; j++) {
            s_F[i * N + j] += 0.5f * O[i][j] * dt;
        }
    }

    /*
     * d(q_dot)/d(gyro_bias) = -0.5 * Qb.
     * w = gyro - bias, so the bias derivative has a negative sign.
     */
    const float qw = q[0];
    const float qx = q[1];
    const float qy = q[2];
    const float qz = q[3];
    const float Qb[4][3] = {
        { -qx, -qy, -qz },
        {  qw,  qz, -qy },
        { -qz,  qw,  qx },
        {  qy, -qx,  qw }
    };
    for (uint32_t i = 0; i < 4; i++) {
        for (uint32_t j = 0; j < 3; j++) {
            s_F[i * N + (EKF24_GBX + j)] = -0.5f * Qb[i][j] * dt;
        }
    }

    /*
     * d(vel_ned)/d(q): finite difference of R(q) * a_body.
     * This keeps the attitude/velocity coupling without hand-derived
     * quaternion algebra.
     */
    for (uint32_t j = 0; j < 4; j++) {
        float qp[4] = { q[0], q[1], q[2], q[3] };
        float qm[4] = { q[0], q[1], q[2], q[3] };
        float Rp[9];
        float Rm[9];
        float ap[3];
        float am[3];

        qp[j] += QUAT_EPS;
        qm[j] -= QUAT_EPS;
        quat_normalize(qp);
        quat_normalize(qm);
        quat_to_rot(qp, Rp);
        quat_to_rot(qm, Rm);
        rot_apply(Rp, a_body, ap);
        rot_apply(Rm, a_body, am);

        for (uint32_t r = 0; r < 3; r++) {
            s_F[(EKF24_VN + r) * N + j] = (ap[r] - am[r]) / (2.0f * QUAT_EPS) * dt;
        }
    }

    /* d(vel_ned)/d(accel_bias) = -R * dt. */
    {
        float R[9];
        quat_to_rot(q, R);
        for (uint32_t r = 0; r < 3; r++) {
            for (uint32_t c = 0; c < 3; c++) {
                s_F[(EKF24_VN + r) * N + (EKF24_ABX + c)] = -R[r * 3 + c] * dt;
            }
        }
    }

    /* d(pos)/d(vel) = I * dt. */
    for (uint32_t r = 0; r < 3; r++) {
        s_F[(EKF24_PN + r) * N + (EKF24_VN + r)] = dt;
    }
}

ATTR_RAMFUNC void ekf24_predict(ekf24_t *ekf, const ekf24_input_t *in)
{
    float *x = ekf->x;
    const float dt = in->dt;

    float q[4] = { x[EKF24_QW], x[EKF24_QX], x[EKF24_QY], x[EKF24_QZ] };

    const float wx = in->gyro[0] - x[EKF24_GBX];
    const float wy = in->gyro[1] - x[EKF24_GBY];
    const float wz = in->gyro[2] - x[EKF24_GBZ];

    const float dqw = 0.5f * (-q[1] * wx - q[2] * wy - q[3] * wz);
    const float dqx = 0.5f * ( q[0] * wx + q[2] * wz - q[3] * wy);
    const float dqy = 0.5f * ( q[0] * wy - q[1] * wz + q[3] * wx);
    const float dqz = 0.5f * ( q[0] * wz + q[1] * wy - q[2] * wx);

    q[0] += dqw * dt;
    q[1] += dqx * dt;
    q[2] += dqy * dt;
    q[3] += dqz * dt;
    quat_normalize(q);

    x[EKF24_QW] = q[0];
    x[EKF24_QX] = q[1];
    x[EKF24_QY] = q[2];
    x[EKF24_QZ] = q[3];

    float R[9];
    float a_body[3];
    float a_ned[3];
    quat_to_rot(q, R);

    a_body[0] = in->accel[0] - x[EKF24_ABX];
    a_body[1] = in->accel[1] - x[EKF24_ABY];
    a_body[2] = in->accel[2] - x[EKF24_ABZ];

    rot_apply(R, a_body, a_ned);
    a_ned[2] += GRAVITY_MSS;

    for (uint32_t i = 0; i < 3; i++) {
        x[EKF24_VN + i] += a_ned[i] * dt;
    }
    for (uint32_t i = 0; i < 3; i++) {
        x[EKF24_PN + i] += x[EKF24_VN + i] * dt;
    }

    ekf24_build_F(ekf, in, q, a_body);

    mat_trans(s_F, s_FT);
    mat_mul(s_F, ekf->P, s_FP);
    mat_mul(s_FP, s_FT, s_Pnew);

    for (uint32_t i = 0; i < N; i++) {
        s_Pnew[i * N + i] += s_qdiag[i] * dt;
    }

    /* Keep P symmetric; this also limits round-off drift. */
    for (uint32_t i = 0; i < N; i++) {
        for (uint32_t j = i; j < N; j++) {
            const float v = 0.5f * (s_Pnew[i * N + j] + s_Pnew[j * N + i]);
            ekf->P[i * N + j] = v;
            ekf->P[j * N + i] = v;
        }
    }
}

/*
 * Sequential scalar Kalman update:
 *   S = H P H^T + R
 *   K = P H^T / S
 *   x += K * innovation
 *   P -= K * (H P)
 */
ATTR_RAMFUNC static void ekf24_scalar_update(ekf24_t *ekf, const float *h, float R, float innovation)
{
    float Ph[N];
    float K[N];
    float S = R;

    for (uint32_t i = 0; i < N; i++) {
        float s = 0.0f;
        for (uint32_t j = 0; j < N; j++) {
            s += ekf->P[i * N + j] * h[j];
        }
        Ph[i] = s;
        S += h[i] * Ph[i];
    }

    if (S < 1.0e-9f) {
        return;
    }

    const float inv_s = 1.0f / S;
    for (uint32_t i = 0; i < N; i++) {
        K[i] = Ph[i] * inv_s;
        ekf->x[i] += K[i] * innovation;
    }

    for (uint32_t i = 0; i < N; i++) {
        for (uint32_t j = 0; j < N; j++) {
            ekf->P[i * N + j] -= K[i] * Ph[j];
        }
    }

    for (uint32_t i = 0; i < N; i++) {
        for (uint32_t j = i; j < N; j++) {
            const float v = 0.5f * (ekf->P[i * N + j] + ekf->P[j * N + i]);
            ekf->P[i * N + j] = v;
            ekf->P[j * N + i] = v;
        }
    }
}

void ekf24_update_gps_pos(ekf24_t *ekf, const float pos[3], float R)
{
    float h[N] = { 0 };

    for (uint32_t i = 0; i < 3; i++) {
        h[EKF24_PN + i] = 1.0f;
        ekf24_scalar_update(ekf, h, R, pos[i] - ekf->x[EKF24_PN + i]);
        h[EKF24_PN + i] = 0.0f;
    }
}

void ekf24_update_gps_vel(ekf24_t *ekf, const float vel[3], float R)
{
    float h[N] = { 0 };

    for (uint32_t i = 0; i < 3; i++) {
        h[EKF24_VN + i] = 1.0f;
        ekf24_scalar_update(ekf, h, R, vel[i] - ekf->x[EKF24_VN + i]);
        h[EKF24_VN + i] = 0.0f;
    }
}

void ekf24_update_baro(ekf24_t *ekf, float alt, float R)
{
    float h[N] = { 0 };

    /* NED down position: altitude positive up -> pos_d = -alt. */
    h[EKF24_PD] = 1.0f;
    ekf24_scalar_update(ekf, h, R, -alt - ekf->x[EKF24_PD]);
}

void ekf24_update_mag(ekf24_t *ekf, const float mag[3], float R)
{
    float h[N] = { 0 };
    float R_bn[9];
    float mag_earth[3];

    const float q[4] = {
        ekf->x[EKF24_QW],
        ekf->x[EKF24_QX],
        ekf->x[EKF24_QY],
        ekf->x[EKF24_QZ]
    };

    quat_to_rot(q, R_bn);
    rot_apply(R_bn, mag, mag_earth);

    for (uint32_t i = 0; i < 3; i++) {
        h[EKF24_MEX + i] = 1.0f;
        ekf24_scalar_update(ekf, h, R, mag_earth[i] - ekf->x[EKF24_MEX + i]);
        h[EKF24_MEX + i] = 0.0f;
    }
}

void ekf24_get_euler(const ekf24_t *ekf, float *roll, float *pitch, float *yaw)
{
    const float w = ekf->x[EKF24_QW];
    const float x = ekf->x[EKF24_QX];
    const float y = ekf->x[EKF24_QY];
    const float z = ekf->x[EKF24_QZ];

    *roll = atan2f(2.0f * (w * x + y * z), 1.0f - 2.0f * (x * x + y * y));
    *pitch = asinf(2.0f * (w * y - z * x));
    *yaw = atan2f(2.0f * (w * z + x * y), 1.0f - 2.0f * (y * y + z * z));
}

