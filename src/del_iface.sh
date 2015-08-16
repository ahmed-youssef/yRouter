#!/bin/sh

# Author: Ahmed Youssef
# Date: April 2015
# This script is used by the WGINI server to delete
# the wlan interface that was created for the yRouter

# takes as input the interface name.

NAME=$1

uci delete network.$NAME
uci delete wireless.$NAME
uci delete dhcp.$NAME
uci delete firewall.z_$NAME
uci delete firewall.r_$NAME

uci commit
/root/bin/restart_net
