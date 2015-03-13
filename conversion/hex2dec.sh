#!/bin/bash

# Tem um problema com este script:
#
# Quando o cara não informa o valor no parâmetro e usa
# a sintaxe ./nome.sh o script fica esperando receber xargs
# porém eu não terei xargs
#
# Sintaxes:
#
#      ./hex2dec.sh a b c 10 11 12 [n valores....]
#      ou
#      echo a b c 10 11 12 | ./hex2dec.sh
#

MENSAGEM="$@"

if [ -z "$MENSAGEM" ]; then
    MENSAGEM=$( xargs  )
fi

echo -n "Mensagem do MMF> $MENSAGEM"

if [ "$MENSAGEM" ]; then
    for OCTETO in $MENSAGEM; do
        HEX="$(( 16#$OCTETO ))"
        # ou
        # HEX="$(( 0x$OCTETO ))"
        DEC=( "${DEC[@]}" "$( echo $HEX )" )
    done
fi

echo -en "\nMensagem convertida em decimal> ${DEC[@]}\n"

