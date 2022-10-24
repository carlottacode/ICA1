#!/usr/bin/bash
echo "\t" > headers.txt
echo "\t " >> headers.txt
#Get BED file ready for fold change analysis
#cut -f 4 TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_names.file
cut -f 4,5 ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_descriptions.txt
#cut -f 5 TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_descriptions.file
mkdir Average
experiments=$(ls ./experiments)
for experiment in ${experiments};
        do
        unset replicates
        replicates=$(cut -f 6 ./experiments/"${experiment}"|sort|uniq)
#	cut -f 4,5 ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed >./Average/average."${experiment}".txt
	touch ./Average/average."${experiment}".txt
#   	head ./Average/average."${experiment}".txt
	for replicate in ${replicates};
                do
		echo ${experiment}
#                echo ${replicate}
                IFS='_'
                read d1 d2 <<< "${replicate}"
#                echo "${d1}"
		
		cut -f 6 ./ICA1/fastq/"${d1}".sorted.bam.multicov|paste - ./Average/average."${experiment}".txt > output.txt

		mv output.txt ./Average/average."${experiment}".txt
#		head ./Average/average."${experiment}".txt
		unset IFS
		cat ./Average/average."${experiment}".txt | source average.awk > average.output
		mv average.output ./Average/average."${experiment}".txt




 
#		head ./Average/average."${experiment}".txt

        done
	paste gene_descriptions.txt ./Average/average."${experiment}".txt > final_average.output
	mv final_average.output gene_descriptions.txt
#	head gene_descriptions.txt
	
	echo "${experiment}" >> headers.txt
done

cat headers.txt | paste -s headers.txt > line_headers.txt
head -3 gene_descriptions.txt

paste line_headers.txt  gene_descriptions.txt>output.txt
head -3 output.txt






