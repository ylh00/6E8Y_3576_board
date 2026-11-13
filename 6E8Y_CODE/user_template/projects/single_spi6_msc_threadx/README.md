# single_spi6_msc_threadx

ThreadX (core0) SPI6 GD25B512ME → CherryUSB MSC U-disk.

Shared driver and full documentation: [../../spi6_msc/README.md](../../spi6_msc/README.md).

- Board: `hpm6e8ydemo`
- Build: `flash_xip`, Release
- USB: VID/PID `34B7:EAF2`
- MSC: `CONFIG_USBDEV_MSC_THREAD`, own ThreadX thread
- `tx_user.h`: `TX_TIMER_TICKS_PER_SECOND = 1000`
