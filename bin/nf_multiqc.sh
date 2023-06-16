#!/usr/bin/env bash
out_dir=$1

log_files="${out_dir}/multiqc"
mkdir -p ${out_dir}
multiqc --outdir ${log_files}  ${out_dir}