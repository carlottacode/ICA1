#!/usr/bin/bash
#Calculating fold change
unset experiments

experiments=$(ls ./experiments/)
echo "List of samples: "
for experiment in ${experiments};


	do
	echo ${experiment::-7}
	done
#sample1=Clone1.24.Induced
#sample2=WT.24.Induced
read -p "From the list of samples above enter the first sample: " sample1

read -p "From the list of samples above enter the sample you'd like to compare this to " sample2
find ./Average/average.${sample1}.sample.txt
find ./Average/average.${sample2}.sample.txt

paste ./Average/average.${sample1}.sample.txt ./Average/average.${sample2}.sample.txt > temp.txt


cat temp.txt |source foldchange.awk > temp_fc.txt

echo "${sample1}"/"${sample2}"_foldchange > temp_title.txt

cat temp_title.txt temp_fc.txt > foldchange_output.txt
head -6 foldchange_output.txt
