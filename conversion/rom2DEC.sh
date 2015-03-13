#!/bin/bash
function rom2DEC(){

    TAMANHO=$(echo "$1"| wc -c)
    NUM=0

    for((cont=1;cont<$TAMANHO;cont++)); do
    
        PEDACO=$(echo "$1" | cut -c"$cont")

        if [ "$(($cont+2))" -eq "$TAMANHO" ]; then

            CONTMAISUM=$((cont + 1))
            PEDACO=$(echo "$1" | cut -c"$cont"-"$CONTMAISUM")
            case "$PEDACO" in
                'II') NUM=$((2+$NUM)) ;;
                'IV') NUM=$((4+$NUM)) ;;
                'IX') NUM=$((9+$NUM)) ;;

                'VI') NUM=$((6+$NUM)) ;;

                'XI') NUM=$((11+$NUM)) ;;
                'XV') NUM=$((15+$NUM)) ;;
                'XX') NUM=$((20+$NUM)) ;;
                'XL') NUM=$((40+$NUM)) ;;
                'XC') NUM=$((90+$NUM)) ;;

                'LI') NUM=$((51+$NUM)) ;;
                'LV') NUM=$((55+$NUM)) ;;
                'LX') NUM=$((60+$NUM)) ;;

                'CI') NUM=$((101+$NUM)) ;;
                'CV') NUM=$((105+$NUM)) ;;
                'CL') NUM=$((150+$NUM)) ;;
                'CC') NUM=$((200+$NUM)) ;;                
                'CD') NUM=$((400+$NUM)) ;;
                'CM') NUM=$((900+$NUM)) ;;

                'DI') NUM=$((501+$NUM)) ;;
                'DV') NUM=$((505+$NUM)) ;;
                'DL') NUM=$((550+$NUM)) ;;
                'DC') NUM=$((600+$NUM)) ;;                

                'MI') NUM=$((1001+$NUM)) ;;
                'MV') NUM=$((1005+$NUM)) ;;
                'ML') NUM=$((1050+$NUM)) ;;
                'MC') NUM=$((1010+$NUM)) ;;                
                'MD') NUM=$((1500+$NUM)) ;;                
                'MM') NUM=$((2000+$NUM)) ;;                

                *) echo "Não esperado $PEDACO";;
            esac
      
            break 

        else
            case "$PEDACO" in
                'I') NUM=$((1+$NUM)) ;;
                'V') NUM=$((5+$NUM)) ;;
                'X') NUM=$((10+$NUM)) ;;
                'L') NUM=$((50+$NUM)) ;;
                'C') NUM=$((100+$NUM)) ;;
                'D') NUM=$((500+$NUM)) ;;
                'M') NUM=$((1000+$NUM)) ;;

                 *) echo "Não esperado $PEDACO";;
            esac
        fi

    done

    echo "$NUM"
}

SAIDA=$(rom2DEC $1)

echo Número decimal: $SAIDA
