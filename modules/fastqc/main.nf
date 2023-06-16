
process FASTQC {
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