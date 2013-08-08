#!/bin/sh

NAME=t$1
IFACE_IP=$2

ZONE_NAME=z_$NAME

echo Configuring Network
# Configure network
uci set network.$NAME=interface
uci set network.$NAME.proto=static
uci set network.$NAME.ipaddr=$IFACE_IP
uci set network.$NAME.netmask=255.255.255.0

echo Configuring Wi-fi
# Configure Wi-Fi
uci set wireless.$NAME=wifi-iface
uci set wireless.$NAME.ifname=$NAME
uci set wireless.$NAME.device=radio0
uci set wireless.$NAME.mode=ap
uci set wireless.$NAME.network=$NAME
uci set wireless.$NAME.ssid="$(uci get system.@system[0].hostname)_$NAME"
uci set wireless.$NAME.encryption=none
 
echo Configure DHCP for network
uci set dhcp.$NAME=dhcp
uci set dhcp.$NAME.interface=$NAME
uci set dhcp.$NAME.start=50
uci set dhcp.$NAME.limit=200
uci set dhcp.$NAME.leasetime=1h
 
echo Configure firewall for network
uci set firewall.$ZONE_NAME=zone
uci set firewall.$ZONE_NAME.name=$NAME
uci set firewall.$ZONE_NAME.network=$NAME
uci set firewall.$ZONE_NAME.input=DROP
uci set firewall.$ZONE_NAME.forward=DROP
uci set firewall.$ZONE_NAME.output=ACCEPT

#Allow DHCP
uci set firewall.r_$NAME=rule
uci set firewall.r_$NAME.src=$NAME
uci set firewall.r_$NAME.src_port=67-68
uci set firewall.r_$NAME.dest_port=67-68
uci set firewall.r_$NAME.proto=udp
uci set firewall.r_$NAME.target=ACCEPT

uci commit

echo Restarting network

/etc/init.d/network restart
/etc/init.d/firewall restart
/etc/init.d/dnsmasq restart
/etc/init.d/dnsmasq restart