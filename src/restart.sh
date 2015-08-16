#!/bin/sh

# Author: Ahmed Youssef
# Date: April 2015

# Restarts networking on OpenWrt for changes in interface setup
# to take effect.

# reload (NOT restart) seems to be causing problems with ssh
/etc/init.d/network restart
/etc/init.d/firewall restart
/etc/init.d/dnsmasq restart
