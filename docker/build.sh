#!/bin/bash

docker build --network host -t demos/miniconda2 miniconda2
docker build --network host -t demos/jupyter jupyter
