#!/bin/bash

IPTABLES=`which iptables`

case $1 in
    abre)
	$IPTABLES -D INPUT -s 192.168.0.0/24 -p tcp --dport 22000 -j ACCEPT
	$IPTABLES -A INPUT -p tcp --dport 22000 -j ACCEPT
	$IPTABLES -D OUTPUT -d 192.168.0.0/24 -p tcp --sport 22000 -j ACCEPT
	$IPTABLES -A OUTPUT -p tcp --sport 22000 -j ACCEPT
	echo "SSH liberado, porta 22000 :D" 
	;;
    fecha)
	$IPTABLES -A INPUT -s 192.168.0.0/24 -p tcp --dport 22000 -j ACCEPT
	$IPTABLES -D INPUT -p tcp --dport 22000 -j ACCEPT
	$IPTABLES -A OUTPUT -d 192.168.0.0/24 -p tcp --sport 22000 -j ACCEPT
	$IPTABLES -D OUTPUT -p tcp --sport 22000 -j ACCEPT
	echo "SSH fechado, porta 22000 :D"
	;;
    *)
	echo "Você tem de entrar com um parâmetro válido" 
	echo "Sintaxe: ./libera_ssh.sh <abre|fecha>"
	;;
esac
