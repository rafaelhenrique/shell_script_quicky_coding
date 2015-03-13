#!/bin/bash

# Gravar imagem do desktop
# Publicado no Dicas-l por Rubens Queiroz
# http://www.dicas-l.com.br/arquivo/gravando_a_atividade_do_desktop_com_ffmpeg.php
ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq out.mpg 2> /dev/null
