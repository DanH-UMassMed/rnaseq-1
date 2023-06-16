# Preperation of Docker Cantainer

NOTE: Docker processing must be done on a computer that the user has root access

## Steps for updating Docker Contianer

### Linux/OSX Shell
* `docker login`
* `docker build -t danhumassmed/rnaseq-tools:1.0.0 .`
* `docker push danhumassmed/rnaseq-tools:1.0.0`

#### Text build
* `docker run -it danhumassmed/rnaseq-tools:1.0.0 /bin/bash`

### Update `nextflow.config`
* process.container = 'anhumassmed/rnaseq-tools:1.0.0'
* singularity.enabled = true