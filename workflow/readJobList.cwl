cwlVersion: v1.0
class: ExpressionTool

$namespaces:
  arv: "http://arvados.org/cwl#"
  cwltool: "http://commonwl.org/cwltool#"

requirements:
- class: InlineJavascriptRequirement

inputs:
  inDir:
    type: Directory

outputs:
  yamls:
    type: File[]

expression: "${
    var yamls = [];
    for (var i = 0; i < inputs.inDir.listing.length; i++) {
      var name = inputs.inDir.listing[i];
      var location = name.location;
      var basename = name.basename;
      if (basename.indexOf('yaml') !== -1) {
          yamls.push(name);
        }
    }
    return {'yamls': yamls};
}"
