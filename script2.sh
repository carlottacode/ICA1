#!/usr/bin/bash

#Unzipping the reference genome.
echo 'Unzipping reference genome...'
#find ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz
gunzip ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta.gz

#Using bowtie-build to quietly create a Tcongo index for bowtie2.
echo 'Building index for bowtie2'
bowtie2-build -f -q --threads 16 ./ICA1/Tcongo_genome/TriTrypDB-46_TcongolenseIL3000_2019_Genome.fasta ./ICA1/Tcongo_genome/Tcongo

echo 'Index complete'
