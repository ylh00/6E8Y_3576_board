/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Compact 24-state EKF for the HPM6E8Y benchmark.
 *
 * State layout follows the PX4 EKF2 24-state vector:
 *   0..3   quaternion (w, x, y, z), body -> NED
 *   4..6   velocity NED (m/s)
 *   7..9   position NED (m)
 *   10..12 gyro bias (rad/s)
 *   13..15 accel bias (m/s^2)
 *   16..18 magnetic field in earth frame
 *   19..20 wind velocity NE (m/s)
 *   21..23 mag bias in body frame
 *
 * This is a simplified implementation intended for execution-time
 * benchmarking, not a bit-exact port of PX4 EKF2.
 */

#ifndef EKF24_H
#define EKF24_H

#include <stdint.h>

#define EKF24_N 24

typedef enum {
    EKF24_QW = 0,
    EKF24_QX,
    EKF24_QY,
    EKF24_QZ,

    EKF24_VN = 4,
    EKF24_VE,
    EKF24_VD,

    EKF24_PN = 7,
    EKF24_PE,
    EKF24_PD,

    EKF24_GBX = 10,
    EKF24_GBY,
    EKF24_GBZ,

    EKF24_ABX = 13,
    EKF24_ABY,
    EKF24_ABZ,

    EKF24_MEX = 16,
    EKF24_MEY,
    EKF24_MEZ,

    EKF24_WN = 19,
    EKF24_WE,

    EKF24_MBX = 21,
    EKF24_MBY,
    EKF24_MBZ
} ekf24_idx_t;

typedef struct {
    float x[EKF24_N];
    float P[EKF24_N * EKF24_N];
} ekf24_t;

typedef struct {
    float gyro[3];      /* rad/s */
    float accel[3];     /* m/s^2, specific force */
    float mag[3];       /* body frame */
    float baro_alt;     /* m, positive up */
    float gps_pos[3];   /* NED */
    float gps_vel[3];   /* NED */
    float dt;           /* seconds */
} ekf24_input_t;

void ekf24_init(ekf24_t *ekf);
void ekf24_predict(ekf24_t *ekf, const ekf24_input_t *in);

void ekf24_update_gps_pos(ekf24_t *ekf, const float pos[3], float R);
void ekf24_update_gps_vel(ekf24_t *ekf, const float vel[3], float R);
void ekf24_update_baro(ekf24_t *ekf, float alt, float R);
void ekf24_update_mag(ekf24_t *ekf, const float mag[3], float R);

void ekf24_get_euler(const ekf24_t *ekf, float *roll, float *pitch, float *yaw);

#endif /* EKF24_H */
