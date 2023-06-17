
process MULTIQC {
    container 'biocontainers/multiqc:1.10.1--py_0'
    publishDir params.outdir, mode:'copy'

    input:
    path '*'

    output:
    path 'multiqc_report.html'

    script:
    """
    multiqc .
    """
}
