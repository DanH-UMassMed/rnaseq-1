
process MULTIQC {
    
    input:
    val output_dir
    
    output:
    path 'multiqc_report.html'

    script:
    """
    nf_multiqc.sh "$output_dir"
    """
}
