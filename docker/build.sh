#!/bin/bash

docker build -t demos/miniconda2 miniconda2
docker build -t demos/jupyter jupyter
docker build -t demos/caffe caffe
docker build -t demos/caffe2 caffe2
