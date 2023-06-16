
process FASTQC {
    container 'danhumassmed/rnaseq-tools:1.0.0'
    input:
    val  output_dir
    path reads

    output:
    val output_dir
    
    script:
    """
    fastqc.sh "$output_dir" "$reads"
    """
}