#!/usr/bin/env bash
out_dir=$1

log_files="${out_dir}/../output_data/multiqc"
mkdir -p ${out_dir}
echo multiqc --outdir ${out_dir}  ${log_files}/*
echo ttttt>> 'multiqc_report.html'