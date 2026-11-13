# SPI6 GD25 U-disk (CherryUSB MSC)

三个单核（core0）工程，把挂在 SPI6 上的 GD25B512ME（64 MByte）做成 Windows 可识别的 U 盘：

| 工程 | 运行方式 | MSC 处理方式 |
|---|---|---|
| `single_spi6_msc` | 裸机 | `CONFIG_USBDEV_MSC_POLLING`，主循环处理 MSC |
| `single_spi6_msc_threadx` | ThreadX | `CONFIG_USBDEV_MSC_THREAD`，MSC 独立线程 |
| `single_spi6_msc_rtthread` | RT-Thread Nano | `CONFIG_USBDEV_MSC_THREAD`，MSC 独立线程 |

三个工程共用 `user_template/spi6_msc` 下的驱动和 MSC 代码，均只使用 core0。

## 硬件连接

hpm6e8ydemo / HPM6E8Y，SPI6 四线：

| 信号 | 引脚 |
|---|---|
| SCLK | PB20 |
| /CS | PB21（GPIO 软件片选） |
| MISO | PB22 |
| MOSI | PB23 |
| 电源 | 3.3V / GND |

GD25B512ME：64 MByte，4 KiB 扇区，256 Byte 页，JEDEC ID `C8 40 19`。

## 关于 SPI 方式

先按 HPM SDK 的 `hpm_serial_nor` + SPI6 外设做过硬件 SPI 版本，但这块板子的四线接法下，SPI6 外设读回一直是 `0x00` / `0xFF`；同一组引脚切到 GPIO 做 bit-bang，JEDEC 能稳定读到 `C8 40 19`。因此当前实现使用**软件 SPI（bit-bang）驱动这四个引脚**，保证功能可用。

- 驱动位置：`spi6_msc/spi6_nor.c`
- 命令：`0x9F` JEDEC、`0x05` 读状态、`0x06` 写使能、`0x13` 4 字节地址读、`0x12` 4 字节地址页编程、`0x21` 4 字节地址 4 KiB 扇区擦除。
- 速度约 60–70 KB/s（1 MB 文件写入约 16 s），适合功能验证；如果需要高速，需要再排查 SPI6 外设 MISO/时钟问题或改用 XPI/DMA。

## MSC 设计

- 块大小 512 Byte，容量 64 MiB，块数 131072。
- NOR 不能覆盖写，所以用 4 KiB 写回缓存：
  - 512 Byte 写先读-改-写缓存中的 4 KiB 扇区；
  - 切换到另一个 4 KiB 扇区时擦除并编程上一个扇区；
  - 裸机工程每秒调用一次 `msc_spi6_flush()`，RTOS 工程靠扇区切换刷新。
- 裸机使用 `CONFIG_USBDEV_MSC_POLLING=1`，避免在 USB 中断里做几十毫秒的擦除。
- ThreadX / RT-Thread 使用 `CONFIG_USBDEV_MSC_THREAD=1`，把 MSC 读写放到独立线程。
- USB VID/PID：`0x34B7 / 0xEAF2`，产品字符串 `HPM SPI6 GD25 MSC`。

## 构建

Board：`hpm6e8ydemo`，Build Type：`flash_xip`，Release。

### 裸机

```powershell
cmake -GNinja -DBOARD=hpm6e8ydemo -DHPM_BUILD_TYPE=flash_xip `
      -DCMAKE_BUILD_TYPE=release `
      -DBOARD_SEARCH_PATH=D:\v113test\sdk_env_v1.13.0\user_template\boards `
      -B build -S user_template/projects/single_spi6_msc
ninja -C build
```

### ThreadX

```powershell
cmake ... -B build_threadx -S user_template/projects/single_spi6_msc_threadx
ninja -C build_threadx
```

### RT-Thread

```powershell
cmake ... -B build_rtthread -S user_template/projects/single_spi6_msc_rtthread
ninja -C build_rtthread
```

GUI 中直接选对应的 Application 即可。三个工程都不依赖 Andes 工具链或 hpm_math，使用 SDK 默认 GCC 即可。

## 实测结果

在 hpm6e8ydemo 上依次烧录三个工程，Windows 均枚举为 64 MB USB 大容量存储设备，盘符 `F:`：

- 裸机：格式化为 FAT16（卷标 `SPI6GD25`），64 KiB / 1 MiB 文件写入后 SHA256 一致。
- ThreadX：64 KiB 文件写入后 SHA256 一致。
- RT-Thread：64 KiB 文件写入后 SHA256 一致。

测试文件已从 U 盘删除，当前 U 盘为空的 FAT16 卷。

## 说明

- 没有修改 SDK 启动文件、链接脚本、板级文件或任何现有工程。
- ThreadX 工程把 `tx_user.h` 和 `usb_osal_threadx.c` 复制到工程内（后者补了 `usb_util.h` 以解决 `USB_ALIGN_UP` 未定义），没有改 SDK 原文件。
- RT-Thread 工程复用 `dual_rtthread` 的 `rtconfig.h`，只新增工程文件。
- 当前板子上运行的是裸机 `single_spi6_msc`，U 盘可直接读写。
