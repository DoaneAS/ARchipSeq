#!/bin/sh
source /common/sge/default/common/settings.sh
#$ -S /bin/sh
#$ -N pseudo
#$ -cwd
#$ -pe smp 2
#$ -sync y
#$ -l h_vmem=30G,virtual_free=60G
#$ -j y

source ~/.bash_profile

#tasks=(1 2 3 4 5 6)
#input=$tasks[$SGE_TASK_ID]

#this is the script that actually does the work
#use its full path to be safe
#tasks=(1 2 3 4)
#input=$tasks[$SGE_TASK_ID]


#INFILE=`sed -n "${SGE_TASK_ID}p" pseudo_file_list.txt`

#run_ps.sh ${INFILE}

call_pseudo.sh
