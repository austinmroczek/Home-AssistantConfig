#!/bin/sh

device="iPad"
mac="80:E6:50:35:6B:C5"
chain="forwarding_rule"

# ipv4

for proto in "tcp" "udp"
do
  rule=$(iptables -L --line-numbers | grep -i "$mac" | grep "$proto" | awk '{print $1}')
  if [ "$rule" -gt 0 ] 2>/dev/null; then
    echo "Rule already exists"
    continue
  fi
  echo "blocking $proto for $device - $mac"
  iptables -A "$chain" -m comment --comment "blocking $proto for $device" -p "$proto" -m mac --mac-source "$mac" -j REJECT
done
echo "---------------------------------------------"

# ipv6

for proto in "tcp" "udp"
do
  rule=$(ip6tables -L --line-numbers | grep -i "$mac" | grep "$proto" | awk '{print $1}')
  if [ "$rule" -gt 0 ] 2>/dev/null; then
    echo "Rule already exists"
    continue
  fi
  echo "blocking $proto for $device - $mac"
  ip6tables -A "$chain" -m comment --comment "blocking $proto for $device" -p "$proto" -m mac --mac-source "$mac" -j REJECT
done
echo "---------------------------------------------"



