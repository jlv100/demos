#!/bin/bash

set -e
set -x
NVIDIA=`which nvidia-smi > /dev/null && echo "--runtime=nvidia" || echo ""`

docker run \
$NVIDIA \
--user $UID:`id -g` \
--rm \
--network host \
-v $PWD/notebooks:/notebooks \
jlv100/demos
