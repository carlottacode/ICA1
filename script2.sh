#!/usr/bin/bash
#Build index for aligner

echo 'Unzipping reference genome...'
find ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz
gunzip ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz


echo 'Building index for Hisat2'
hisat2-build -f -q -p 9 ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta ./ICA1/Tcongo_genome/Tcongo_index

echo 'Index complete'
