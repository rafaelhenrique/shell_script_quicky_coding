#!/bin/bash

ffmpeg -i $1 -ab 192 -ar 44100 -b 500 -s 352x240 $1.mpg
