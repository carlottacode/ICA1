#!/usr/bin/bash
#Run align function outputting in sam format

unset IFS
seq2='_2.fq.gz'
sam_tail='.sam'
bam_tail='.sorted.bam'

files_hst_s1=$(ls ./ICA1/fastq/*1.fq.gz)

for seq in ${files_hst_s1};
        do
        IFS='_'
        read -r d1 d2 <<< "${seq}"
	unset IFS
        bowtie2 -p 12 -x ./ICA1/Tcongo_genome/Tcongo -1 "${seq}" -2 "${d1}""${seq2}"|samtools view -Sb - | samtools sort - -o "${d1}""${bam_tail}"

done

samtools index -@ 8 -M ./ICA1/fastq/*.sorted.bam
