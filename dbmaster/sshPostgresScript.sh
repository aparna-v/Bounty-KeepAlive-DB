#!/bin/bash

psql -h $1 -p 5432 -d docker -U docker -c "create table Audit_Log(id bigserial primary key,type varchar(10),command varchar(10),log_message varchar(100),time timestamp)"
