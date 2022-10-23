cut -f 4,5 ./ICA1/TriTrypDB-46_TcongolenseIL3000_2019.bed >./Average/average.Clone1.0.Induced.sample.txt
head ./Average/average.Clone1.0.Induced.sample.txt

cut -f 6 ./ICA1/fastq/Tco-6114.sorted.bam.multicov> temp_file
#paste - ./Average/average.Clone1.0.Induced.sample.txt  > ./Average/average.Clone1.0.Induced.sample.txt


#head ./Average/average.Clone1.0.Induced.sample.txt


