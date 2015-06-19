#!/usr/bin/python

import subprocess, shlex
import sys
import os
import sys
import yaml
import glob
import subprocess
import string


#bamfile = "/Users/doanea/data/chipseq/453AR0.bam"#

def expandOsPath(path):
    """
    To expand the path with shell variables.
    Arguments:
    - `path`: path string
    """
    return os.path.expanduser(os.path.expandvars(path))

def genFilesWithPattern(pathList, Pattern):
    """
    To generate files list on the fly based on wildcards pattern.
    Arguments:
    - `pathList`: the path of the files
    - `Pattern`: pattern like config["input_files"]
    """
    pathList.append(Pattern)
    Files = expandOsPath(os.path.join(*pathList))
    return Files



bamfile = sys.argv[1]
input_bam_file = bamfile


input_bam_filename = input_bam_file
input_bam_basename = input_bam_file.rstrip('.bam')

intermediate_TA_filename = input_bam_basename + ".tagAlign"
end_infix = 'SE'
final_TA_filename = input_bam_basename + '.' + end_infix + '.tagAlign.gz'

outfile=final_TA_filename

# p4 = subprocess.Popen(['gzip', '-c'],
#             stdin=p3.stdout
#             )
#gzip -c > chipSampleRep1.tagAlign.gz






def run_pipe(steps, outfile=None):
    #break this out into a recursive function
    #TODO:  capture stderr
    from subprocess import Popen, PIPE
    p = None
    p_next = None
    first_step_n = 1
    last_step_n = len(steps)
    for n,step in enumerate(steps, start=first_step_n):
        print "step %d: %s" %(n,step)
        if n == first_step_n:
            if n == last_step_n and outfile: #one-step pipeline with outfile
                with open(outfile, 'w') as fh:
                    print "one step shlex: %s to file: %s" %(shlex.split(step), outfile)
                    p = Popen(shlex.split(step), stdout=fh)
                break
            print "first step shlex to stdout: %s" %(shlex.split(step))
            p = Popen(shlex.split(step), stdout=PIPE)
            #need to close p.stdout here?
        elif n == last_step_n and outfile: #only treat the last step specially if you're sending stdout to a file
            with open(outfile, 'w') as fh:
                print "last step shlex: %s to file: %s" %(shlex.split(step), outfile)
                p_last = Popen(shlex.split(step), stdin=p.stdout, stdout=fh)
                p.stdout.close()
                p = p_last
        else: #handles intermediate steps and, in the case of a pipe to stdout, the last step
            print "intermediate step %d shlex to stdout: %s" %(n,shlex.split(step))
            p_next = Popen(shlex.split(step), stdin=p.stdout, stdout=PIPE)
            p.stdout.close()
            p = p_next
    out,err = p.communicate()
    return out,err


# out,err = run_pipe([
#         "samtools view -b -F 1548 -q 30 %s" %(input_bam_filename),
#         "bamToBed -i",
#         r"""awk 'BEGIN{OFS="\t"}{$4="N";$5="1000";print $0}'""",
#         "tee %s" %(intermediate_TA_filename),
#         "gzip -c"],
#         outfile=final_TA_filename)


#make filtered bam file
outbam = input_bam_basename + '.filtered' + '.bam'
# out,err = run_pipe([
#     "samtools view -b -F 1548 -q 30 %s" %(input_bam_filename),
#     ],
#     outfile = outbam)
#
# print subprocess.check_output('ls -l', shell=True)


out,err = run_pipe([
        "samtools view -b -F 1548 -q 30 %s" %(input_bam_filename),
        "bamToBed -i",
        r"""awk 'BEGIN{OFS="\t"}{$4="N";$5="1000";print $0}'""",
        "tee %s" %(intermediate_TA_filename),
        "gzip -c"],
        outfile=final_TA_filename)
print subprocess.check_output('ls -l', shell=True)