#!/bin/bash

echo $4
psql -h $1 -p 5432 -d docker -U docker -c "insert into Audit_Log(type,command,log_message,time) values('$2','$3','$4','$5')"
