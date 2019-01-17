cwlVersion: v1.0
class: CommandLineTool

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
  - class: DockerRequirement
    dockerPull: kfangcurii/bcbio

hints:
  arv:RuntimeConstraints:
    outputDirType: keep_output_dir
    keep_cache: 4096
  arv:APIRequirement: {}

baseCommand: bcbio_nextgen.py 
inputs:
  job:
    type: string
    inputBinding:

