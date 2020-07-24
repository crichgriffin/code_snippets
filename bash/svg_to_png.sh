#!bin/bash

for ff in `ls *.svg`
do
echo $ff
# low res = 96 spi
# high res = 300
inkscape  --export-dpi 300 ${ff} --export-filename ${ff%.svg}.png

done
