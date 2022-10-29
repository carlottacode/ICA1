#!/usr/bin/bash
#This awk script calculates fold change.
#Using the convention of using log base 2 of the fold change.
#If both gene expression levels being compared are 0 this script will output 0. 
#If only one gene expression levels being compared is zero the fold change
# will be calculated using a very small number close to zero - in this case 1e-17.


awk 'BEGIN{FS="\t";}
{
if($1==0)
{a=1e-17}
else 
{a=$1;}
if($2==0)
{b=1e-17}
else
{b=$2;}
{fc=(a/b);}
}
{
if(fc==1)
{print 0}
else 
{print log(fc)/log(2);}}'
