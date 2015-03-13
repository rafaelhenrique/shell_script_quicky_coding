#!/bin/bash
function dec2ROM(){

    ROMANO=( 'I' 'IV' 'V' 'IX' 'X' 'XL' 'L' 'XC' 'C' 'CD' 'D' 'CM' 'M')
    ARABICO=( 1 4 5 9 10 40 50 90 100 400 500 900 1000 )
    DECIMAL="$1"
    ACUMULADOR=""

    for((i=12;i>=0;i--)); do
        while [ $DECIMAL -ge ${ARABICO[i]} ]; do
            DECIMAL=$(( $DECIMAL - ${ARABICO[i]} ));
            ACUMULADOR=$(echo "$ACUMULADOR${ROMANO[i]}")
        done
    done
    
    echo $ACUMULADOR
}

SAIDA=$(dec2ROM $1)

echo Algarismo romano: $SAIDA
