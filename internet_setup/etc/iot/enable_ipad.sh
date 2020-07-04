#!/bin/sh

device="iPad"
mac="80:E6:50:35:6B:C5"
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



