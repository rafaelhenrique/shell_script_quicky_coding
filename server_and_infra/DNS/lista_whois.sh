#!/bin/bash
for line in `awk '{print $1}' $1`; do 
   whois $line | tee $line
done
