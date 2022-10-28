#unzip the quality control files
#unzip -q -d ./ICA1/fastqc.out/ './ICA1/fastqc.out/*.zip'

#get the info out that you want using grep and awk

qc_seqs=$(ls -d ./ICA1/fastqc.out/*fastqc)

for qc_seq in ${qc_seqs};
	do
	echo 'Parsing '${qc_seq}' for quality control results'
	awk 'BEGIN{FS="\t";}{if($1=="FAIL"){print $0}}' ${qc_seq}/summary.txt
	grep 'poor' ${qc_seq}/fastqc_data.txt
	grep '>>Basic Statistics' ${qc_seq}/fastqc_data.txt
	grep -i 'sequence' ${qc_seq}/fastqc_data.txt
	grep 'fail' ${qc_seq}/fastqc_data.txt
	grep 'warn' ${qc_seq}/fastqc_data.txt
#	head -10 ${qc_seq}/fastqc_data.txt
done
#head fastqc_data.txt

echo 'If following this analysis you would like to remove files from the analysis...'
read -p 'please enter files you no longer want to analyse' remov_files 
