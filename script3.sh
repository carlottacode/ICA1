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
        echo "${d1}"
	unset IFS
        #echo "${seq}"
        #echo "${d1}""${seq2}"
        hisat2 -q -t -x ./ICA1/Tcongo_genome/Tcongo_index -1 "${seq}" -2 "${d1}""${seq2}" -S "${d1}""${sam_tail}"\
	|samtools -o "${d1}""${bam_tail}" "${d1}""${sam_tail}"
done

