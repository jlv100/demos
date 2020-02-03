#!/bin/bash

set -e

sh build.sh

cd ..

NVIDIA=`which nvidia-smi > /dev/null && echo "--runtime=nvidia" || echo ""`

docker run \
$NVIDIA \
-it \
--rm \
--name demos_tests \
-v $PWD/notebooks:/notebooks \
-v $PWD/environments:/environments_publish \
--entrypoint=bash \
demos \
/run_tests.sh

echo "Tests complete."
