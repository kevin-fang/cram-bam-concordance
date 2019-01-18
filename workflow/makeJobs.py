import os
import sys

job_template = """details:
- algorithm:
    aligner: false
    archive: cram-lossless
  analysis: variant2
  description: {description} BAM -> CRAM
  files:
  - {bam_file}
  genome_build: GRCh37
fc_name: bam_cram_conversion
"""

if os.path.isdir('./jobs'):
    raise Exception("jobs/ directory exists. Please delete or change the name before running.")
else:
    os.mkdir("./jobs")

for subdir, dirs, files in os.walk(sys.argv[1]):
    for f in files:
        if f.endswith(".bam"):
            filename = "cram_{}.yaml".format(f[:-4])
            filepath = os.path.abspath(os.path.join(subdir, f))
            with open("jobs/" + filename, 'w') as job_file:
                job_file.write(job_template.format(description=f[:-4], bam_file=filepath))
