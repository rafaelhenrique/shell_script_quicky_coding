#!/bin/bash

case "$1" in
  start)
	iptables-restore /usr/local/src/firewall_iptables
	if [ $? -ne 0 ]; then
		STATUS="falhou"
	else
		STATUS="ativado com sucesso"
	fi

	echo -e "Ativando firewall: Firewall $STATUS"
	;;
  stop)
	iptables -F INPUT && iptables -F OUTPUT && echo -e "Flush no iptables...[FEITO]"
	iptables -P INPUT ACCEPT && iptables -P OUTPUT ACCEPT && echo -e "AVISO DE SEGURANCA: Cuidado voce esta com servicos ativos rodando sem firewall... :-o"
	;;
  restart)
        $0 stop
        sleep 1
        $0 start
        ;;
  *)
        echo "Usage: $0 {start|stop|restart|}" >&2
        exit 1
        ;;
esac

exit 0
