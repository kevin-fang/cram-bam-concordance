#/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
- class: InlineJavascriptRequirement

inputs:
  infile:
    type: File
    inputBinding:
      loadContents: true

outputs:
  urls:
    type: string[]

expression: "${var lines = inputs.infile.contents.split('\\n');
               var nblines = lines.length;
               var jobs = [];
               for (var i = 0; i < nblines; i++) {
                  var line = lines[i];
                  if (line) {
                    jobs.push(line);
                  }
                }
               return { 'jobs': jobs } ;
              }"

