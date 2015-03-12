#!/bin/bash
echo "Digite o seu ip:"
read IP
echo "Digite o ip da vm:"
read IPVM
echo "Digite a porta da sua máquina:"
read PORTA
echo "Digite a porta da vm:"
read PORTAVM

iptables -t nat -A PREROUTING -d $IP -p tcp --dport  $PORTA -j DNAT --to $IPVM:$PORTAVM
iptables -t nat -A POSTROUTING -d $IPVM -p tcp --sport $PORTAVM -j SNAT --to  $IP:$PORTA

echo "Feito ;)"
