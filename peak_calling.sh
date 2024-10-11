#!/bin/bash

# load modules

module load macs

# ChIP-Seq Peak Calling with MACS2

callpeak -t SRR25255816_sorted.bam -c SRR25255820_sorted.bam -f BAMPE -g hs -m 10 30 --trackline -B --broad --broad-cutoff 0.1 -p 1e-04 -n KO_IP_input_rep1 --outdir peaks/

callpeak -t SRR25255815_sorted.bam -c SRR25255819_sorted.bam -f BAMPE -g hs -m 10 30 --trackline -B --broad --broad-cutoff 0.1 -p 1e-04 -n KO_IP_input_rep2 --outdir peaks/


callpeak -t SRR25255818_sorted.bam -c SRR25255822_sorted.bam -f BAMPE -g hs -m 10 30 --trackline -B --broad --broad-cutoff 0.1 -p 1e-04 -n NC_IP_input_rep2 --outdir peaks/

callpeak -t SRR25255817_sorted.bam -c SRR25255821_sorted.bam -f BAMPE -g hs -m 10 30 --trackline -B --broad --broad-cutoff 0.1 -p 1e-04 -n NC_IP_input_rep1 --outdir peaks/


