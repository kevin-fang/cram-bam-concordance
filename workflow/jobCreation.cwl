#/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
  - class: DockerRequirement
    dockerPull: cure/arvados-download

hints:
  arv:RuntimeConstraints:
    outputDirType: keep_output_dir
    keep_cache: 4096
  arv:APIRequirement: {}

baseCommand: python

inputs:
  script:
    type: File
    inputBinding:
      position: 1
  bamDirectory:
    type: Directory
    inputBinding:
      position: 2

outputs:
  out1:
    type: Directory
    outputBinding:
      glob: "*"

