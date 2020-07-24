#!bin/bash

for ff in `ls *.svg`
do
echo $ff
# echo ${ff%.svg}.png
# convert -density 200 ${ff} ${ff%.svg}.png
inkscape  --export-dpi 96 ${ff} --export-filename ${ff%.svg}.png

done
