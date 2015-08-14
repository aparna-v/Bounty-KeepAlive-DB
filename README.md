Bounty-KeepAlive-DB
===================


### Server Setup
-  Host a Node.js server
-  Host 3 instances of PostgreSQL - DB1, DB2, DB3
-  Host a 4th Master DB that acts as an audit log DB for status uptimes of the above 3 DBs and all the requests received by the Node Server


### Instructions
All this config is to be done by Chef and in a Docker Image / VM
Use AWS Free Instances - T2 Small

Task 
-  Send a POST Request using cURL and your Node.js server should bring up the corresponsing server. Default Behaviour looks like:
	-  POST xyz/db1 - brings up DB1
	-  POST xyz/db2 - should bring up DB2 and so on..
	-  Show a message accordingly which shows the status of each server as a response of the POST request

-  Create scripts that do the following 
	-  creates 1000s of random POST Requests
	-  brings down any DB at random. 
	-  brings down the node server at random time intervals.
	-  deamon that monitors any kind of downtime and sends notifications

### Add-Ons
-  Create a simple UI where you can click to trigger the POST requests instead of using cURL
-  Think how load-balancing and clustering can be useful in terms of scaling



### Final Words
When you are done, please just create a pull request on this repo. We would like you to come in and present your code to the whole team. 

May the force be with you!
