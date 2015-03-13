#!/bin/bash
while true; do 
    sleep 2
    if [ $(df -h . | tail -1 | awk '{print $5}' | tr "%" " ") -ge 98 ]; then 
        clear        
        echo -e "\aUso: " && dh -h . | tail -1 | awk '{print $5}'
    else 
        clear
        echo -n "Uso: " && df -h . | tail -1 | awk '{print $5}'
    fi
done
