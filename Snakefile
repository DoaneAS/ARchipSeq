shell.executable("/bin/sh")
shell.prefix("source ~/.bash_profile; ")
REF = "/ifs/e63data/leslielab/doanea/Projects/ARchipSeq/data/hg19/"

#SAMPLES = "AR0 AR1 AR2 input0 input1".split()

#sample names and classes
SAMPLES = "SRR776488 SRR776489 SRR776490 SRR776491 SRR776492 SRR776493".split()
#RNA-seq samples
#SAMPLES = "AR0 AR1".split()

#SAMPLES = "t1 t3".split()
#SAMPLES = "AR0 AR1 AR2 FOXA1_0 FOXA1_1 input0 input1".split()
#SAMPLES = list("AR0")

#next TODO build in Rscript spp
rule all:
    input: expand("{sample}.SE.tagAlign.gz", sample=SAMPLES)
    #input: "test2.SE.tagAlign.gz", "test1.SE.tagAlign.gz"#, "AR1.SE.tagAlign.gz", "AR2.SE.tagAlign.gz", "FOXA1_0.SE.tagAlign.gz", "FOXA1_1.SE.tagAlign.gz", "input0.SE.tagAlign.gz", "input1.SE.tagAlign.gz"
    #input: "data/mapped/AR0.bam", "data/mapped/AR1.bam", "data/mapped/AR2.bam",
    #    "data/mapped/input0.bam", "data/mapped/input1.bam"


#Rscript /home/doanea/tools/spp_package/run_spp.R -p=24 -c=${1} -i=inputAll.SE.tagAlign.gz -npeak=300000 -odir=reps -savr -savp -rf #-out=stats/ARpeakStats.tab

rule bam2tag:
    input: "data/mapped/{sample}.bam"
    output: "{sample}.SE.tagAlign.gz"
    shell: """
        bin/filtBam.sh {input} > data/mapped/{output}
        """
