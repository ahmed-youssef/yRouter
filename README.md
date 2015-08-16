# yRouter

yRouter is an open source user space software router that is used in the [Wireless GINI](https://github.com/ahmed-youssef/WirelessGINI) platform for node virtualization. It is an extension of the [gRouter](https://github.com/anrl/gini/tree/master/backend/src/grouter) but with several changes, namely:

- Removed dependencies on the packages that cannot be installed on OpenWrt.
- Added link virtualization support through the *tun* interface.
- Added support of deploying *wlan* interfaces that commodity wireless devices can connect to.

## Installation

It is recommended to [expand the storage capacity](https://www.arduino.cc/en/Tutorial/ExpandingYunDiskSpace) of the Arduino Yun if you are installing from source. 

1. ssh into the Arduino Yun:

`sshpass -p "arduino" ssh root@arduino.local`

2. Install the following packages:

```
opkg update
opkg install binutils
opkg install make
wget  http://downloads.arduino.cc/openwrtyun/1/packages/yun-gcc_4.6.2-2_ar71xx.ipk
opkg install yun-gcc_4.6.2-2_ar71xx.ipk
opkg install perl
opkg install screen
```

3. Install [libslack-0.6](http://www.libslack.org/).

4. Install yRouter:

```
cd /root/
git clone https://github.com/ahmed-youssef/yRouter.git
cd yRouter
./yInstall *StationID*
``` 

## Usage

Usage is the same as the [gRouter](https://github.com/anrl/gini/tree/master/backend/src/grouter) except for the new CLI commands, namely:

- ifconfig add -dev tun0 -dstip dst_ip -dstport portnum -addr IP_addr -hwaddr MAC: Creates a tun interface on the yRouter.
  - dst_ip: The IP address of the destination mesh station on the MBSS.
  - portnum: The interface number of the tun interface on the other end of the virtual link.
  - IP_addr : The virtual IP address of the tun interface.
  - MAC : The virtual MAC address of the tun interface.
- ifconfig add -dev wlan0 -addr IP addr [-ssid SSID]: Creates a wlan interface on the yRouter.
- IP_addr : The IP address of the wlan interface.
- SSID: The SSID of the wlan interface.

