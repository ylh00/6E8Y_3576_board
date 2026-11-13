# single_ekf_bench

HPM6E8Y（HPM6E80，单核 core0）24 状态 EKF + 四旋翼角速率控制器的执行频率测试工程。

> 这是一个**性能测试工程**，不是可飞的 PX4 移植。EKF 采用与 PX4 EKF2 相同的 24 状态布局，但协方差传播/更新做了简化，用于测量 EKF+控制率在 HPM6E8Y 上的实际耗时。

## 目录

```text
single_ekf_bench/
├── CMakeLists.txt
├── README.md
├── pc/
│   └── ekf24_bench.py       # PC 侧 WinUSB 测试脚本
└── src/
    ├── main.c               # 协议、计时、自检、主循环
    ├── ekf24.c/.h           # 24 状态 EKF（24x24 协方差）
    ├── rate_control.c/.h    # PX4 风格角速率 PID + 前馈
    ├── winusb_port.c        # CherryUSB WinUSB 传输
    ├── uart_port.c          # UART3 @ 2M 备用传输
    └── protocol.h           # 100 字节请求 / 80 字节响应
```

## 24 状态定义

与 PX4 EKF2 的 24 状态向量一致：

| 索引 | 状态 |
|---|---|
| 0–3 | 四元数 w,x,y,z（body -> NED） |
| 4–6 | 速度 NED |
| 7–9 | 位置 NED |
| 10–12 | 陀螺零偏 |
| 13–15 | 加速度计零偏 |
| 16–18 | 地球坐标系磁场 |
| 19–20 | 风速 NE |
| 21–23 | 机体坐标系磁零偏 |

预测包含四元数积分、速度/位置积分、陀螺/加计零偏耦合，以及 `F P F^T + Q` 的完整 24×24 协方差传播。量测更新使用 GPS 位置/速度、气压高度、磁力计的顺序标量更新。

控制率参考 `PX4-Autopilot/src/lib/rate_control`：

```text
torque = Kp * rate_error + integral - Kd * angular_accel + Kff * rate_sp
integral += i_factor * Ki * rate_error * dt
```

默认增益为 PX4 的 `MC_*RATE_P = 0.15`、`I = 0.20`、`D = 0.003`，积分限幅 0.3。

## 工具链 / FPU / HPM Math

- 工具链：Andes `nds32le-elf-newlib-v5d`（`riscv32-elf-gcc` 14.2.0）
- 工具链默认架构：`rv32imfdc_zicsr_zifencei_xandes`，ABI `ilp32d`
- 工程内设置：`RV_ARCH=rv32imafdc`、`RV_ABI=ilp32d`
- FPU：已启用，反汇编中可见 `fadd.s` / `fmul.s` / `fmadd.s`
- HPM Math：`CONFIG_HPM_MATH=1`、`CONFIG_HPM_MATH_DSP=1`，链接 `mext-dsp/libdsp.a`
- 矩阵乘/转置使用 `riscv_dsp_mat_mul_f32()` / `riscv_dsp_mat_trans_f32()`
- 编译选项：`-O3`、`-mext-dsp`、`-ffast-math`
- EKF/控制热函数通过 `ATTR_RAMFUNC` 放到 ILM（`.fast`，约 2.3KB）

## 构建

### GUI

1. Board 选 `hpm6e8ydemo`
2. Application 选 `single_ekf_bench`
3. Build Type 选 `flash_xip`
4. Toolchain 选 `nds-gcc`，`GNURISCV_TOOLCHAIN_PATH` 指向 `D:\v113test\nds32le-elf-newlib-v5d`
5. Generate / Compile

### 命令行

```powershell
$env:GNURISCV_TOOLCHAIN_PATH = "D:\v113test\nds32le-elf-newlib-v5d"
$env:HPM_SDK_BASE = "D:\v113test\sdk_env_v1.13.0\hpm_sdk"
$env:HPM_SDK_TOOLCHAIN_VARIANT = "nds-gcc"

cmake -GNinja -DBOARD=hpm6e8ydemo -DHPM_BUILD_TYPE=flash_xip `
      -DCMAKE_BUILD_TYPE=release `
      -DBOARD_SEARCH_PATH=D:\v113test\sdk_env_v1.13.0\user_template\boards `
      -B build -S .
