#!/bin/bash

set -e
set -x
NVIDIA=`which nvidia-smi > /dev/null && echo "--runtime=nvidia" || echo ""`

docker pull jlv100/demos

mkdir -p $MYSCR

docker run \
$NVIDIA \
--user $UID:`id -g` \
--rm \
--network host \
-v $PWD/notebooks:/notebooks \
-v $MYSCR:/tmp \
jlv100/demos

