#!/usr/bin/env nextflow

seq_ch = Channel.fromPath(params.inputFilePath).splitFasta( by:1, file:true  )

process printProcesses {
  echo true

  script:
  "echo Test run with parameters $params.inputFilePath as input and $params.outputDir as output"
}

process usingscript {
   input:
   file 'file' from seq_ch
   output:
   file 'output.txt' into results_ch
   """
   perl $params.countlinesPath --file file >> output.txt
   """
}

results = results_ch.collectFile( name: 'output.txt' )

process returnResults {
    input:
    file 'output.txt' from results
    """
    cat output.txt > $params.outputDir/results.txt
    """
}
