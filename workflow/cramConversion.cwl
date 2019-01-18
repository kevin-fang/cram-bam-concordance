cwlVersion: v1.0
class: CommandLineTool

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
  - class: DockerRequirement
    dockerPull: kfangcurii/bcbioarvados

hints:
  arv:RuntimeConstraints:
    outputDirType: keep_output_dir
    keep_cache: 4096
  arv:APIRequirement: {}

baseCommand: ["bcbio_nextgen.py", "/usr/local/share/bcbio-nextgen/galaxy/bcbio_system.yaml"]

inputs:
  job:
    type: File
    inputBinding:
      position: 1
outputs:
  cram:
    type: File
    outputBinding:
      glob: "*.cram"
