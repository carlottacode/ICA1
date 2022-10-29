#Unzip the fastqc output.
unzip -q -d ./ICA1/fastqc.out/ './ICA1/fastqc.out/*.zip'

#Iterating through the fastqc output files.
#Using grep to return important information about quality, length and number of the sequences.

qc_seqs=$(ls -d ./ICA1/fastqc.out/*fastqc)

for qc_seq in ${qc_seqs};
	do
	
 	{ echo " ";
	echo 'Parsing '${qc_seq}' for quality control results:';
	grep -i 'filename' ${qc_seq}/fastqc_data.txt;
	grep '>>Basic Statistics' ${qc_seq}/fastqc_data.txt;
	grep 'poor' ${qc_seq}/fastqc_data.txt;
	grep -i 'Total sequences' ${qc_seq}/fastqc_data.txt;
	grep 'length' ${qc_seq}/fastqc_data.txt;
	grep '%' ${qc_seq}/fastqc_data.txt;
	echo "FAIL flags:";
	grep 'fail' ${qc_seq}/fastqc_data.txt;
	echo "WARN flags:";
	grep 'warn' ${qc_seq}/fastqc_data.txt;
	echo " ";
	echo '---'; } >> fastqc_summary.txt
	tail -14 fastqc_summary.txt
done

#The output can be seen in the file fastqc_summary.txt
echo ""
echo "---"
echo "To see further details of the fastqc analysis please have a look at the ./fastqc_summary.txt file."
echo "---"
echo ''
