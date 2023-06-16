
process MULTIQC {
    
    input:
    val out_dir
    
    output:
    path 'multiqc_report.html'

    script:
    """
    nf_multiqc.sh "$out_dir"
    """
}
