#!/bin/bash

module load samtools

array=(
SRR25255815
SRR25255816
SRR25255817
SRR25255820
SRR25255821
SRR25255818
SRR25255819
SRR25255822
)

for k in {0..7}; do echo ${array[${k}]};

sample=${array[${k}]}

# Convert SAM to BAM
samtools view -bS ${sample}.sam > H3K4me1/${sample}.bam

# Sort BAM file
samtools sort H3K4me1/${sample}.bam -o H3K4me1/${sample}_sorted.bam

# alignment STATS
samtools stats H3K4me1/${sample}_sorted.bam |grep ^SN | cut -f 2- > H3K4me1/alignment_stats/${sample}.tsv;
samtools flagstat H3K4me1/${sample}_sorted.bam > H3K4me1/alignment_stats/${sample}_flagstat.tsv

done


