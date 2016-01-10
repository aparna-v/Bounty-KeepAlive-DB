The createNodeServer.yml ansible script does the following:
1. Provisions an AWS instance 
2. Installs docker
3. Pulls the nodejs repository from docker hub and starts it on the remote instance with /src as a docker volume
4. IP of DB servers mapped to db1, db2 etc can be entered from host machine


