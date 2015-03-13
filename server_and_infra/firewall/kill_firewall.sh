#!/bin/bash
echo -e "\n############\n\nABRIR GUARDA...\n\n"

/etc/init.d/portmap stop > /dev/null 2>&1  && echo -e "PORTMAP baixou ..."
/etc/init.d/nfs-kernel-server stop > /dev/null 2>&1 && echo -e "NFS-KERNEL-SERVER baixou ..."
/etc/init.d/nfs-common stop > /dev/null 2>&1 && echo -e "NFS-COMMON baixou ..."
killall inetd > /dev/null  2>&1 && echo -e "INETD baixou ..."
/etc/init.d/ssh stop > /dev/null  2>&1 && echo -e "SSH baixou ..."
/etc/init.d/cups stop > /dev/null  2>&1 && echo -e "CUPS baixou ..."
/etc/init.d/apache2 stop > /dev/null 2>&1 && echo -e "APACHE2 baixou ..."
/etc/init.d/mysql stop > /dev/null 2>&1 && echo -e "MYSQL baixou ..."
/etc/init.d/dictd stop > /dev/null 2>&1 && echo -e "DICTD baixou ..."
/etc/init.d/fam stop > /dev/null 2>&1 && echo -e "FAMD baixou ..."
/etc/init.d/oracle-xe stop > /dev/null 2>&1 && echo -e "Oracle baixou ..."
/etc/init.d/samba stop > /dev/null 2>&1 && echo -e "Samba baixou ..."
/etc/init.d/vmware stop > /dev/null 2>&1 && echo -e "VMWare baixou ..."
/etc/init.d/privoxy stop > /dev/null 2>&1 && echo -e "PRIVOXY baixou ..."
/etc/init.d/tor stop > /dev/null 2>&1 && echo -e "TOR baixou ..."
/etc/init.d/avahi-daemon stop > /dev/null 2>&1 && echo -e "AVAHI-DAEMON baixou ..."
/etc/init.d/rsync stop > /dev/null 2>&1 && echo -e "Rsync baixou ..."
/etc/init.d/xinetd stop > /dev/null 2>&1 && echo -e "XINETD baixou ...\n"

iptables -F INPUT && iptables -F OUTPUT && echo -e "Flush no iptables...[FEITO]"
iptables -P INPUT ACCEPT && iptables -P OUTPUT ACCEPT && echo -e "Abrindo guarda...[FEITO]\n"

echo -e "\n##########\nnmap localhost\n\n"
nmap localhost

echo -e "\n##########\niptables -nL\n\n"
iptables -nL

echo -e "\n##########\nnetstat -anp\n\n"

netstat -anp | grep -i "ouça" 1> /dev/null

until [ $? -ne 0 ]; do
    netstat -anp | grep -i "ouça" &&
    echo "Daemons ouvindo... :O" &&
    sleep 1
done

echo "Daemons surdos... :)"
