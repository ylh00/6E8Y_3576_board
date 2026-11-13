/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * PX4 multicopter rate-control law (simplified, same structure as
 * PX4-Autopilot/src/lib/rate_control):
 *
 *   torque = Kp * rate_error + integral - Kd * angular_accel + Kff * rate_sp
 *   integral += i_factor * Ki * rate_error * dt
 *
 * The i_factor reduces the integrator for large rate errors, as in PX4.
 */

#ifndef RATE_CONTROL_H
#define RATE_CONTROL_H

typedef struct {
    float kp[3];
    float ki[3];
    float kd[3];
    float kff[3];
    float int_lim[3];
    float integral[3];
} rate_control_t;

void rate_control_init(rate_control_t *ctrl);

void rate_control_update(rate_control_t *ctrl,
                         const float rate[3],
                         const float rate_sp[3],
                         const float angular_accel[3],
                         float dt,
                         float torque[3]);

void rate_control_reset(rate_control_t *ctrl);

#endif /* RATE_CONTROL_H */
