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

params.reads = "$projectDir/data/ggal/gut_{1,2}.fq"
params.multiqc = "$projectDir/multiqc"
params.outdir = "results"
log.info """\
    R N A S E Q - N F   P I P E L I N E
    ===================================
    reads        : ${params.reads}
    outdir       : ${params.outdir}
    """
    .stripIndent()

// import modules
include { FASTQC } from './modules/fastqc'
include { MULTIQC } from './modules/multiqc'


workflow {
    read_pairs_ch = Channel.fromFilePairs(params.reads, checkIfExists: true)
    fastqc_ch = FASTQC(read_pairs_ch)
    MULTIQC(fastqc_ch.collect())
}


/* 
 * completion handler
 */
workflow.onComplete {
	log.info ( workflow.success ? "\nDone! Open the following report in your browser --> $params.output_dir/multiqc/multiqc_report.html\n" : "Oops .. something went wrong" )
}