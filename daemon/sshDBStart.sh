#!/bin/bash

sudo su
docker ps | grep -q 'postgresdb'
if [ $? -ne 0 ]; then 
 docker start postgresdb
 exit 0
else
 exit 1
fi
