#!/bin/bash
echo -n "Digite o nome da vm:"
read maq
vmrun -T server -h 'http://127.0.0.1:8222/sdk' -u root -p 'TuR1064*2' start "[standard] $maq/$maq.vmx"
