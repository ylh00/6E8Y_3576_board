/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "rate_control.h"

#include <math.h>

#define RATE_CONTROL_PI      3.14159265358979323846f
#define RATE_ERROR_400DEG    (400.0f * RATE_CONTROL_PI / 180.0f)

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

void rate_control_init(rate_control_t *ctrl)
{
    /* PX4 default MC_*RATE_P/I/D gains (K = 1). */
    const float kp = 0.15f;
    const float ki = 0.20f;
    const float kd = 0.003f;

    for (int i = 0; i < 3; i++) {
        ctrl->kp[i] = kp;
        ctrl->ki[i] = ki;
        ctrl->kd[i] = kd;
        ctrl->kff[i] = 0.0f;
        ctrl->int_lim[i] = 0.30f;
        ctrl->integral[i] = 0.0f;
    }
}

void rate_control_reset(rate_control_t *ctrl)
{
    for (int i = 0; i < 3; i++) {
        ctrl->integral[i] = 0.0f;
    }
}

void rate_control_update(rate_control_t *ctrl,
                         const float rate[3],
                         const float rate_sp[3],
                         const float angular_accel[3],
                         float dt,
                         float torque[3])
{
    float rate_error[3];

    for (int i = 0; i < 3; i++) {
        rate_error[i] = rate_sp[i] - rate[i];

        torque[i] = ctrl->kp[i] * rate_error[i]
                  + ctrl->integral[i]
                  - ctrl->kd[i] * angular_accel[i]
                  + ctrl->kff[i] * rate_sp[i];
    }

    for (int i = 0; i < 3; i++) {
        float i_factor = rate_error[i] / RATE_ERROR_400DEG;
        i_factor = 1.0f - i_factor * i_factor;
        if (i_factor < 0.0f) {
            i_factor = 0.0f;
        }

        float integral = ctrl->integral[i]
                       + i_factor * ctrl->ki[i] * rate_error[i] * dt;

        ctrl->integral[i] = clampf(integral,
                                   -ctrl->int_lim[i],
                                   ctrl->int_lim[i]);
    }

    for (int i = 0; i < 3; i++) {
        torque[i] = clampf(torque[i], -1.0f, 1.0f);
    }
}
