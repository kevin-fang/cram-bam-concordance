cwlVersion: v1.0
class: CommandLineTool

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
  - class: ScatterFeatureRequirement
  - class: DockerRequirement
    dockerPull: kfangcurii/bcbio

inputs:
  bamDirectory:
    type: Directory

steps:
  jobCreation:
    run: jobCreation.cwl
    in:
      bamDirectory: bamDirectory
    out:
      bcbioJobs:
        type: Directory
        outputBinding:
          glob: jobs/
  readJobList:
    run: readJobList.cwl
    in:
      inDir: jobCreation/bcbioJobs
    out: [jobs]

  cramConversion:
    run: cramConversion.cwl
    scatter: [job]
    scatterMethod: dotproduct
    in:
      jobFiles: jobCreation/bcbioJobs
      job: readJobList/jobs
