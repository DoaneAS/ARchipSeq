#!/bin/sh
source /common/sge/default/common/settings.sh
#$ -S /bin/sh
#$ -N call_pks
#$ -t 1-5
#$ -cwd
#$ -pe smp 8
#$ -l h_vmem=12G,virtual_free=32G
#$ -j y

source ~/.bash_profile

#tasks=(1 2 3 4 5 6)
#input=$tasks[$SGE_TASK_ID]

#this is the script that actually does the work
#use its full path to be safe
#tasks=(1 2 3 4)
#input=$tasks[$SGE_TASK_ID]


INFILE=`sed -n "${SGE_TASK_ID}p" my_file_list.txt`

call_peaks.sh ${INFILE}
