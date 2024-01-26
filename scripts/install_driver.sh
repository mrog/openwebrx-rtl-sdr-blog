#!/bin/bash -e
# Installs the driver for rtl-sdr blog v4 (https://www.rtl-sdr.com/V4/)

# Install prereqs
apt update
apt -y install libusb-1.0-0-dev git cmake pkg-config
apt -y install debhelper

# Build the driver
cd /tmp
git clone https://github.com/rtlsdrblog/rtl-sdr-blog
cd rtl-sdr-blog
dpkg-buildpackage -b --no-sign
cd ..

# Install the driver
dpkg -i librtlsdr0_*.deb
dpkg -i librtlsdr-dev_*.deb
dpkg -i rtl-sdr_*.deb

