#!/bin/bash

# PK0='/Users/doanea/data/453chipseq/IDR/AR0.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# PK1='/Users/doanea/data/453chipseq/IDR/AR1.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# PK2='/Users/doanea/data/453chipseq/IDR/AR2.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
#
# export PATH="/opt/share/idrCode:$PATH"
#Rscript /opt/share/idrCode/batch-consistency-analysis.r $PK1 $PK2 -1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2 0 F signal.value
#/Users/doanea/data/453chipseq/IDR/AR0.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak

#Rscript /opt/share/idrCode/batch-consistency-analysis.r /Users/doanea/data/453chipseq/IDR/AR1.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak /Users/doanea/data/453chipseq/IDR/AR2.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak -1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2 0 F signal.value
#touch PEAK_LIST
#idr --samples $PK1 $PK2 --peak-list PEAK_LIST --rank signal.value



# #the r script which works:
# cd /Users/doanea/Projects/ARchipSeq/data/peaks/reps
# PK0='/Users/doanea/Projects/ARchipSeq/data/peaks/reps/AR0.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# PK1='/Users/doanea/Projects/ARchipSeq/data/peaks/reps/AR1.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# PK2='re[s/AR2.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# Rscript batch-consistency-analysis.r ${PK0} ${PK1} -1 /Users/doanea/Projects/ARchipSeq/data/IDR/consistency/reps/AR1_VS_AR2 0 F signal.value
#Rscript batch-consistency-plot.r 1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2


# Rscript batch-consistency-analysis.r /Users/doanea/data/453chipseq/IDR/AR1vAll.regionPeak /Users/doanea/data/453chipseq/IDR/AR1vAll.regionPeak -1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2 0 F signal.value
#
# #the r script which works:
# Rscript batch-consistency-plot.r 1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2

####python script#####
#must call "source activate py3k" from shell first
# cd /Users/doanea/Projects/ARchipSeq/data/peaks/reps
# PK0='AR0.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# PK1='AR1.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# PK2='/Users/doanea/Projects/ARchipSeq/data/peaks/reps/AR2.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# PKAll='/Users/doanea/Projects/ARchipSeq/data/macs2/AR_all_VS_input_all_peaks.narrowPeak'
# F0='/Users/doanea/Projects/ARchipSeq/data/peaks/reps/FOXA1_0.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
# F1='/Users/doanea/Projects/ARchipSeq/data/peaks/reps/FOXA1_1.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
#

#for AR
PK0='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/macs2/AR_0_VS_input_all_peaks.narrowPeak.regionPeak.gz'
PK1='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/macs2/AR_1_VS_input_all_peaks.narrowPeak.regionPeak.gz'
PK2='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/macs2/AR_2_VS_input_all_peaks.narrowPeak.regionPeak.gz'
PKAll='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/macs2/AR_all_VS_input_all_peaks.narrowPeak.regionPeak.gz'
PK02='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/macs2/AR_0_2_VS_input_all_peaks.narrowPeak.regionPeak.gz'

#works:
idr --samples ${PK0} ${PK2} --peak-list ${PKAll} --rank p.value --plot --output-file AR_0_2_idrValues.txt

#excluding sample 1
idr --samples ${PK0} ${PK2} --peak-list ${PK02} --rank p.value --plot --output-file AR_0_2_idrValues.txt

#for FOXA1
FAll='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/macs2/FOXA1_all_VS_input_all_peaks.narrowPeak.regionPeak.gz'
F0='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/macs2/FOXA1_0_VS_input_all_peaks.narrowPeak.regionPeak.gz'
F1='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/macs2/FOXA1_1_VS_input_all_peaks.narrowPeak.regionPeak.gz'

#on pooled
idr --samples ${F0} ${F1} --peak-list ${FAll} --rank p.value --plot --output-file FOXA1_0_1_all_idrValues.txt
# idr --samples ${PK0} ${PK2} --rank signal.value --plot
# idr --samples ${PK1} ${PK2} --rank signal.value --plot

##SRR data set
MYC
MYCpr1='/home/doanea/Projects/ARchipSeq/data/peaks/macs2/MYC.pr1_V_INPUT_peaks.regionPeak.gz'
MYCpr2='/home/doanea/Projects/ARchipSeq/data/peaks/macs2/MYC.pr1_V_INPUT_peaks.regionPeak.gz'
idr --samples ${MYCpr1} ${MYCpr2} --rank p.value --plot --output-file MYC_pr1_v_pr2_idrValues.txt

AR
ARpr1='/home/doanea/Projects/ARchipSeq/data/peaks/macs2/AR.pr1_V_INPUT_peaks.narrowPeak'
ARpr2='/home/doanea/Projects/ARchipSeq/data/peaks/macs2/AR.pr2_V_INPUT_peaks.narrowPeak'
idr --samples ${ARpr1} ${ARpr2} --rank p.value --plot --output-file AR_pr1_v_pr2_idrValues.txt


FXpr1='/home/doanea/Projects/ARchipSeq/data/peaks/macs2/FOXA1.pr1_V_INPUT_peaks.narrowPeak'
FXpr2='/home/doanea/Projects/ARchipSeq/data/peaks/macs2/FOXA1.pr2_V_INPUT_peaks.narrowPeak'
idr --samples ${FXpr1} ${FXpr2} --rank p.value --plot --output-file FOXA1_pr1_v_pr2_idrValues.narrowPeak



######end python####
