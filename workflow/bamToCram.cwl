cwlVersion: v1.0
class: Workflow


$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
  - class: ScatterFeatureRequirement
  - class: DockerRequirement
    dockerPull: kfangcurii/bcbioarvados
  - class: SubworkflowFeatureRequirement
  - class: InlineJavascriptRequirement

inputs:
  bamDirectory:
    type: Directory
  pythonScript:
    type: File

outputs:
  processed:
    type: File[]
    outputSource: cramConversion/cram

steps:
  jobCreation:
    run: jobCreation.cwl
    in:
      bamDirectory: bamDirectory
      script: pythonScript
    out: [out1]
  readJobList:
    run: readJobList.cwl
    in:
      inDir: jobCreation/out1
    out: [yamls]
  cramConversion:
    run: cramConversion.cwl
    scatter: [job]
    scatterMethod: dotproduct
    in:
      job: readJobList/yamls
    out: [cram]
