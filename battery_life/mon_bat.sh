#!/bin/bash

while true; do 
    sleep 30
    VAR=$(acpi | cut -f1 -d"%"| awk '{print $4}')
    if [ $VAR -gt 99 ]; then
	echo "Bateria semi-carregada" | wall
    else
	echo $VAR%
    fi
done
