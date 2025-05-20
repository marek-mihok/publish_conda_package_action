FROM continuumio/miniconda3:latest

RUN conda create -n conda-env python=3.12 \
  && conda install -n conda-env -y anaconda-client conda-build conda-verify numpy

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/bin/bash", "-c", "conda run -n conda-env /entrypoint.sh"]
