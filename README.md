# Multi-omic Analysis of ADIR1A knockout on Triple Negative Breast Cancer

Tripe negative breast cancer (TNBC) is defined as the tumor that lacks the receptor expression of estrogen, progesterone and a protein HER2 expression [1]. The AT-rich interactive domain 1A (ARID1A) is the region that is mostly depleted in many human cancers. It encodes protein BAF250a and it is observed to be downregulated in tumor tissues. ARID1A plays and essential role in tumor suppression by negative regulation of cell-cycle progression and identifying the target genes to mediate the tumor suppression [2].

**ChIP-seq** is a sequencing technology which is used to map the DNA-binding proteins and histone modifications. The ChIP antibodies target a specific protein of interest and attaches to them, which enriches the DNA fragments bound to those proteins [3]. The DNA fragments which contain the protein of interest are extracted and amplified and sequence to study the effects.

<p align="center">
  <img src="images/ChIP-seq2.png" width="400" height="200" alt="Alt Text">
</p>

Mammalian DNA is highly condensed through nucleosome which wraps into chromatin which leads into chromosome. Chromatin is mainly made of DNA and protein and dynamically switches between active euchromatin (loosely bound and easily accessible by TF) and inactive heterochromatin (Tightly bound). The interplay between nucleosome, chromatin, and chromosome
play an important role in gene regulation. **ATAC-seq** studies the chromatin accessibility by incorporating genetically altered Tn5 transposase that cuts open chromatin and ligates adapters [4].

<p align="center">
  <img src="images/ATAC-seq.png" width="300" height="200" alt="Alt Text">
</p>

In this project integration of ATAC-seq, ChIP-seq and RNA-seq analysis was performed in the context of ARID1A knockout versus control samples to understand the mechanisms of gene
expression regulation. This integration offers an understanding on how histone modifications caused by knockout of ARID1A impact the accessibility of DNA, thereby regulating the gene
expression.

## METHODS

- The study utilized high-throughput sequencing data from ARID1A knockout MDA-MB-231 cells, obtained from NCBI GEO dataset GSE234179. This dataset comprised 20 ChIP-seq samples, 10 ATAC-seq samples, and 6 RNA-seq samples. Initial processing involved quality checking and trimming of raw reads, followed by alignment to the reference genome (hg38). 
- ChIP-seq and ATAC-seq analyses involved biological quality control, peak calling, peak annotation, and differential peak analysis. Additionally, peaks were intersected between ATAC and ChIP experiments, followed by intersection with RNA-seq data. Visualization was performed using Integrated Genome Browser (IGV). 
- ATAC-seq analysis involved replicates of knockout and control samples, with peaks annotated using Homer's functions. 
- RNA-seq downstream analysis included differential gene expression analysis and functional enrichment analysis using DESeq2 and clusterProfiler, respectively. Finally, peaks were intersected between ChIP-seq and ATAC-seq experiments and further intersected with RNA-seq data.

<p align="center">
  <img src="images/workflow.png" width="300" height="300" alt="Alt Text">
</p>

## REFERENCES
1. Foulkes WD, Smith IE, Reis-Filho JS. Triple-negative breast cancer. New England journal of medicine. 2010 Nov 11;363(20):1938-48.
2. Zhao J, Liu C, Zhao Z. ARID1A: a potential prognostic factor for breast cancer. Tumor Biology. 2014 May;35:4813-9.
3. Park PJ. ChIP–seq: advantages and challenges of a maturing technology. Nature reviews genetics. 2009 Oct;10(10):669-80.
4. Yan F, Powell DR, Curtis DJ, Wong NC. From reads to insight: a hitchhiker’s guide to ATAC-seq data analysis. Genome biology. 2020 Dec;21:1-6.

