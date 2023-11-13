# FROM geographica/gdal2:latest
# FROM thinkwhere/gdal-python:3.7-ubuntu
# FROM osgeo/gdal:ubuntu-small-latest
# FROM geographica/gdal2:latest

FROM continuumio/miniconda3:latest
# FROM continuumio/miniconda3:4.11.0

# FROM thinkwhere/gdal-python:3.7-ubuntu
# FROM osgeo/gdal:ubuntu-small-latest

LABEL creator Min Feng
ENV DEBIAN_FRONTEND noninteractive

# RUN rm /usr/bin/python

# RUN ln -s /usr/bin/python3 /usr/bin/python
# RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN apt-get update && apt-get install -y gcc
# RUN apt remove -y python3-numpy

# RUN apt-get update && apt-get install -y awscli cython3 python3-psycopg2 python3-boto3 python3-pandas python3-setuptools python3-pip
# RUN apt remove -y python3-numpy
# RUN pip3 install watchtower numpy pandas cython boto3 setuptools

RUN conda install -y python=3.11
RUN conda install -y gdal

# this is for fixing a weird issue with installing GDAL
RUN conda uninstall gdal
RUN conda install -y gdal

# RUN pip install awscli boto3
# RUN pip install numpy pandas psycopg2
# RUN pip install cython

WORKDIR /opt

ENV G_INI=/opt/ini
ENV G_LOG=/opt/log
ENV G_TMP=/opt/tmp

ENV PROJ_LIB=/opt/conda/share/proj
ENV GDAL_DATA=/opt/conda/share/gdal

ENTRYPOINT []

