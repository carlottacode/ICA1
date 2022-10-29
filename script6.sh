#!/usr/bin/bash

#Listing all samples which could be compared by calculating fold change.

echo "The following groups can be compared by calculating fold change."
unset experiments
experiments=$(ls ./experiments/)
echo "List of samples: "
for experiment in ${experiments};
	do
	echo ${experiment::-7}
done

echo "Please enter the groups as you see them above."
read -p "From the groups above enter Group 1: " sample1
read -p "From the groups above enter the Group you'd like to compare Group 1 to: " sample2
find ./Average/average.${sample1}.sample.txt
find ./Average/average.${sample2}.sample.txt

#Pastes the gene expression averages of the groups chosen together.
paste ./Average/average.${sample1}.sample.txt ./Average/average.${sample2}.sample.txt > temp.txt

#Calls awk script on this file to calculate fold change.
cat temp.txt |source foldchange.awk |cat "${sample1}"/"${sample2}"_foldchange - > foldchange_output.txt

echo "Here is the first 10 lines of the Fold Change analysis..."
head -10 foldchange_output.txt

echo "If you want to see more please look at the foldchange_output.txt file."

#Allows the user to specify whether they would like to carry out another fold change analysis.
read -p 'Would you like to calculate the fold change for another two groups?[y/n]" counter
if counter=='y'; then source script6.sh; fi echo "You have reached the end of this pipeline!"

