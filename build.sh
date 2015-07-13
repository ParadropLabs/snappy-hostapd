#!/bin/bash
#
# Dependencies: libnl-3-dev libnl-genl-3-dev libssl-dev snappy-tools
#

test -d build || mkdir build

pkg-config --exists libnl-3.0
if [ $? -ne 0 ]; then
    echo "libnl-3 not found"
    echo "Try: sudo apt-get install libnl-3-dev"
    exit 1
fi

pkg-config --exists libnl-genl-3.0
if [ $? -ne 0 ]; then
    echo "libnl-genl-3 not found"
    echo "Try: sudo apt-get install libnl-genl-3-dev"
    exit 1
fi

pkg-config --exists libssl
if [ $? -ne 0 ]; then
    echo "libssl not found"
    echo "Try: sudo apt-get install libssl-dev"
    exit 1
fi

pushd build
if [ ! -d hostapd-2.4 ]; then
    wget http://w1.fi/releases/hostapd-2.4.tar.gz
    tar xvf hostapd-2.4.tar.gz
fi
pushd hostapd-2.4/hostapd
cp -v ../../../hostapd_build_config .config
make
popd
popd

test -d snap/bin || mkdir -p snap/bin
cp -v build/hostapd-2.4/hostapd/{hostapd,hostapd_cli} snap/bin/

snappy build snap

