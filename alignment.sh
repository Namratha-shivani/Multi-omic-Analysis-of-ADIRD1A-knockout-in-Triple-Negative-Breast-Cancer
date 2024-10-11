#!/bin/bash

# load modules

module load trimmomatic
module load bowtie

# Trim low-quality bases and remove adapters using Trimmomatic

trimmomatic PE -phred33 "provide the name of read 1 fastq file" "provide the name of read 2 fastq file"\
"Name of read1_sample"_paired_trimmed.fastq.gz "Name of read1_sample"_unpaired.fastq.gz \
"Name of read2_sample"_paired_trimmed.fastq.gz "Name of read2_sample"_unpaired.fastq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36


# Align reads to the human genome (hg38)

bowtie2 -x hg38_index -1 "name of forward reads_trimmed_fastq" -2 "name of reverse reads_trimmed_fastq" -S "name of sample".sam




