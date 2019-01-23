#!/bin/bash


rm out.txt

for vm in 0 1 2 3 4 5 6 7 
do
	for ve in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	do
			convert \
			-type GrayScale \
			-median ${vm} \
			-edge ${ve} \
			-monochrome \
			-contrast \
			-contrast \
			-contrast \
			-antialias \
			-normalize \
			-gamma 2.3 \
			-sharpen 10 \
			./image/00000000.png \
			test.png
	echo "median:"${vm}"edge:"${ve} >> out.txt

	tesseract test.png tmp -l eng -c preserve_interword_spaces=1 --psm 7 --oem 2 && cat ./tmp.txt >> out.txt
	done
done

			#-type TrueColor \
			#-colorspace GRAY \
