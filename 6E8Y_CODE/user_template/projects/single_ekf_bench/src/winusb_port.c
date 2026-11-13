/*
 * Copyright (c) 2026 HPMicro
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * CherryUSB WinUSB 2.0 transport, derived from the HPM SDK
 * samples/cherryusb/device/winusb/winusb20 example (single interface).
 */

#include "usb_config.h"

#if !USE_UART3

#include <string.h>

#include "usbd_core.h"
#include "transport.h"

#define USBD_WINUSB_VENDOR_CODE 0x17

#define WINUSB_IN_EP   0x81
#define WINUSB_OUT_EP  0x01

/* Keep HPMicro VID; the PID is project-specific to avoid a WCID clash. */
#define EKF_USBD_VID   0x34B7
#define EKF_USBD_PID   0xEAF1
#define EKF_USBD_MAX_POWER 200

#define USB_CONFIG_SIZE (9 + 9 + 7 + 7)

static const uint8_t USBD_WinUSBDescriptorSetDescriptor[] = {
    USB_MSOSV2_COMP_ID_SET_HEADER_DESCRIPTOR_INIT(USB_MSOSV2_COMP_ID_FUNCTION_WINUSB_SINGLE_DESCRIPTOR_LEN + 10),
    USB_MSOSV2_COMP_ID_FUNCTION_WINUSB_SINGLE_DESCRIPTOR_INIT(),
};

static const uint8_t USBD_BinaryObjectStoreDescriptor[] = {
    USB_BOS_HEADER_DESCRIPTOR_INIT(5 + USB_BOS_CAP_PLATFORM_WINUSB_DESCRIPTOR_LEN, 1),
    USB_BOS_CAP_PLATFORM_WINUSB_DESCRIPTOR_INIT(USBD_WINUSB_VENDOR_CODE,
                                                sizeof(USBD_WinUSBDescriptorSetDescriptor)),
};

static const struct usb_msosv2_descriptor msosv2_desc = {
    .vendor_code = USBD_WINUSB_VENDOR_CODE,
    .compat_id = USBD_WinUSBDescriptorSetDescriptor,
    .compat_id_len = sizeof(USBD_WinUSBDescriptorSetDescriptor),
};

static const struct usb_bos_descriptor bos_desc = {
    .string = USBD_BinaryObjectStoreDescriptor,
    .string_len = sizeof(USBD_BinaryObjectStoreDescriptor),
};

static const uint8_t device_descriptor[] = {
    USB_DEVICE_DESCRIPTOR_INIT(USB_2_1, 0x00, 0x00, 0x00, EKF_USBD_VID, EKF_USBD_PID, 0x0100, 0x01),
};

static const uint8_t config_descriptor_hs[] = {
    USB_CONFIG_DESCRIPTOR_INIT(USB_CONFIG_SIZE, 1, 0x01, USB_CONFIG_BUS_POWERED, EKF_USBD_MAX_POWER),
    USB_INTERFACE_DESCRIPTOR_INIT(0x00, 0x00, 0x02, 0xFF, 0xFF, 0x00, 0x04),
    USB_ENDPOINT_DESCRIPTOR_INIT(WINUSB_IN_EP, USB_ENDPOINT_TYPE_BULK, USB_BULK_EP_MPS_HS, 0x00),
    USB_ENDPOINT_DESCRIPTOR_INIT(WINUSB_OUT_EP, USB_ENDPOINT_TYPE_BULK, USB_BULK_EP_MPS_HS, 0x00),
};

static const uint8_t config_descriptor_fs[] = {
    USB_CONFIG_DESCRIPTOR_INIT(USB_CONFIG_SIZE, 1, 0x01, USB_CONFIG_BUS_POWERED, EKF_USBD_MAX_POWER),
    USB_INTERFACE_DESCRIPTOR_INIT(0x00, 0x00, 0x02, 0xFF, 0xFF, 0x00, 0x04),
    USB_ENDPOINT_DESCRIPTOR_INIT(WINUSB_IN_EP, USB_ENDPOINT_TYPE_BULK, USB_BULK_EP_MPS_FS, 0x00),
    USB_ENDPOINT_DESCRIPTOR_INIT(WINUSB_OUT_EP, USB_ENDPOINT_TYPE_BULK, USB_BULK_EP_MPS_FS, 0x00),
};

static const uint8_t device_quality_descriptor[] = {
    0x0A,
    USB_DESCRIPTOR_TYPE_DEVICE_QUALIFIER,
    0x00, 0x02,
    0x00, 0x00,
    0x00, 0x40,
    0x00, 0x00,
};

static const char *string_descriptors[] = {
    (const char[]){ 0x09, 0x04 },
    "HPMicro",
    "HPM EKF24 Bench",
    "EKF24-0001",
};

