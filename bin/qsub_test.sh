#!/bin/sh
source /common/sge/default/common/settings.sh
#$ -S /bin/sh
#$ -N test_sge
#$ -sync y
#$ -cwd
#$ -t 1-2
#$ -pe smp 2
#$ -l h_vmem=1G,virtual_free=1G
#$ -j y
PATH=$PATH
source ~/.bash_profile

#tasks=(1 2 3 4 5 6)
#input=$tasks[$SGE_TASK_ID]

#this is the script that actually does the work
#use its full path to be safe

##{INFILE}=`sed -n "${SGE_TASK_ID}p" my_file_list.txt`
INFILE=`sed -n "${SGE_TASK_ID}p" my_file_list.txt`
#tasks=(1 2 3 4)
#input=$tasks[$SGE_TASK_ID]
echo ${SGE_TASK_ID}

test_sge.sh ${INFILE}
