#!/bin/bash

set -e

PORT=${1:-8888}
OTHER=${2:-""}
echo "Running jupyterlab listening on port $PORT..."

NVIDIA=`which nvidia-smi > /dev/null && echo "--runtime=nvidia" || echo ""`

docker run \
$NVIDIA \
--detach \
--rm \
--name demos \
-p $PORT:8888 \
--network host \
-v $PWD/notebooks:/notebooks \
$OTHER demos

docker container logs -f demos

