#!/bin/bash
echo -e "\n############\n\nFECHAR GUARDA...\n\n"

/etc/init.d/firewall.sh

/etc/init.d/portmap start > /dev/null 2>&1 && echo -e "PORTMAP subiu ..."
/etc/init.d/nfs-kernel-server start > /dev/null 2>&1 && echo -e "NFS-KERNEL-SERVER subiu ..."
/etc/init.d/nfs-common start > /dev/null 2>&1 && echo -e "NFS-COMMON subiu ..."
killall inetd > /dev/null 2>&1 && echo -e "INETD subiu ..."
/etc/init.d/ssh start > /dev/null 2>&1 && echo -e "SSH subiu ..."
/etc/init.d/cups start > /dev/null 2>&1 && echo -e "CUPS subiu ..."
/etc/init.d/apache2 start > /dev/null 2>&1 && echo -e "APACHE2 subiu ..."
/etc/init.d/mysql start > /dev/null 2>&1 && echo -e "MYSQL subiu ..."
/etc/init.d/dictd start > /dev/null 2>&1 && echo -e "DICTD subiu ..."
/etc/init.d/privoxy start > /dev/null 2>&1 && echo -e "PRIVOXY subiu ..."
/etc/init.d/fam start > /dev/null 2>&1 && echo -e "FAMD subiu ...\n"

echo -e "\n##########\nnmap localhost\n\n"
nmap localhost

echo -e "\n##########\niptables -nL\n\n"
iptables -nL

echo -e "\n##########\nnetstat -anp\n\n"

netstat -anp | grep -i "ouça"

echo "Daemons ouvindo ... :)"
