#!/bin/bash
echo -n "IP:"
read IP
iptables -A INPUT -d $IP -j ACCEPT
iptables -A OUTPUT -s $IP -j ACCEPT
iptables -A INPUT -s $IP -j ACCEPT
iptables -A OUTPUT -d $IP -j ACCEPT
