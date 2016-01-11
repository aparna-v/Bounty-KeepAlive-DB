#!/bin/bash
db[0]=52.33.180.77
db[1]=52.35.11.167
db[2]=52.35.29.210
master=52.26.7.178
node=52.32.192.14
mail=aparna.vaikuntam@gmail.com

while true; do
for i in 0 1 2
do
ssh -i Keep-Alive.pem -o StrictHostKeyChecking=no ec2-user@${db[i]} 'bash -s' < 'sshDBStart.sh'
if [ $? == 0 ]; then
echo 'success'
dt=$(date -u '+%Y-%m-%d %H:%M:%S')
psql -h $master -p 5432 -d docker -U docker -c "insert into Audit_Log(type,command,log_message,time) values('DAEMON','start','${db[i]}','$dt')"
mail -s "Started DB Server "${db[i]} $mail < /dev/null
fi
done

ssh -i Keep-Alive.pem -o StrictHostKeyChecking=no ec2-user@$node 'bash -s' < 'sshNodeStart.sh'
if [ $? == 0 ]; then
echo 'success'
dt=$(date -u '+%Y-%m-%d %H:%M:%S')
psql -h $master -p 5432 -d docker -U docker -c "insert into Audit_Log(type,command,log_message,time) values('DAEMON','start','$node','$dt')"
mail -s "Started Node Server "$node $mail < /dev/null
fi
sleep 20
done

