#!/usr/bin/bash

echo 'Copying files into your current directory'
source script1.sh

echo 'Building genome index'
source script2.sh

echo 'Initiating the aligning of sequences to BAM output'
source script3.sh

echo 'Converting  BAM files to BED files and using bedtools intersect'
source script4.sh

echo 'Calculating the average gene expression for each sample'
source script5.sh

echo 'Calculating the fold change'
source script6.sh
