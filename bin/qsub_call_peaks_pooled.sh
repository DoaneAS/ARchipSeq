#!/bin/sh
source /common/sge/default/common/settings.sh
#$ -S /bin/sh
#$ -N call_pks_pooled
#$ -cwd
#$ -pe smp 2
#$ -l h_vmem=12G,virtual_free=24G
#$ -j y

source ~/.bash_profile

call_peaks_pooled.sh  #input
