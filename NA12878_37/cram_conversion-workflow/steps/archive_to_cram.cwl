$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-parallel
- sentinel_outputs=archive_bam
- sentinel_inputs=postprocess_alignment_rec:record
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- archive_to_cram
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 4
  outdirMin: 462756
  ramMin: 12288
  tmpdirMin: 226258
- class: dx:InputResourceRequirement
  indirMin: 18245
- class: SoftwareRequirement
  packages:
  - package: samtools
    specs:
    - https://anaconda.org/bioconda/samtools
inputs:
- id: postprocess_alignment_rec
  type:
    fields:
    - name: resources
      type: string
    - name: description
      type: string
    - name: config__algorithm__tools_on
      type:
      - 'null'
      - items: 'null'
        type: array
    - name: config__algorithm__variant_regions
      type:
      - File
      - 'null'
    - name: genome_resources__rnaseq__gene_bed
      type: File
    - name: genome_resources__variation__encode_blacklist
      type: File
    - name: genome_resources__variation__dbsnp
      type: File
    - name: config__algorithm__exclude_regions
      type:
      - 'null'
      - items: 'null'
        type: array
    - name: reference__fasta__base
      type: File
    - name: config__algorithm__coverage_interval
      type:
      - 'null'
      - string
    - name: config__algorithm__recalibrate
      type:
      - string
      - 'null'
      - boolean
    - name: genome_resources__variation__polyx
      type: File
    - name: config__algorithm__archive
      type: string
    - name: genome_resources__variation__lcr
      type: File
    - name: align_bam
      type:
      - File
      - 'null'
    - name: config__algorithm__variant_regions_merged
      type:
      - File
      - 'null'
    - name: config__algorithm__variant_regions_orig
      type:
      - File
      - 'null'
    - name: config__algorithm__coverage
      type:
      - File
      - 'null'
    - name: config__algorithm__coverage_merged
      type:
      - File
      - 'null'
    - name: config__algorithm__coverage_orig
      type:
      - File
      - 'null'
    - name: config__algorithm__seq2c_bed_ready
      type:
      - File
      - 'null'
    name: postprocess_alignment_rec
    type: record
outputs:
- id: archive_bam
  secondaryFiles:
  - .crai
  type:
  - File
  - 'null'
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
