#!/usr/bin/bash

for input in {1..12}; do
querys=`cat output$input.txt | grep Testing | cut -d '/' -f3`
basesimIPC=`cat output$input.txt | grep IPC | sed 's/ \s*/ /g' | cut -d ' ' -f3 | tr '\n' ';'`
simIPC=`cat output$input.txt | grep IPC | sed 's/ \s*/ /g' | cut -d ' ' -f4 | tr '\n' ';'`
echo $querys >> ./plot/plot_${input}_x.csv
echo $basesimIPC >> ./plot/plot_${input}_y1.csv
echo $simIPC >> ./plot/plot_${input}_y2.csv
done


#1 experiment: block size 32byte, 64set, 32way okay output1.txt
#2 experiment: block size 32byte, 64set, 64way okay output2.txt
#3 experiment: block size 32byte, 64set, 128way  oaky
#4 experiment: block size 32byte, 64set, 256way okay output4.txt
#5 experiment: block size 32byte, 128set, 16way okay output5.txt
#6 experiment: block size 32byte, 128set, 32way okay output6.txt
#7 experiment: block size 32byte, 128set, 64way okay output7.txt
#8 experiment: block size 32byte, 128set, 128way okay output8.txt
#9 experiment: block size 32byte, 256set, 8way 9
#10 experiment: block size 32byte,256set, 16way 10
#11 experiment: block size 32byte,256set, 32way 11
#12 experiment: block size 32byte,256set, 64way 12
#13 experiment: block size 32byte,512set, 4way
#14 experiment: block size 32byte,512set, 8way
#15 experiment: block size 32byte,512set, 16way
#16 experiment: block size 32byte,512set, 32way
#17 experiment: block size 32byte, 64set, 8way
#18 experiment: block size 32byte, 64set, 8way
#19 experiment: block size 32byte, 64set, 8way
#20 experiment: block size 32byte, 64set, 8way
#first experiment: block size 32byte, 64set, 8way
