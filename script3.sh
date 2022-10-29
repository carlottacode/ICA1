#!/usr/bin/bash
#Making a variable which contains all of the Sequence 1 files.
files_bt_s1=$(ls ./ICA1/fastq/*1.fq.gz)

#Iterating through each Sequence 1 and getting the corresponding Sequence 2.
#Running the bowtie aligner on each pair of sequences and immediately converting the SAM output to a sorted BAM output.
unset IFS
for seq in ${files_bt_s1};
        do
        IFS='_'
        read -r d1 d2 <<< "${seq}"
	unset IFS
        bowtie2 -p 16 --quiet -x ./ICA1/Tcongo_genome/Tcongo -1 "${seq}" -2 "${d1}"_2.fq.gz|samtools view -@ 16 -Sb - | samtools sort -@ 16 - -o "${d1}".sorted.bam

done

#Indexing all of the sorted BAM files.
samtools index -@ 12 -M ./ICA1/fastq/*.sorted.bam
