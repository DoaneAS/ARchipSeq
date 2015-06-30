#!/bin/sh


cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/mapped
fileName='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/mapped/SRR776488.SE.tagAlign.gz' # input tagAlign file name
outputDir='/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps' # output directory for pseudoreplicate files
outputStub='SRR776489' # prefix name for pseudoReplicate files
nlines=$( zcat ${fileName} | wc -l ) # Number of reads in the tagAlign file
nlines=$(( (nlines + 1) / 2 )) # half that number
zcat "${fileName}" | shuf | split -d -l ${nlines} - "${outputDir}/${outputStub}" # This will shuffle the lines in the file and split it into two parts
gzip "${outputDir}/${outputStub}00"
gzip "${outputDir}/${outputStub}01"
mv "${outputDir}/${outputStub}00.gz" "${outputDir}/${outputStub}.pr1.tagAlign.gz"
mv "${outputDir}/${outputStub}01.gz" "${outputDir}/${outputStub}.pr2.tagAlign.gz"

Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c="${outputDir}/${outputStub}.pr1.tagAlign.gz" \
-i=SRR776493.SE.tagAlign.gz \
-npeak=300000 -odir=cd /ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/ \
-savr -savp -rf
Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c="${outputDir}/${outputStub}.pr2.tagAlign.gz" \
-i=SRR776493.SE.tagAlign.gz -npeak=300000 \
-odir=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps -savr -savp -rf



Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776488.pr1.tagAlign.gz -i=SRR776493.SE.tagAlign.gz -npeak=300000 -odir=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps -rf -out=spp_res_SRR76488pr1.txt

Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps/SRR776488.pr2.tagAlign.gz -i=SRR776493.SE.tagAlign.gz -npeak=300000 -odir=/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/peaks/PseudoReps -rf -out=spp_res_SRR76488pr2.txt

#column 3 of this output is frag length from spp:
sed -r 's/,[^\t]+//g' <outFile> > <newOutFile>
