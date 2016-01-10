#!/bin/bash

if [ $2 == 'start' ]
then
 ssh -i Keep-Alive.pem -o StrictHostKeyChecking=no ec2-user@$1 'bash -s' < sshStartScript.sh
else
 ssh -i Keep-Alive.pem -o StrictHostKeyChecking=no ec2-user@$1 'bash -s' < sshStopScript.sh
fi
