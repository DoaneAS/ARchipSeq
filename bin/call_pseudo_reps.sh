#!/bin/bash
source /common/sge/default/common/settings.sh
source ~/.bash_profile

cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/mapped
fileName='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/mapped/SRR776488.SE.tagAlign.gz' # input tagAlign file name
outputDir='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps' # output directory for pseudoreplicate files
outputStub='SRR776488' # prefix name for pseudoReplicate files
nlines=$( zcat ${fileName} | wc -l ) # Number of reads in the tagAlign file
nlines=$(( (nlines + 1) / 2 )) # half that number
zcat "${fileName}" | shuf | split -d -l ${nlines} - "${outputDir}/${outputStub}" # This will shuffle the lines in the file and split it into two parts
gzip "${outputDir}/${outputStub}00"
gzip "${outputDir}/${outputStub}01"
mv "${outputDir}/${outputStub}00.gz" "${outputDir}/${outputStub}.pr1.tagAlign.gz"
mv "${outputDir}/${outputStub}01.gz" "${outputDir}/${outputStub}.pr2.tagAlign.gz"

# You will now have 2 self-pseudoReplicates in the directory named /peaks/PseudoReps/
# chipSampleRep1.pr1.tagAlign.gz
# chipSampleRep1.pr2.tagAlign.gz

# Now call peaks on each of these using the pooled control dataset as the control (REMEMBER TO USE RELAXED THRESHOLDS AND TRY TO CALL 150k to 300k peaks even if most of them are noise)
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776488.pr1.tagAlign.gz -i=iSRR776493.SE.tagAlign.gz -npeak=300000 -odir=PseudoReps -savr -savp -rf
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776488.pr2.tagAlign.gz -i=SRR776493.SE.tagAlign.gz -npeak=300000 -odir=PseudoReps -savr -savp -rf

Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776490.pr1.tagAlign.gz -i=SRR776493.SE.tagAlign.gz -npeak=300000 -odir=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/ -savr -savp -rf
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776490.pr2.tagAlign.gz -i=SRR776493.SE.tagAlign.gz -npeak=300000 -odir=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/ -savr -savp -rf
cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/mapped
fileName='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/mapped/SRR776489.SE.tagAlign.gz' # input tagAlign file name
outputDir='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps' # output directory for pseudoreplicate files
outputStub='SRR776489' # prefix name for pseudoReplicate files
nlines=$( zcat ${fileName} | wc -l ) # Number of reads in the tagAlign file
nlines=$(( (nlines + 1) / 2 )) # half that number
zcat "${fileName}" | shuf | split -d -l ${nlines} - "${outputDir}/${outputStub}"
gzip "${outputDir}/${outputStub}01"
mv "${outputDir}/${outputStub}00.gz" "${outputDir}/${outputStub}.pr1.tagAlign.gz"
mv "${outputDir}/${outputStub}01.gz" "${outputDir}/${outputStub}.pr2.tagAlign.gz"

Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776489.pr1.tagAlign.gz -i=SRR776493.SE.tagAlign.gz -npeak=300000 -odir=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/ -savr -savp -rf
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776489.pr2.tagAlign.gz -i=SRR776493.SE.tagAlign.gz -npeak=300000 -odir=PseudoReps -savr -savp -rf


Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776488.pr1.tagAlign.gz -i=SRR776493.SE.tagAlign.gz -npeak=300000 -savr -savp -rf

cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/mapped
fileName='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/mapped/SRR776490.SE.tagAlign.gz' # input tagAlign file name
outputDir='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps' # output directory for pseudoreplicate files
outputStub='SRR776490' # prefix name for pseudoReplicate files
nlines=$( zcat ${fileName} | wc -l ) # Number of reads in the tagAlign file
nlines=$(( (nlines + 1) / 2 )) # half that number
zcat "${fileName}" | shuf | split -d -l ${nlines} - "${outputDir}/${outputStub}"
gzip "${outputDir}/${outputStub}00"
gzip "${outputDir}/${outputStub}01"
mv "${outputDir}/${outputStub}00.gz" "${outputDir}/${outputStub}.pr1.tagAlign.gz"
mv "${outputDir}/${outputStub}01.gz" "${outputDir}/${outputStub}.pr2.tagAlign.gz"



fileName='FOXA1_all.SE.tagAlign.gz' # input tagAlign file name
outputDir='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps' # output directory for pseudoreplicate files
outputStub='FOXA1_all' # prefix name for pseudoReplicate files

cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks

nlines=$( zcat ${fileName} | wc -l ) # Number of reads in the tagAlign file
nlines=$(( (nlines + 1) / 2 )) # half that number
zcat "${fileName}" | shuf | split -d -l ${nlines} - "${outputDir}/${outputStub}" # This will shuffle the lines in the file and split it into two parts
gzip "${outputDir}/${outputStub}00"
gzip "${outputDir}/${outputStub}01"
mv "${outputDir}/${outputStub}00.gz" "${outputDir}/${outputStub}.pr1.tagAlign.gz"
mv "${outputDir}/${outputStub}01.gz" "${outputDir}/${outputStub}.pr2.tagAlign.gz"

# You will now have 2 self-pseudoReplicates in the directory named /peaks/PseudoReps/
# chipSampleRep1.pr1.tagAlign.gz
# chipSampleRep1.pr2.tagAlign.gz

# Now call peaks on each of these using the pooled control dataset as the control (REMEMBER TO USE RELAXED THRESHOLDS AND TRY TO CALL 150k to 300k peaks even if most of them are noise)
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/FOXA1_all.pr1.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=PseudoReps -savr -savp -rf
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/FOXA1_all.pr2.tagAlign.gz -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=PseudoReps -savr -savp -rf
