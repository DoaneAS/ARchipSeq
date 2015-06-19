#!/bin/bash

PK0='/Users/doanea/data/453chipseq/IDR/AR0.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
PK1='/Users/doanea/data/453chipseq/IDR/AR1.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
PK2='/Users/doanea/data/453chipseq/IDR/AR2.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'

export PATH="/opt/share/idrCode:$PATH"
#Rscript /opt/share/idrCode/batch-consistency-analysis.r $PK1 $PK2 -1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2 0 F signal.value
#/Users/doanea/data/453chipseq/IDR/AR0.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak

#Rscript /opt/share/idrCode/batch-consistency-analysis.r /Users/doanea/data/453chipseq/IDR/AR1.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak /Users/doanea/data/453chipseq/IDR/AR2.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak -1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2 0 F signal.value
#touch PEAK_LIST
#idr --samples $PK1 $PK2 --peak-list PEAK_LIST --rank signal.value



# #the r script which works:
cd /Users/doanea/data/453chipseq/idrCode
Rscript batch-consistency-analysis.r /Users/doanea/data/453chipseq/IDR/AR1vAll.regionPeak /Users/doanea/data/453chipseq/IDR/AR1vAll.regionPeak -1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2 0 F signal.value
Rscript batch-consistency-plot.r 1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2


# Rscript batch-consistency-analysis.r /Users/doanea/data/453chipseq/IDR/AR1vAll.regionPeak /Users/doanea/data/453chipseq/IDR/AR1vAll.regionPeak -1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2 0 F signal.value
#
# #the r script which works:
# Rscript batch-consistency-plot.r 1 /Users/doanea/data/453chipseq/IDR/consistency/reps/AR /Users/doanea/data/453chipseq/IDR/consistency/reps/AR1_VS_AR2

####python script#####
#must call "source activate py3k" from shell first
cd /Users/doanea/data/453chipseq/
PK0='/Users/doanea/data/453chipseq/IDR/AR0.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
PK1='/Users/doanea/data/453chipseq/IDR/AR1.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
PK2='/Users/doanea/data/453chipseq/IDR/AR2.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
PKAll='/Users/doanea/data/453chipseq/IDR/AR_all.SE.tagAlign_VS_inputAll.SE.tagAlign.regionPeak'
idr --samples ${PK0} ${PK1} --rank signal.value --plot
idr --samples ${PK0} ${PK2} --rank signal.value --plot
idr --samples ${PK1} ${PK2} --rank signal.value --plot



######end python####
