FROM ubuntu:23.04

LABEL author.name "Dan Higgins"
LABEL author.email "daniel.higgins@umassmed.edu"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git libtbb-dev g++

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py38_23.1.0-1-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc 
    

#RUN conda activate base
RUN conda update -n base -c defaults conda
RUN conda install -c conda-forge mamba

COPY conda.yml /
RUN mamba env create -f /conda.yml && conda clean -a
RUN echo "conda activate simple-rnaseq" >> ~/.bashrc 


