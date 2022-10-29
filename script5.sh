#!/usr/bin/bash
#This script works out the average gene expression for each group using an awk script.
#This also produces the requested output tab-delimited file with gene names and descriptions.

#Getting necessary information from the BED file to create the output files.
echo 'Gene' > headers.txt
echo 'Gene Descriptions' >> headers.txt
cut -f 4,5 ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_descriptions.txt


#First creating variables to loop through, for each experiment getting the corresponding sequence file names.
#For each sequence file name getting the corresponding gene expression data from the multicov analysis.
#For each sample group pasting the gene expression data into one file.
#Using an awk file to calculate the average gene expression for each group file.
#Finally creating the output file by putting these files together with the gene names and descriptions from the 
#BED file.

mkdir Average
experiments=$(ls ./experiments)
for experiment in ${experiments};
        do
        unset replicates
        replicates=$(cut -f 6 ./experiments/"${experiment}"|sort|uniq)
	touch ./Average/average."${experiment}".txt

	for replicate in ${replicates};
                do
                IFS='_'
                read d1 d2 <<< "${replicate}"	
		cut -f 6 ./ICA1/fastq/"${d1}".sorted.bam.multicov|paste - ./Average/average."${experiment}".txt > output.txt
		mv output.txt ./Average/average."${experiment}".txt
		unset IFS
		cat ./Average/average."${experiment}".txt | source average.awk > average.output
		mv average.output ./Average/average."${experiment}".txt
        done

	paste gene_descriptions.txt ./Average/average."${experiment}".txt > final_average.output
	mv final_average.output gene_descriptions.txt 	
	echo "${experiment}" >> headers.txt
done

#Making sure the output file has headers to make it easily understandable. 
cat headers.txt | paste -s headers.txt > line_headers.txt
cat line_headers.txt gene_descriptions.txt > output.txt

rm gene_descriptions.txt
rm line_headers.txt
rm headers.txt


echo ""
echo "---"
echo "If you would like to see the gene expression averages for each group please have a look and the output.txt file."
echo "---"
echo ""





