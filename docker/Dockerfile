FROM ubuntu:16.04
LABEL author="daniel.higgins@umassmed.edu"  
LABEL description="Docker image containing requiremnt for simple rnaseq pipeline"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget curl bzip2 unzip ca-certificates git build-essential libtbb-dev g++ gcc

RUN wget --quiet https://github.com/conda-forge/miniforge/releases/download/23.1.0-0/Mambaforge-23.1.0-0-Linux-x86_64.sh -O ~/miniforge.sh && \
     /bin/bash ~/miniforge.sh -b -p /opt/conda && \
    rm ~/miniforge.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc &&\
    echo "conda activate base" >> ~/.bashrc


COPY conda.yml /
RUN mamba env create -f /conda.yml && conda clean -all
