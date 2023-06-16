#!/usr/bin/env nextflow 

/*
 * RNAseq pipeline
 *
 * Authors:
 * -  Dan Higgins <daniel.higgins@umassmed.edu>
 */

/* 
 * enables modules 
 */
nextflow.enable.dsl = 2

/*
 * Default pipeline parameters. They can be overriden on the command line eg.
 * given `params.reads` specify on the run command line `--reads some_value`.
 */

params.reads = "$baseDir/../input_data/*.fq"
params.outdir = "$baseDir/../output_data"
params.multiqc = "$baseDir/../output_data/1multiqc1"

log.info """\
 R N A S E Q - N F   P I P E L I N E
 ===================================
 reads        : ${params.reads}
 outdir       : ${params.outdir}
 """

// import modules
include { FASTQC } from './modules/fastqc'
include { MULTIQC } from './modules/multiqc'


workflow {
  reads_param_ch = channel.fromPath( params.reads, checkIfExists: true ) 
  outdir_param_ch = Channel.value( params.outdir )
  //FASTQC(params.outdir, reads_param_ch)
  outdir_param_ch.view()
  MULTIQC(outdir_param_ch)
}

/* 
 * completion handler
 */
workflow.onComplete {
	log.info ( workflow.success ? "\nDone! Open the following report in your browser --> $params.multiqc/multiqc_report.html\n" : "Oops .. something went wrong" )
}