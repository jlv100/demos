FROM demos/caffe

COPY nccl-repo-ubuntu1604-2.1.15-ga-cuda8.0_1-1_amd64.deb ./
RUN dpkg -i nccl-repo-ubuntu1604-2.1.15-ga-cuda8.0_1-1_amd64.deb
RUN apt-get update
RUN apt-get install libnccl2=2.1.15-1+cuda8.0 libnccl-dev=2.1.15-1+cuda8.0

RUN conda install -y -c caffe2 caffe2-cuda8.0-cudnn7

RUN conda install -y pydot
