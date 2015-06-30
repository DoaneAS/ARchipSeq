#!/bin/bash
source ~/.bash_profile

bamToBed -i ${1} | awk 'BEGIN{FS="\t";OFS="\t"}{$4="N"; print $0}' | gzip -c
