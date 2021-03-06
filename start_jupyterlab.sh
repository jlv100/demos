#!/bin/bash

set -e

NVIDIA=`which nvidia-smi > /dev/null && echo "--runtime=nvidia" || echo ""`

docker run \
$NVIDIA \
--user $UID:`id -g` \
--detach \
--rm \
--name demos \
--network host \
-v $PWD/notebooks:/notebooks \
demos

docker container logs -f demos

