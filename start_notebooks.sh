#!/bin/bash

set -e

PORT=${1:-8888}
OTHER=${2:-""}
echo "Running notebooks listening on port $PORT..."

NVIDIA=`which nvidia-smi > /dev/null && echo "--runtime=nvidia" || echo ""`

docker run \
$NVIDIA \
--detach \
--rm \
--name demo_notebooks \
-p $PORT:8888 \
--network host \
-v $PWD/notebooks:/notebooks \
$OTHER demos/jupyter

echo "Run the following to get the jupyter token:"
echo "docker logs demo_notebooks"
