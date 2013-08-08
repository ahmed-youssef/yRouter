#!/bin/sh

# reload instead of restart seems to be causing problems with ssh
/etc/init.d/network reload
/etc/init.d/firewall reload
/etc/init.d/dnsmasq reload
