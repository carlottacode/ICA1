#!/usr/bin/bash
cp -r /localdisk/data/BPSM/ICA1/ .


mkdir ./ICA1/fastqc.out

echo 'Quality control initiated...'
fastqc -o ./ICA1/fastqc.out -q -t 14 ./ICA1/fastq/*.fq.gz
echo 'Quality control complete.'

