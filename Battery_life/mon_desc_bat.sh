#!/bin/bash
while true; do 
    sleep 1
    acpi | awk '{print $5}'
done
