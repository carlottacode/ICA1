#!/usr/bin/bash

#Listing all samples which could be compared by calculating fold change.
echo "---"
echo "The following groups can be compared by calculating fold change."
echo "---"
unset experiments
experiments=$(ls ./experiments/)


for experiment in ${experiments};
	do
	echo ${experiment::-7}
done
echo ""
echo "Enter the groups as you see them above."
echo ""
echo ''
echo "Here the 'fold change' is calculated by dividing 'Group 1' by 'Group 2'"
echo ''
read -p "Enter Group 1: " sample1
read -p "Enter Group 2: " sample2
#find ./Average/average.${sample1}.sample.txt
#find ./Average/average.${sample2}.sample.txt

#Pastes the gene expression averages of the groups chosen together.
paste ./Average/average.${sample1}.sample.txt ./Average/average.${sample2}.sample.txt > temp.txt

#Calls awk script on this file to calculate fold change.
cat temp.txt |source foldchange.awk > fc_temp.txt
echo "${sample1}"/"${sample2}" >temp_title.txt
cat temp_title.txt fc_temp.txt  > temp.txt
cut -f 1,2 output.txt |paste temp.txt - > foldchange_output.txt

#Sorts by absolute value
cat foldchange_output.txt | sed -r 's/-([0-9]+)/\1-/g;' | sort -nr | sed -r 's/([0-9]+)-/-\1/g;' > sorted_foldchange_output.txt


#Restore column headers without disrupting the order.
grep -v 'Gene Descriptions' sorted_foldchange_output.txt > temp.txt
grep 'Gene Descriptions' sorted_foldchange_output.txt > temp_title.txt
cat temp_title.txt temp.txt > foldchange_output.txt

#Remove the temporary files.
rm temp.txt
rm temp_title.txt
rm fc_temp.txt
rm sorted_foldchange_output.txt

echo ""
echo "---"
echo "Here are the first 10 lines of the Fold Change analysis..."
echo "---"
echo ""
head -10 foldchange_output.txt
echo ""
echo "---"
echo "To see more please look at the ./foldchange_output.txt file."
echo "---"
echo ""

#Allows the user to specify whether they would like to carry out another fold change analysis.

read -p "Would you like to calculate the fold change for another two groups?[y/n]" counter

if [ "${counter}" = 'y' ]; then 
	source script6.sh
else 
	echo ""
	echo "###"
	echo "You have reached the end of this pipeline!" 
	echo "###"
	echo ""
fi

