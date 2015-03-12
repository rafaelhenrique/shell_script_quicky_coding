#!/usr/bin/env bash
# http://superuser.com/questions/553653/connecting-to-an-ssh-server-from-client-behind-an-ntlm-proxy

YOUR_REMOTE_IP_HERE="X.X.X.X"


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
  echo -n "Matando processos existentes..." && \
  sudo kill -9 "${PIDS[@]}"
  status
fi

echo -n "Criando túnel cntlm..." && \
sudo cntlm -L 5599:$YOUR_REMOTE_IP_HERE:443
status

echo -n "Criando túnel ssh..." && \
ssh -p 5599 root@localhost -fNL 8001:localhost:3128
status

