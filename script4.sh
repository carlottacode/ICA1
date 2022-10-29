#!/usr/bin/bash

#Using bedtools multicov to find which genes the sequences have aligned to.
bam_files=$(ls ./ICA1/fastq/*.sorted.bam)

for bam in ${bam_files};
	do
	echo "Carrying out multicov on "${bam}
	bedtools multicov -bams ${bam} -bed ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed > "${bam}".multicov
done

#Creating a file for each group that we later want to compare the gene expression of.
#I have tried to write this code to make sure that if another clone is added this will seamlessly fit into the
#downstream analysis.

mkdir experiments
samples=$(cut -f 2 ./ICA1/fastq/Tco.fqfiles|sort|uniq|grep -v 'SampleType')

for sample in ${samples};
  do
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 0 | grep 'Uninduced' > ./experiments/"${sample}".0.Uninduced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 24 | grep 'Uninduced' > ./experiments/"${sample}".24.Uninduced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 48 | grep 'Uninduced' > ./experiments/"${sample}".48.Uninduced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 0 | grep 'Induced' > ./experiments/"${sample}".0.Induced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 24 | grep 'Induced' > ./experiments/"${sample}".24.Induced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 48 | grep 'Induced' > ./experiments/"${sample}".48.Induced.sample

done

#After creating the group files this deletes the empty files again making sure we are left with only groups which have
#corresponding sequences.

empty_exp=$(find ./experiments -name '*.sample' -size 0)
for empty_file in ${empty_exp};
	do
	rm ${empty_file}
done
