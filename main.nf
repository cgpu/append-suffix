  
// Input channel, fromPath it retrieves all objects of type 'file'
input = Channel.fromPath(params.input)
                .ifEmpty { exit 1, "Input .csv 404, try with another file?: ${params.input}" }
                .splitCsv(sep: ',')
                .map{ my_array -> my_array.collect { it+".bam"}}
                .view()