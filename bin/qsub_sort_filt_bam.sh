#!/bin/sh
source /common/sge/default/common/settings.sh
#$ -S /bin/sh
#$ -N sort_bam
#$ -sync y
#$ -cwd
#$ -t 1-7
#$ -pe smp 8
#$ -l h_vmem=12G,virtual_free=24G
#$ -j y

source ~/.bash_profile

#tasks=(1 2 3 4 5 6)
#input=$tasks[$SGE_TASK_ID]

#this is the script that actually does the work
#use its full path to be safe
cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/bin/
##{INFILE}=`sed -n "${SGE_TASK_ID}p" my_file_list.txt`
INFILE=`sed -n "${SGE_TASK_ID}p" bam_file_list.txt`
#tasks=(1 2 3 4)
#input=$tasks[$SGE_TASK_ID]


/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/bin/filtBam.sh ${INFILE}
