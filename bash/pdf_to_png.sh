#!bin/bash

for ff in `ls *heatmaps.pdf`
do
echo $ff
echo ${ff%.pdf}.png
convert -density 150 ${ff} ${ff%.pdf}.png
done