ninja -C build
```

UART3 备用传输：

```powershell
cmake ... -DUSE_UART3=ON ...
```

默认 `USE_UART3=OFF`，使用 CherryUSB WinUSB。

## 通信

### WinUSB（默认）

- VID/PID：`0x34B7 / 0xEAF1`
- 接口 0，Bulk OUT `0x01`，Bulk IN `0x81`
- Windows 会自动枚举为 “HPM EKF24 Bench”
- PC 侧脚本：

```powershell
python pc\ekf24_bench.py --iters 10000 --mode both
python pc\ekf24_bench.py --iters 10000 --mode ekf
python pc\ekf24_bench.py --iters 100000 --mode ctrl
```

脚本通过 `ctypes` 调用 `libusb-1.0.dll`；如未自动找到，设置：

```powershell
$env:LIBUSB_DLL = "C:\path\to\libusb-1.0.dll"
```

注意 Python 位数要和 `libusb-1.0.dll` 一致（建议 64 位 Python + 64 位 DLL）。

### UART3（备用）

- `USE_UART3=ON` 时使用 hpm6e8ydemo 的 console UART3
- 波特率：`BOARD_CONSOLE_UART_BAUDRATE` = 2,000,000
- 8N1，二进制 100 字节请求 / 88 字节响应
- 上电时 `board_init()` 会先打印启动文本，PC 侧按 magic 重新同步即可

## 协议

### PC -> FC：`proto_request_t`，100 字节

| 偏移 | 类型 | 字段 |
|---|---|---|
| 0 | u32 | magic = `0x32464B45` |
| 4 | u16 | version = 2 |
| 6 | u16 | type：1=单步，2=组合 benchmark，3=EKF-only，4=控制率-only |
| 8 | f32 | dt |
| 12 | f32[3] | gyro, rad/s |
| 24 | f32[3] | accel, m/s² |
| 36 | f32[3] | mag |
| 48 | f32 | baro_alt, m（向上为正） |
| 52 | f32[3] | gps_pos NED |
| 64 | f32[3] | gps_vel NED |
| 76 | f32[3] | rate_sp, rad/s |
| 88 | f32 | thrust, 0..1 |
| 92 | u32 | bench_iters |
| 96 | u32 | update_div：0=只预测+控制，1=每拍都做全部量测更新，N=每 N 拍更新一次 |

### FC -> PC：`proto_response_t`，88 字节

| 偏移 | 类型 | 字段 |
|---|---|---|
| 0 | u32 | magic |
| 4 | u16 | version |
| 6 | u16 | type |
| 8 | f32[3] | pos NED |
| 20 | f32[3] | vel NED |
| 32 | f32[4] | quat w,x,y,z |
| 48 | f32[3] | torque roll/pitch/yaw |
| 60 | f32 | thrust |
| 64 | u32 | total_ns：每拍总时间（ns） |
| 68 | u32 | ekf_ns：EKF-only 时间（type 3） |
| 72 | u32 | ctrl_ns：控制率-only 时间（type 4） |
| 76 | u32 | max_hz |
| 80 | u32 | iters |
| 84 | u32 | status |

## 实测结果（HPM6E8Y，core0，600MHz）

### EKF 全量更新 vs 控制率

10000 次 EKF-only / 100000 次 control-only：

| 测量项 | 每拍时间 | 等效频率 |
|---|---|---|
| EKF 全量更新（预测 + GPS 位置/速度 + 气压 + 磁） | **429.04 µs（429,040 ns）** | **2330 Hz** |
| 控制率解算（PX4 RateControl + 角加速度） | **0.326 µs（326 ns）** | **约 3.06 MHz** |
| EKF + 控制率组合 | **429.34 µs** | **2329 Hz** |

EKF 占整个循环的 99.9% 以上，控制率本身只有约 326ns（600MHz 下约 196 个周期）。

### update_div 对组合循环的影响

PC 端 `--iters 10000`，改变 `update_div` 得到：

| update_div | 每拍内容 | us/iter | 持续频率 |
|---|---|---|---|
| 0 | 24 状态预测 + 角速率控制，不做 GPS/气压/磁更新 | 228 | **约 4370–4430 Hz** |
| 10 | 每 10 拍做一次 GPS 位置/速度、气压、磁更新 | 246 | **约 4050 Hz** |
| 1 | 每拍都做全部量测更新（最坏情况） | 430 | **约 2322 Hz** |

因此：

- **纯 EKF 预测 + 控制率的最高循环频率约 4.37–4.43 kHz（约 228 µs/次）**。
- 按 10:1 做量测更新时约 **4.05 kHz**。
- 每拍都做全部量测更新的最坏情况约 **2.32 kHz（430 µs/次）**。
- 其中控制率解算仅 **0.326 µs**，EKF 全量更新约 **429.04 µs**，瓶颈在 EKF 协方差/量测更新。

启动自检固定使用 `update_div=1`（全部量测更新），所以 `g_bench_hz` 默认对应约 2.32kHz 的最坏情况。

启动自检还会把结果写入以下全局变量，便于无 PC 时用调试器读取：

```text
g_bench_hz    (地址随链接变化，以 nm 为准)
g_bench_us
g_bench_iters
g_bench_quat[4]
g_bench_pos[3]
```

## 说明/限制

- 这是简化版 EKF，不是 PX4 EKF2 的逐位移植；没有完整的气压/GPS 融合状态机、磁偏角估计、GSF、辅助源等。
- 频率包含：一次 24×24 协方差预测 + 可选 GPS 位置/速度、气压、磁力计更新 + 角速率控制。
- 测试期间 USB 无数据流量；WinUSB 中断本身不参与计时。
- 实际频率会随编译器版本、优化选项、cache/ILM 布局、EKF 量测更新次数变化。
- 未修改 SDK 启动文件、链接脚本、板级文件或任何现有工程；全部为本工程新增文件。
