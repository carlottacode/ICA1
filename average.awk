#!/usr/bin/bash

#This script is used to calculate the average gene expression level for each group. 

awk 'BEGIN{FS="\t";}{sum=0;}
{
for(i=1;i<=NF;i++)
{sum+=$i;}
{avg=sum/NF;}
{print avg;}
}'

