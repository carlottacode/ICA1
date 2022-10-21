#!/usr/bin/bash
bam_files=$(ls ./ICA1/fastq/*.sorted.bam)

for bam in ${bam_files};
	do
	bedtools multicov -bams ${bam} -bed ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed > "${bam}".multicov
done

