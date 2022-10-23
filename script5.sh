#!/usr/bin/bash

#Get BED file ready for fold change analysis
#cut -f 4 TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_names.file
#cut -f 4,5 TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_names_and_descriptions.file
#cut -f 5 TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_descriptions.file
mkdir Average
experiments=$(ls ./experiments)
for experiment in ${experiments};
        do
        unset replicates
        replicates=$(cut -f 6 ./experiments/"${experiment}"|sort|uniq)
	cut -f 4,5 ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed >./Average/average."${experiment}".file
   	head ./Average/average."${experiment}".file 
	for replicate in ${replicates};
                do
		echo ${experiment}
#                echo ${replicate}
                IFS='_'
                read d1 d2 <<< "${replicate}"
#                echo "${d1}"
		
		cut -f 6 ./ICA1/fastq/"${d1}".sorted.bam.multicov|paste - ./Average/average."${experiment}".file > ./Average/average."${experiment}".file
		head ./Average/average."${experiment}".file

		unset IFS
        done
#	paste temporary_file ./Average/average."${experiment}".file >./Average/average."${experiment}".file
done









