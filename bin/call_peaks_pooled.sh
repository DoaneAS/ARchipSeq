#!/bin/sh
source ~/.bash_profile

cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks
zcat AR0.SE.tagAlign.gz AR1.SE.tagAlign.gz AR2.SE.tagAlign.gz | gzip -c > AR_all.SE.tagAlign.gz
zcat FOXA1_0.SE.tagAlign.gz FOXA1_1.SE.tagAlign.gz | gzip -c > FOXA1_all.SE.tagAlign.gz

#cal peaks on poled chipseq data
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=AR_all.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=pooled -savr -savp -rf #-out=stats/AR_allpeakStats.tab
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=FOXA1_all.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=pooled -savr -savp -rf #-out=stats/FOXA1_allpeakStats.tab
