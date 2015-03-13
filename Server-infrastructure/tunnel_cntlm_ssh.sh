#!/usr/bin/env bash

# Reference:
# http://superuser.com/questions/553653/connecting-to-an-ssh-server-from-client-behind-an-ntlm-proxy

# For use that script you need an vps machine (digital ocean, amazon ec2 etc..)
# on the vps, we need squid3 listen on port 3128
# and ssh listen on port 443

# This script can help you go through a local proxy and usually 
# access the Internet through their vps machine

YOUR_REMOTE_IP_HERE="$1"

if [ -z "$YOUR_REMOTE_IP_HERE" ]; then
  echo "Please inform your ip."
  exit 1
fi

GREEN="\033[01;32m"
RED="\033[01;31m"
NONE="\033[0m"

function status {
  if [ $? -eq 0 ]; then
    echo -ne "$GREEN [OK] $NONE\n"
  else
    echo -ne "$RED [FAIL] $NONE\n"
  fi
}

PIDS=( $(ps ax | awk '/(cntlm|ssh) \-[Lp] 5599/{print $1}') )
if [ ${#PIDS[@]} -gt 0 ]; then
  echo -n "Killing cntlm and ssh processes..." && \
  sudo kill -9 "${PIDS[@]}"
  status
fi

echo -n "Creating cntlm tunnel..." && \
sudo cntlm -L "5599:$YOUR_REMOTE_IP_HERE:443"
status

echo -n "Creating ssh tunnel..." && \
ssh -p 5599 root@localhost -fNL 8001:localhost:3128
status

