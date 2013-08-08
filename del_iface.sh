#!/bin/sh

NAME=$1

uci delete network.$NAME
uci delete wireless.$NAME
uci delete dhcp.$NAME
uci delete firewall.z_$NAME
uci delete firewall.r_$NAME

uci commit
