#!/bin/sh

# reload (NOT restart) seems to be causing problems with ssh
/etc/init.d/network restart
/etc/init.d/firewall restart
/etc/init.d/dnsmasq restart
