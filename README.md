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

### Data Collection 

High-throughput sequencing in ARID1A knockout MDA-MB-231 cells data was obtained from NCBI GEO dataset GSE234179 [3]. The dataset comprises of 20 ChIP-seq sam-ple, 10-ATAC seq samples and 6 RNA-seq samples. Raw ChIP-seq data were generated using three histone specific antibodies (H3K4me3, H3K4me1 and H3K27ac) under ARID1A knockout and normal conditions, with two repli-cates of each sample and their corresponding controls. The raw ATAC-seq samples are from ARIDIA knockout and nor-mal conditions. The RNA-seq data were processed using the Illumina HiSeq 2000 platform, and base calling was per-formed using Illumina Casava software. Reads were mapped to hg38 genome using bowtie and quantified using feature counts. For this project, the raw ChIP and ATAC read files (FASTQ) and processed RNA-seq data are used.


### Raw read processing

**_Quality check and Trimming_**

Quality of the raw reads was analyzed using FASTQC algo-rithm [7]. The reads were examined to determine whether they met the criteria for per base quality, sequence duplication level, per sequence quality, and adapter content. For those reads that failed these checks, the TRIMMOMATIC algorithm [8] was employed to trim the low-quality bases and remove adapters. The adaptor content was removed using the ILLUMINACLIP: TruSeq3-PE.fa:2:30:10 parameter.

**_Alignment to the reference genome_**

The Bowtie2 aligner [9] was utilized to map the reads to the reference genome, specifically the human genome version hg38. The resulting SAM files from the alignment were con-verted to sorted Binary Alignment Map (BAM) files using samtools [10]. 

### ChIP-Seq Analysis 

**_Biological Quality Control_**

The Deeptools plotfingerprint tool [11] was employed to assess the distinction between the reads from the ChIP-seq sample and those from the control sample. These plots were evaluated to understand the extent of genome sequencing and the enrichments observed.

**_Peak Calling_**

MACS algorithm [12] was used to call the peaks from the sorted BAM files between the ChIP and ATAC experiments and its matched control sample. The algorithm was run with a shift of -100, extsize of 200, the upper and lower limits of the model as [10,30], broad peak with cutoff of 0.1 and pvalue cutoff of 1e-04.

**_Peak Annotation and Differential Peak Analysis_**

Homer algorithms [13] annotatePeak.pl command was used to annotate the peaks obtained using MACS. The peaks are annotated to different genomic regions like 3’ UTR, Promoter (<1kb), Promoter (1-2kb), Intron, Exon etc.

The getDifferentialPeaksReplicates.pl function was used to obtained peaks that are differentially expressed between Knockout ARID1A H3K4me1 chip samples and Knockout ARID1A input samples, as well as Knockout ARID1A H3K4me1 chip and Normal H3K4me1 chip samples. In ATAC seq all three knockout samples are differentiated with the normal samples. 

**_Visualizations_** 

Subsequently, the .bdg files generated by the MACS peak caller were transformed into wig files via bed-graph_to_wig.pl, while bed files were created from the .broadpeak files. These converted files were employed in the Integrated Genome Browser (IGV) [14] to facilitate visualiza-tion.

### ATAC-seq Analysis


The raw ATAC-seq data had 3 replicates of knockout and 3 replicates of control samples. Homer’s makeTagDirectories was used to create tag directories of IP and control samples separately. The tagdirectories are then supplied to the FindPeaks function and further the resulted peaks are anno-tated using annotatePeaks.pl function.

### RNA-Seq Downstream Analysis

**_Differential Gene Expression_**

The processed RNA quantification data and the respective phenotype is obtained using the getGEO function in GEOquery package of R. Differential gene expression analy-sis of the datasets is done using the DESeq2 [15]. DESeqDa-taSetFromMatrix function was used to create an DESeq ob-ject designed over the type of sample (tumor or normal) and covariates. Genes with counts greater than equal to 10 in more than 75% of the samples are retained while the others are removed. Genes with FDR less than 0.005 and |logFC >=1| are considered as differentially expressed genes.


**_Functional Enrichment Analysis_**

Gene Ontology analysis was performed on the differentially expressed genes using enrichGO function in clusterprofiler R package [16].


<p align="center">
  <img src="images/workflow.png" width="300" height="300" alt="Alt Text">
</p>

## DISCUSSION

This study employed three sequencing techniques, assessing raw sequencing data that exhibited robust alignment, with over 85% alignment to reference genes. ChIP-seq analysis revealed a widespread enrichment of peak signals, notably in broad peak regions, and demonstrated consistency across replicates, strengthening the reliability of identified peaks. While nearly 6,000 differentially expressed peaks were ini-tially identified, stringent criteria reduced this number to less than 300 genes, underscoring the balance between sensitivity and specificity in peak calling methods. Notably, the over-lapping differentially expressed peaks and genes suggested potential regulatory regions affected by the knockout condi-tion.


The gene PIK3R1 which is found to be common between all the analyses is associate with the PI3K pathway. Recent studies have shown that the mutation of ARID1A is in-volved in tumor development by the activation of the PI3K pathway. It is documented that in breast cancer the silencing of ARID1A leads to the phosphorylation of PI3K pathway suggesting an interrelationship [17].

## CONCLUSION

The study identified genes that are overlapping between ChIP-seq, ATAC-seq and RNA-seq suggesting that the over-lap shows potential regulatory regions that are affected by the knockout of ARID1A in triple negative breast cancer. Further analysis needs to be done to identify the biological processes that the peaks are involved in, and how these pathways are contained in ARID1A mechanism.


## REFERENCES
1. Foulkes WD, Smith IE, Reis-Filho JS. Triple-negative breast cancer. New England journal of medicine. 2010 Nov 11;363(20):1938-48.
2. Zhao J, Liu C, Zhao Z. ARID1A: a potential prognostic factor for breast cancer. Tumor Biology. 2014 May;35:4813-9.
3. Park PJ. ChIP–seq: advantages and challenges of a maturing technology. Nature reviews genetics. 2009 Oct;10(10):669-80.
4. Yan F, Powell DR, Curtis DJ, Wong NC. From reads to insight: a hitchhiker’s guide to ATAC-seq data analysis. Genome biology. 2020 Dec;21:1-6.

