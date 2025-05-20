FROM continuumio/miniconda3:latest

RUN conda create -n conda-env python=3.12
RUN conda activate conda-env
RUN conda install -y anaconda-client conda-build conda-verify numpy

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
