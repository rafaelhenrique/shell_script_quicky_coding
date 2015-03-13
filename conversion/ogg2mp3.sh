#!/bin/bash
for i in *.ogg; do
    sox "$i" "${i%.ogg}.wav";
done

for i in *.wav; do 
    lame -h "$i" "${i%.wav}.mp3";
done
