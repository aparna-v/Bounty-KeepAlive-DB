The createMasterShell.yml ansible script does the following:
1. Provisions an AWS instance 
2. Installs docker
3. Pulls the postgres repository from docker hub and starts it on the remote instance
4. Runs a config script to create the audit log database in the master DB.
