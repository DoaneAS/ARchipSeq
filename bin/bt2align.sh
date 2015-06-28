#!/bin/bash
source ~/.bash_profile
cd /home/doanea/Projects/ARchipSeq/data
bowtie2 -q -p 12 -x ~/Projects/ARchipSeq/data/hg19/genome SRR776488.fastq --very-sensitive | samtools view -bS - > SRR776488.bam 
