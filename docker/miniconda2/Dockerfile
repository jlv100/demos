FROM nvidia/caffe

WORKDIR /root

RUN apt-get update && apt-get install -y \
	gcc \
	wget

RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN sh Miniconda2-latest-Linux-x86_64.sh -b
ENV PATH /root/miniconda2/bin:$PATH
RUN conda update -y conda
ENV python_version 2.7

