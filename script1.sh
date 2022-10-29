#!/usr/bin/bash
#Making a copy of the ICA1 directory in your current directory.
cp -r /localdisk/data/BPSM/ICA1/ .

#Creating an output directory for quality control files.
mkdir ./ICA1/fastqc.out

#Carrying out fastqc on the sequence files quietly.

echo ""
echo "---"
echo 'Quality control initiated...'
echo "---"
echo ""

fastqc -o ./ICA1/fastqc.out -q -t 16 ./ICA1/fastq/*.fq.gz

echo ""
echo "---"
echo 'Quality control complete.'
echo "---"
echo ""


