# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
# ARG BASE_CONTAINER=ucsdets/datascience-notebook:2021.3-42158c8

# scipy/machine learning (tensorflow, pytorch)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
# ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2021.3-42158c8

FROM $BASE_CONTAINER

LABEL maintainer="Mingjia Zhu <mzhu@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install htop

RUN apt-get -y install aria2
    apt-get -y install nmap
    apt-get -y install traceroute

RUN conda install --yes geopandas babypandas

# 3) install packages
# USER jovyan
   
# RUN pip install --no-cache-dir networkx scipy

# # 4) change back to notebook user
# COPY /run_jupyter.sh /
# RUN chmod 755 /run_jupyter.sh

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
