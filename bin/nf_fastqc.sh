#!/usr/bin/env bash
output_data="$1"
reads="$2"

mkdir -p ${output_data}
fastqc -o ${output_data} -f fastq -q ${reads}
