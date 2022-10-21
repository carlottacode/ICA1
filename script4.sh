#!/usr/bin/bash

bam_files=$(ls ./ICA1/fastq/*.sorted.bam)

for bam in ${bam_files};
	do
	bedtools bamtobed -i ${bam}| bedtools intersect -a - -b ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed > "${bam}".intersect

done
