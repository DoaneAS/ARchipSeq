#!/bin/sh
source ~/.bash_profile

cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/fastq

# for i in "$@"
# do
#   samtools view -b -F 1548 -q 30 "$i" | samtools sort -@ 8 - "$i"_sorted
# done
#

samtools view -b -F 1548 -q 30 ${1} | samtools sort -@ 8 - "$i"_sorted
samtools view -b -F 1548 -q 30 ${2} | samtools sort -@ 8 - "$i"_sorted
samtools view -b -F 1548 -q 30 ${3} | samtools sort -@ 8 - "$i"_sorted
samtools view -b -F 1548 -q 30 ${4} | samtools sort -@ 8 - "$i"_sorted
samtools view -b -F 1548 -q 30 ${5} | samtools sort -@ 8 - "$i"_sorted
samtools view -b -F 1548 -q 30 ${6} | samtools sort -@ 8 - "$i"_sorted
samtools view -b -F 1548 -q 30 ${7} | samtools sort -@ 8 - "$i"_sorted
