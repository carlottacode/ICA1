#!/usr/bin/bash
mkdir ./working_dir
cp -r /localdisk/data/BPSM/ICA1/ ./working_dir/


mkdir ./working_dir/ICA1/fastqc.out
fastqc -o ./working_dir/ICA1/fastqc.out -t 6 ./working_dir/ICA1/fastq/*.fq.gz


