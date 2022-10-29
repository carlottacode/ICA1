#!/usr/bin/bash
echo ""
echo "---"
echo 'Copying files into your current directory...'
echo "---"
echo ""
source script1.sh

echo ""
echo "---"
echo 'Assessing the numbers and quality of sequences from fastqc output...'
echo "---"
echo ""
source qc_script.sh

echo ""
echo "---"
echo 'Building Trypanosoma congolense IL3000 genome index...'
echo "---"
echo ""
source script2.sh

echo ""
echo "---"
echo 'Aligning of sequences to T. congolense genome...'
echo "---"
echo ""
source script3.sh

echo ""
echo "---"
echo 'Using bedtools multicov to get gene expression counts...'
echo "---"
echo ""
source script4.sh

echo ""
echo "---"
echo 'Calculating the average gene expression for each group...'
echo "---"
echo ""
source script5.sh

echo ""
echo "---"
echo 'Calculating the fold change for any two groups...'
echo "---"
echo ""
source script6.sh
