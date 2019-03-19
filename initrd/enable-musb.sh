#! /bin/sh

set -e

if [ ! -d /sys/kernel/config/usb_gadget/g_multi/ ] ; then
    mkdir -p /sys/kernel/config/usb_gadget/g_multi || true
    cd /sys/kernel/config/usb_gadget/g_multi

    echo 0x0404 > bcdDevice # device revision
    echo 0x0200 > bcdUSB # USB 2.0
    echo 0x1d6b > idVendor # Linux Foundation
    echo 0x0104 > idProduct # Multifunction Composite Gadget

    mkdir -p strings/0x409

    echo 00000018 > strings/0x409/serialnumber
    echo UbuntuCore > strings/0x409/manufacturer
    echo "USB Device" > strings/0x409/product

	mkdir -p configs/c.1/strings/0x409
	echo "Config 1: ECM network" > configs/c.1/strings/0x409/configuration
	echo 500 > configs/c.1/MaxPower

	# serial
	mkdir -p functions/acm.usb0
	ln -s functions/acm.usb0 configs/c.1/

	# network
	mkdir -p functions/ecm.usb0
	echo "1C:BA:8C:A2:ED:72" > functions/ecm.usb0/host_addr
	echo "1C:BA:8C:A2:ED:73" > functions/ecm.usb0/dev_addr
	ln -s functions/ecm.usb0 configs/c.1/

	ls /sys/class/udc > UDC
fi
