snappy-hostapd
==============

This package provides a Snappy framework for hosting wireless access points
through hostapd.

Building
========

To build the framework under Ubuntu, first install the dependency libraries:
    sudo apt-get install libnl-3-dev libnl-genl-3-dev libssl-dev

Also, install snappy-tools if you have not done so already:
    sudo add-apt-repository ppa:snappy-dev/tools
    sudo apt-get update
    sudo apt-get install snappy-tools

Then run the build script:
    ./build.sh

This should produce a snap file (hostapd_2.4_all.snap), which can be installed
on Ubuntu Snappy.

Sources
=======

[hostapd](https://w1.fi/hostapd/)

