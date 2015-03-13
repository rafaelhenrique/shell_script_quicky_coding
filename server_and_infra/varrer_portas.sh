#!/bin/bash
set -xv
# http://segurancalinux.com/artigo/Funcionalidades-pouco-conhecidas-ou-usadas-do-Netcat?pagina=3
# Script criado para não esquecer como 
# varre portas com o netcat ;)

if [ -n "$1" -a  -n "$2" -a -n "$3" ]  ; then
    nc -vv $1 $2-$3
else
    echo "Sintaxe: $0 <serverip> <portaini> <portafim>"
fi
