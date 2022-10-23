samples=$(cut -f 2 ./ICA1/fastq/Tco.fqfiles|sort|uniq)#!/usr/bin/bash
bam_files=$(ls ./ICA1/fastq/*.sorted.bam)

#for bam in ${bam_files};
#	do
#	bedtools multicov -bams ${bam} -bed ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed > "${bam}".multicov
#done

#awk 'BEGIN{FS="\t";}{if($NF>150){print $0;}}' Tco-6114.sorted.bam.multicov

mkdir experiments
samples=$(cut -f 2 ./ICA1/fastq/Tco.fqfiles|sort|uniq)

for sample in ${samples};
  do
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 0 | grep 'Uninduced' > ./experiments/"${sample}".0.Uninduced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 24 | grep 'Uninduced' > ./experiments/"${sample}".24.Uninduced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 48 | grep 'Uninduced' > ./experiments/"${sample}".48.Uninduced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 0 | grep 'Induced' > ./experiments/"${sample}".0.Induced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 24 | grep 'Induced' > ./experiments/"${sample}".24.Induced.sample
  cat ./ICA1/fastq/Tco.fqfiles|grep "${sample}" | grep 48 | grep 'Induced' > ./experiments/"${sample}".48.Induced.sample

done



#Get BED file ready for fold change analysis
cut -f 4 TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_names.file
cut -f 4,5 TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_names_and_descriptions.file
cut -f 5 TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_descriptions.file

experiments=$(ls ./experiments)
for experiment in ${experiments};
	do
	unset replicates
	replicates=$(cut -f 6 ./experiments/"${experiment}"|sort|uniq)
	for replicate in ${replicates};
		do

		echo ${replicate}
		IFS='_'
		read d1 d2 << "${replicate}"
		echo "${d1}"
		cat ./ICA1/fastq/"${d1}".sorted.bam.multicov
	done
done
