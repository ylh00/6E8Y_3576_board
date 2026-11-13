#!/usr/bin/env python3
"""
PC-side WinUSB test tool for the HPM6E8Y 24-state EKF benchmark.

The firmware exposes a CherryUSB WinUSB device:
    VID 0x34B7, PID 0xEAF1, bulk OUT 0x01, bulk IN 0x81

This script uses libusb-1.0 through ctypes. On Windows, set LIBUSB_DLL to a
64-bit libusb-1.0.dll if it is not found automatically.

Usage:
    python ekf24_bench.py --iters 10000 --update-div 1
"""

import argparse
import ctypes
import os
import shutil
import struct
import sys

VID = 0x34B7
PID = 0xEAF1
EP_OUT = 0x01
EP_IN = 0x81

REQUEST_MAGIC = 0x32464B45
PROTO_VERSION = 2
TYPE_BENCH = 2
TYPE_EKF_ONLY = 3
TYPE_CTRL_ONLY = 4


class LibusbDeviceDescriptor(ctypes.Structure):
    _fields_ = [
        ("bLength", ctypes.c_uint8),
        ("bDescriptorType", ctypes.c_uint8),
        ("bcdUSB", ctypes.c_uint16),
        ("bDeviceClass", ctypes.c_uint8),
        ("bDeviceSubClass", ctypes.c_uint8),
        ("bDeviceProtocol", ctypes.c_uint8),
        ("bMaxPacketSize0", ctypes.c_uint8),
        ("idVendor", ctypes.c_uint16),
        ("idProduct", ctypes.c_uint16),
        ("bcdDevice", ctypes.c_uint16),
        ("iManufacturer", ctypes.c_uint8),
        ("iProduct", ctypes.c_uint8),
        ("iSerialNumber", ctypes.c_uint8),
        ("bNumConfigurations", ctypes.c_uint8),
    ]


def find_libusb():
    candidates = []
    env = os.environ.get("LIBUSB_DLL")
    if env:
        candidates.append(env)

    exe = shutil.which("libusb-1.0.dll")
    if exe:
        candidates.append(exe)

    here = os.path.dirname(os.path.abspath(__file__))
    candidates += [
        os.path.join(here, "libusb-1.0.dll"),
        r"C:\Windows\System32\libusb-1.0.dll",
        r"C:\Program Files\Oray\AweSun\flutter\libusb-1.0.dll",
        r"C:\Program Files (x86)\Steam\libusb-1.0.dll",
        r"C:\Program Files\Tencent\Weixin\4.2.0.12\libusb-1.0.dll",
    ]

    for path in candidates:
        if path and os.path.isfile(path):
            try:
                return ctypes.CDLL(path), path
            except OSError as exc:
                print("cannot load %s: %s" % (path, exc), file=sys.stderr)
    raise SystemExit(
        "libusb-1.0.dll not found. Set LIBUSB_DLL to a 64-bit libusb-1.0.dll."
    )


def build_request(iters, update_div=1, req_type=TYPE_BENCH):
    req = struct.pack("<IHH", REQUEST_MAGIC, PROTO_VERSION, req_type)
    req += struct.pack("<f", 0.001)
    req += struct.pack("<3f", 0.01, -0.02, 0.005)
    req += struct.pack("<3f", 0.1, 0.2, -9.80665)
    req += struct.pack("<3f", 0.2, 0.0, 0.4)
    req += struct.pack("<f", 0.0)
    req += struct.pack("<3f", 0.0, 0.0, 0.0)
    req += struct.pack("<3f", 0.0, 0.0, 0.0)
    req += struct.pack("<3f", 0.1, 0.0, -0.05)
    req += struct.pack("<f", 0.5)
    req += struct.pack("<II", iters, update_div)
    assert len(req) == 100
    return req


