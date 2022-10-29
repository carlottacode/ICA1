#!/usr/bin/bash
#Making a copy of the ICA1 directory in your current directory.
cp -r /localdisk/data/BPSM/ICA1/ .

#Creating an output directory for quality control files.
mkdir ./ICA1/fastqc.out

#Carrying out fastqc on the sequence files quietly.
echo 'Quality control initiated...'
fastqc -o ./ICA1/fastqc.out -q -t 16 ./ICA1/fastq/*.fq.gz
echo 'Quality control complete.'