static const uint8_t *device_descriptor_callback(uint8_t speed)
{
    (void)speed;
    return device_descriptor;
}

static const uint8_t *config_descriptor_callback(uint8_t speed)
{
    return (speed == USB_SPEED_HIGH) ? config_descriptor_hs : config_descriptor_fs;
}

static const uint8_t *device_quality_descriptor_callback(uint8_t speed)
{
    (void)speed;
    return device_quality_descriptor;
}

static const char *string_descriptor_callback(uint8_t speed, uint8_t index)
{
    (void)speed;
    if (index >= (sizeof(string_descriptors) / sizeof(string_descriptors[0]))) {
        return NULL;
    }
    return string_descriptors[index];
}

static const struct usb_descriptor winusb_descriptor = {
    .device_descriptor_callback = device_descriptor_callback,
    .config_descriptor_callback = config_descriptor_callback,
    .device_quality_descriptor_callback = device_quality_descriptor_callback,
    .string_descriptor_callback = string_descriptor_callback,
    .msosv2_descriptor = &msosv2_desc,
    .bos_descriptor = &bos_desc,
};

static USB_NOCACHE_RAM_SECTION USB_MEM_ALIGNX uint8_t s_usb_rx_buf[512];
static USB_NOCACHE_RAM_SECTION USB_MEM_ALIGNX uint8_t s_usb_tx_buf[256];

static volatile uint8_t s_usb_configured;
static volatile uint8_t s_usb_rx_ready;
static volatile uint8_t s_usb_tx_busy;

static proto_request_t s_usb_req;

/* Debug counters, readable through the debugger. */
volatile uint32_t g_usb_out_count;
volatile uint32_t g_usb_out_len;
volatile uint32_t g_usb_in_count;
volatile uint32_t g_usb_in_len;
volatile uint32_t g_usb_configured_count;

static void usbd_event_handler(uint8_t busid, uint8_t event)
{
    switch (event) {
    case USBD_EVENT_RESET:
    case USBD_EVENT_DISCONNECTED:
        s_usb_configured = 0;
        s_usb_tx_busy = 0;
        s_usb_rx_ready = 0;
        break;

    case USBD_EVENT_CONFIGURED:
        s_usb_configured = 1;
        s_usb_tx_busy = 0;
        s_usb_rx_ready = 0;
        g_usb_configured_count++;
        usbd_ep_start_read(busid, WINUSB_OUT_EP, s_usb_rx_buf, sizeof(s_usb_rx_buf));
        break;

    default:
        break;
    }
}

static void usbd_winusb_out(uint8_t busid, uint8_t ep, uint32_t nbytes)
{
    g_usb_out_count++;
    g_usb_out_len = nbytes;

    if (nbytes >= sizeof(proto_request_t)) {
        memcpy(&s_usb_req, s_usb_rx_buf, sizeof(s_usb_req));
        s_usb_rx_ready = 1;
    }

    usbd_ep_start_read(busid, ep, s_usb_rx_buf, sizeof(s_usb_rx_buf));
}

static void usbd_winusb_in(uint8_t busid, uint8_t ep, uint32_t nbytes)
{
    g_usb_in_count++;
    g_usb_in_len = nbytes;

    if ((nbytes % usbd_get_ep_mps(busid, ep)) == 0 && nbytes) {
        usbd_ep_start_write(busid, ep, NULL, 0);
    } else {
        s_usb_tx_busy = 0;
    }
}

static struct usbd_endpoint winusb_out_ep = {
    .ep_addr = WINUSB_OUT_EP,
    .ep_cb = usbd_winusb_out,
};

static struct usbd_endpoint winusb_in_ep = {
    .ep_addr = WINUSB_IN_EP,
    .ep_cb = usbd_winusb_in,
};

static struct usbd_interface winusb_intf;

int transport_init(void)
{
    usbd_desc_register(0, &winusb_descriptor);
    usbd_add_interface(0, &winusb_intf);
    usbd_add_endpoint(0, &winusb_out_ep);
    usbd_add_endpoint(0, &winusb_in_ep);
    usbd_initialize(0, CONFIG_HPM_USBD_BASE, usbd_event_handler);
    return 0;
}

int transport_read(proto_request_t *req)
{
    if (!s_usb_rx_ready) {
        return 0;
    }

    *req = s_usb_req;
    s_usb_rx_ready = 0;
    return 1;
}

int transport_write(const proto_response_t *rsp)
{
    if (!s_usb_configured || s_usb_tx_busy) {
        return -1;
    }

    memcpy(s_usb_tx_buf, rsp, sizeof(*rsp));
    s_usb_tx_busy = 1;
    usbd_ep_start_write(0, WINUSB_IN_EP, s_usb_tx_buf, sizeof(*rsp));
    return 0;
}

#endif /* !USE_UART3 */
