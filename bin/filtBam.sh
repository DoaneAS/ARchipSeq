#!/bin/sh
source ~/.bash_profile

samtools view -b -F 1548 -q 30 ${1} | bamToBed -i stdin | awk 'BEGIN{FS="\t";OFS="\t"}{$4="N"; print $0}' | gzip -c
