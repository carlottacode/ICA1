
cut -f 4,5 ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed > gene_name.txt
head gene_name.txt


cut -f 6 ./ICA1/fastq/Tco-6114.sorted.bam.multicov|paste - gene_name.txt >gene_name1.txt
mv gene_name1.txt  gene_name.txt

cut -f 6 ./ICA1/fastq/Tco-6114.sorted.bam.multicov|paste - gene_name.txt > gene_name1.txt
mv gene_name1.txt gene_name.txt

head gene_name.txt



