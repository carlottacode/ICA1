#!/usr/bin/bash

pwd 

find ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz
gunzip ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz

pwd
hisat2-build -f -p 6 ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta ./ICA/Tcongo_genome/Tcongo_index

unset IFS
seq2='_2.fq.gz'
sam_tail='.sam'
unset count
files_hst_s1=$(ls /ICA1/fastq/*1.fq.gz)
files_hst_s2=$(ls /ICA1/fastq/*2.fq.gz)
for seq in ${files_hst_s1};
	do
	IFS='_'
	read -r d1 d2 <<< "${seq}"
	unset IFS	
	echo "${seq}"
	echo "${d1}""${seq2}"
	hisat2 -t --summary-file /ICA1/hisat2-summary/ -p 6 -x /ICA1/Tcongo_genome/Tcong_index -1 "${seq}" -2 "${d1}""${seq2}"	-S "${d1}""${sam_tail}"|samtools sort -@ 8 -o "${d1}""${bam_tail}" "${d1}""${sam_tail}"

done
