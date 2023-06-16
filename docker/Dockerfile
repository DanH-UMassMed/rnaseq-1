FROM mambaorg/micromamba:0.25.1

LABEL image.author.name "Dan Higgins"
LABEL image.author.email "daniel.higgins@umassmed.edu"

COPY --chown=$MAMBA_USER:$MAMBA_USER env.yml /tmp/env.yml

RUN micromamba create -n simple-rnaseq 

RUN micromamba install -y -n simeplrnaseq -f /tmp/env.yml && \
    micromamba clean --all --yes

ENV PATH /opt/conda/envs/simple-rnaseq/bin:$PATH
