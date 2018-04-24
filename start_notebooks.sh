#!/bin/bash

PORT=${1:-8888}
OTHER=${2:-""}
echo "Running notebooks listening on port $PORT..."

docker run \
--runtime=nvidia \
--detach \
--rm \
--name demo_notebooks \
-p $PORT:8888 \
-v $PWD/notebooks:/notebooks \
$OTHER demos/caffe2

sleep 5

docker logs --tail 100 demo_notebooks | grep -A 1 -B 1 'to login with a token'
