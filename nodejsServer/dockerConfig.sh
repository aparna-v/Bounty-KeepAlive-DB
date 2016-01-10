#!/bin/bash

docker login -u aparna -p aparna -e aparna2903@gmail.com
docker pull aparna/artoo:nodejs
docker run -d -p 8080:8080 -v /src --name nodejs aparna/artoo:nodejs

