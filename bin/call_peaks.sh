#!/bin/sh
source ~/.bash_profile

cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks

#pool input
zcat input0.SE.tagAlign.gz input1.SE.tagAlign.gz | gzip -c > inputAll.SE.tagAlign.gz

# #without -x=-500:85
# #working##
# Rscript /home/doanea/tools/spp_package/run_spp.R -p=12 -c=AR2.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=peaks/reps -savr -savp -rf -out=stats/ARpeakStats.tab
# Rscript /home/doanea/tools/spp_package/run_spp.R -p=12 -c=AR1.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=peaks/reps -savr -savp -rf -out=stats/ARpeakStats.tab
# Rscript /home/doanea/tools/spp_package/run_spp.R -p=12 -c=AR0.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=peaks/reps -savr -savp -rf -out=stats/ARpeakStats.tab

#with input var
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=${1} -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=reps -savr -savp -rf #-out=stats/ARpeakStats.tab
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=${2} -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=reps -savr -savp -rf #-out=stats/ARpeakStats.tab
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=${3} -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=reps -savr -savp -rf #-out=stats/ARpeakStats.tab
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=${4} -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=reps -savr -savp -rf #-out=stats/FOXA1peakStats.tab
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=${5} -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=reps -savr -savp -rf #-out=stats/FOXA1peakStats.tab
#Rscript /home/doanea/tools/spp_package/run_spp.R -p=12 -c=${6} -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=reps -savr -savp -rf -out=stats/ARpeakStats.tab
#Rscript /home/doanea/tools/spp_package/run_spp.R -p=12 -c=${7} -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=reps -savr -savp -rf -out=stats/ARpeakStats.tab



# #with -x=-500:85
# Rscript /home/doanea/tools/spp_package/run_spp.R -p=8 -x=-500:85 -c=AR2.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=peaks/reps/x -savr -savp -rf -out=stats/ARpeakStatsx.tab
# Rscript /home/doanea/tools/spp_package/run_spp.R -p=8 -x=-500:85 -c=AR1.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=peaks/reps/x -savr -savp -rf -out=stats/ARpeakStatsx.tab
# Rscript /home/doanea/tools/spp_package/run_spp.R -p=8 -x=-500:85 -c=AR0.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=peaks/reps/x -savr -savp -rf -out=stats/ARpeakStatsx.tab

#Rscript /home/doanea/tools/spp_package/run_spp.R -c=AR0.SE.tagAlign.gz -savp -rf -out=stats/ARpeakStats.tab

#Rscript /home/doanea/tools/spp_package/run_spp.R -x=-500:85 -c=AR2.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -savp -rf -out=stats/ARpeakStats.tab

# #combine chipseq experiment samples
# cd /ifs/e63data/leslielab/doanea/453chipseq/data/aln
# zcat AR0.SE.tagAlign.gz AR1.SE.tagAlign.gz AR2.SE.tagAlign.gz | gzip -c > AR_all.SE.tagAlign.gz
# #cal peaks on poled chipseq data
# Rscript /home/doanea/tools/spp_package/run_spp.R -p=12 -c=AR_all.SE.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=peaks/pooled -savr -savp -rf -out=stats/AR_allpeakStats.tab
