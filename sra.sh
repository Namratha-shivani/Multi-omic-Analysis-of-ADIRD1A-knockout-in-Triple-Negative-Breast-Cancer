#!/bin/bash

# load SRR toolkit

module load SRAtoolkit
module load fastqc

# array of SRA samples to be fetched for analysis

array=(
SRR25255815
SRR25255816
SRR25255817
SRR25255818
SRR25255819
SRR25255820
SRR25255821
SRR25255822
)

for srr in "${array[@]}"
do 
    echo "Prefetching $srr.."
    prefetch "$srr"

    echo "Running fastq-dump for $srr.."
    fastq-dump --split-files --gzip "$srr"

done 

# Performing Quality control using FASTQC

fastqc ChIP_seq/data/*.fastq.gz -o ChIP_seq/fastqc/
