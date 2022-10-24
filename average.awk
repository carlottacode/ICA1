#!/usr/bin/bash

awk 'BEGIN{FS="\t";}{sum=0;}{for(i=1;i<=NF;i++){sum+=$i;}{avg=sum/NF;}{print avg;}}'