def parse_response(data):
    magic, version, typ = struct.unpack_from("<IHH", data, 0)
    pos = struct.unpack_from("<3f", data, 8)
    vel = struct.unpack_from("<3f", data, 20)
    quat = struct.unpack_from("<4f", data, 32)
    torque = struct.unpack_from("<3f", data, 48)
    thrust = struct.unpack_from("<f", data, 60)[0]
    total_ns, ekf_ns, ctrl_ns, hz, iters, status = struct.unpack_from("<IIIIII", data, 64)
    return dict(
        magic=magic, version=version, type=typ, pos=pos, vel=vel, quat=quat,
        torque=torque, thrust=thrust, total_ns=total_ns, ekf_ns=ekf_ns,
        ctrl_ns=ctrl_ns, hz=hz, iters=iters, status=status,
    )


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--iters", type=int, default=1000, help="benchmark iterations")
    parser.add_argument("--update-div", type=int, default=1,
                        help="0=prediction+control only, 1=every iteration, N=every N")
    parser.add_argument("--mode", choices=["both", "ekf", "ctrl"], default="both",
                        help="measure combined, EKF-only, or control-only")
    parser.add_argument("--timeout", type=int, default=15000, help="USB timeout in ms")
    args = parser.parse_args()

    lib, path = find_libusb()
    print("libusb:", path)

    lib.libusb_init.argtypes = [ctypes.POINTER(ctypes.c_void_p)]
    lib.libusb_init.restype = ctypes.c_int
    lib.libusb_get_device_list.argtypes = [ctypes.c_void_p,
                                           ctypes.POINTER(ctypes.POINTER(ctypes.c_void_p))]
    lib.libusb_get_device_list.restype = ctypes.c_ssize_t
    lib.libusb_free_device_list.argtypes = [ctypes.POINTER(ctypes.c_void_p), ctypes.c_int]
    lib.libusb_get_device_descriptor.argtypes = [ctypes.c_void_p,
                                                 ctypes.POINTER(LibusbDeviceDescriptor)]
    lib.libusb_get_device_descriptor.restype = ctypes.c_int
    lib.libusb_open.argtypes = [ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p)]
    lib.libusb_open.restype = ctypes.c_int
    lib.libusb_claim_interface.argtypes = [ctypes.c_void_p, ctypes.c_int]
    lib.libusb_claim_interface.restype = ctypes.c_int
    lib.libusb_bulk_transfer.argtypes = [ctypes.c_void_p, ctypes.c_uint8, ctypes.c_void_p,
                                         ctypes.c_int, ctypes.POINTER(ctypes.c_int),
                                         ctypes.c_uint]
    lib.libusb_bulk_transfer.restype = ctypes.c_int
    lib.libusb_close.argtypes = [ctypes.c_void_p]
    lib.libusb_exit.argtypes = [ctypes.c_void_p]

    ctx = ctypes.c_void_p()
    if lib.libusb_init(ctypes.byref(ctx)) != 0:
        raise SystemExit("libusb_init failed")

    devs = ctypes.POINTER(ctypes.c_void_p)()
    count = lib.libusb_get_device_list(ctx, ctypes.byref(devs))
    target = None
    for i in range(count):
        desc = LibusbDeviceDescriptor()
        if lib.libusb_get_device_descriptor(devs[i], ctypes.byref(desc)) == 0:
            if desc.idVendor == VID and desc.idProduct == PID:
                target = devs[i]
                break

    if target is None:
        print("device %04x:%04x not found" % (VID, PID))
        lib.libusb_free_device_list(devs, 1)
        lib.libusb_exit(ctx)
        raise SystemExit(2)

    handle = ctypes.c_void_p()
    if lib.libusb_open(target, ctypes.byref(handle)) != 0:
        raise SystemExit("libusb_open failed")
    if lib.libusb_claim_interface(handle, 0) != 0:
        raise SystemExit("libusb_claim_interface failed")

    req_type = {"both": TYPE_BENCH, "ekf": TYPE_EKF_ONLY, "ctrl": TYPE_CTRL_ONLY}[args.mode]
    req = build_request(args.iters, args.update_div, req_type)
    buf = ctypes.create_string_buffer(req, len(req))
    transferred = ctypes.c_int()
    rc = lib.libusb_bulk_transfer(handle, EP_OUT, buf, len(req),
                                  ctypes.byref(transferred), args.timeout)
    if rc != 0 or transferred.value != len(req):
        raise SystemExit("bulk OUT failed: rc=%d len=%d" % (rc, transferred.value))

    rbuf = ctypes.create_string_buffer(88)
    rc = lib.libusb_bulk_transfer(handle, EP_IN, rbuf, 88,
                                  ctypes.byref(transferred), args.timeout)
    if rc != 0 or transferred.value != 88:
        raise SystemExit("bulk IN failed: rc=%d len=%d" % (rc, transferred.value))

    result = parse_response(rbuf.raw[:88])
    print("magic: 0x%08x version: %d type: %d status: %d" %
          (result["magic"], result["version"], result["type"], result["status"]))
    print("pos    : %.6f %.6f %.6f" % result["pos"])
    print("vel    : %.6f %.6f %.6f" % result["vel"])
    print("quat   : %.6f %.6f %.6f %.6f" % result["quat"])
    print("torque : %.6f %.6f %.6f  thrust %.3f" %
          (result["torque"][0], result["torque"][1], result["torque"][2], result["thrust"]))
    print("iters  : %d" % result["iters"])
    print("total  : %.3f us/iter (%d ns)" % (result["total_ns"] / 1000.0, result["total_ns"]))
    if result["ekf_ns"]:
        print("ekf    : %.3f us/iter (%d ns)" % (result["ekf_ns"] / 1000.0, result["ekf_ns"]))
    if result["ctrl_ns"]:
        print("ctrl   : %.3f us/iter (%d ns)" % (result["ctrl_ns"] / 1000.0, result["ctrl_ns"]))
    print("max    : %d Hz" % result["hz"])

    lib.libusb_close(handle)
    lib.libusb_free_device_list(devs, 1)
    lib.libusb_exit(ctx)


if __name__ == "__main__":
    main()


