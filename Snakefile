shell.executable("/bin/sh")
shell.prefix("source ~/.bash_profile; ")
REF = "/ifs/e63data/leslielab/doanea/chipseq/hg19/genome"
BOWTIE2_INDEXES="/ifs/e63data/leslielab/doanea/chipseq/hg19/"
#SAMPLES = "AR0 AR1 AR2 input0 input1".split()

#sample names and classes
#SAMPLES = "test test2".split()
SAMPLES = "AR0 AR1 AR2 FOXA1_0 FOXA1_1 input0 input1".split()
#SAMPLES = list("AR0")


# CLASS_AR = SAMPLES[:2]
# CLASS_INPUT = SAMPLES[3:]
# # path to bam files
# rule all:
#     input: expand("{sample}.regionPeak", sample=SAMPLES)

rule all:
    input: expand("{samples}.SE.tagAlign.gz", samples=SAMPLES)
    #input: "test2.SE.tagAlign.gz", "test1.SE.tagAlign.gz"#, "AR1.SE.tagAlign.gz", "AR2.SE.tagAlign.gz", "FOXA1_0.SE.tagAlign.gz", "FOXA1_1.SE.tagAlign.gz", "input0.SE.tagAlign.gz", "input1.SE.tagAlign.gz"
    #input: "data/mapped/AR0.bam", "data/mapped/AR1.bam", "data/mapped/AR2.bam",
    #    "data/mapped/input0.bam", "data/mapped/input1.bam"

#CLASS_FQ = expand('data/fastq/{sample}.bam', sample=SAMPLES)

# rule poolReps:
#     input: "{samples}.SE.tagAlign.gz"
#     output: "{samples}.pooled.SE.tagAlign.gz"

rule filterBam:
    input: "data/fastq/{samples}.bam"
    output: "{samples}.SE.tagAlign.gz"
    shell: "bin/filtBam.sh {input} > {output}"

rule bowtie:
    input: "{samples}.fastq"
    output: "{samples}.bam"
    shell:
        "bowtie2 -q -p 24 -x genome --very-sensitive {input} | samtools view -bS - > {output}"
    #shell: "${BT2_HOME}bowtie2 -p 20 -x genome -U {input} -S {output}"

# rule bowtie:
#    input: "{samples}.fastq"
#    output: "{samples}.sam"
#    message: "executing command following output {output} and input {input}"
#    shell: "/global/home/users/ebolotin/seqtools/bowtie2/bowtie2-2.1.0/bowtie2 -p 20 --very-sensitive  -x   {REF}   -U  {input} -S {output}"
