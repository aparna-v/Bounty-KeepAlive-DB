#!/bin/bash

sudo su
docker ps | grep -q 'nodejs'
if [ $? -ne 0 ]; then 
 docker start nodejs
 exit 0
else
 exit 1
fi
