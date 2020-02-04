#!/bin/bash

set -e

anaconda login
ls -1 environments/*.yml notebooks/*.ipynb | while read F
do
    anaconda upload --force "$F"
done
