#!/bin/bash

set -e

docker run \
-it \
--rm \
-v $PWD/environments:/environments_publish \
--entrypoint=cp \
demos \
-r /environments/fields.yml /environments/breast_cancer.yml /environments/mouse_learning.yml /environments_publish/

anaconda login
ls -1 environments/*.yml notebooks/*.ipynb | while read F
do
    anaconda upload --force "$F"
done

echo "Enter Dockerhub username:"
read DOCKERHUBUSERNAME
docker login --username=$DOCKERHUBUSERNAME
docker tag demos $DOCKERHUBUSERNAME/demos:latest
docker push $DOCKERHUBUSERNAME/demos
