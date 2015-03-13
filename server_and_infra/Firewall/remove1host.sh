#!/bin/bash
echo -n "IP:"
read IP
iptables-save | grep -i $IP
iptables -D INPUT -d $IP -j ACCEPT
iptables -D OUTPUT -s $IP -j ACCEPT
iptables -D INPUT -s $IP -j ACCEPT
iptables -D OUTPUT -d $IP -j ACCEPT

