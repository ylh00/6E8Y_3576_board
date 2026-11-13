# single_spi6_msc_rtthread

RT-Thread Nano (core0) SPI6 GD25B512ME → CherryUSB MSC U-disk.

Shared driver and full documentation: [../../spi6_msc/README.md](../../spi6_msc/README.md).

- Board: `hpm6e8ydemo`
- Build: `flash_xip`, Release
- USB: VID/PID `34B7:EAF2`
- MSC: `CONFIG_USBDEV_MSC_THREAD`, own RT-Thread thread
- Console/RT-Thread config: `common/rtconfig.h`
