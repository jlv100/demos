#!/bin/bash

set -e

cd docker
#sh test.sh
cd ..

anaconda login
ls -1 environments/*.yml notebooks/completed/*.ipynb | while read F
do
    anaconda upload --force "$F"
done
