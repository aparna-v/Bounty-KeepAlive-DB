#!/bin/bash

docker login -u aparna -p aparna -e aparna2903@gmail.com
docker pull aparna/artoo:postgresV2
docker run -d -p 5432:5432 --name postgresdb aparna/artoo:postgresV2

