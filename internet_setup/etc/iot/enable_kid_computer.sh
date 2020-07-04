#!/bin/sh

device="MelanieDesktop"
mac="CC:3D:82:B1:1A:70"
chain="forwarding_rule"

# ipv4

for proto in "tcp" "udp"
do
  iptables -D "$chain" -m comment --comment "blocking $proto for $device" -p "$proto" -m mac --mac-source "$mac" -j REJECT
done
echo "---------------------------------------------"

# ipv6

for proto in "tcp" "udp"
do
  ip6tables -D "$chain" -m comment --comment "blocking $proto for $device" -p "$proto" -m mac --mac-source "$mac" -j REJECT
done
echo "---------------------------------------------"



