#!/bin/bash

for num2 in 1 2 3 4 5 6 7 8 9 0 a b c d e f
for num3 in 1 2 3 4 5 6 7 8 9 0 a b c d e f
for num4 in 1 2 3 4 5 6 7 8 9 0 a b c d e f
for num5 in 1 2 3 4 5 6 7 8 9 0 a b c d e f
	
do
    convert  -type ./image/000${num5}${num4}${num3}${num2}0.png  ./mono/000${num5}${num4}${num3}${num2}0.png
done
