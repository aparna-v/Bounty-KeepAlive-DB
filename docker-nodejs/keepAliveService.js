express = require('express');
var app = express();
var exec = require('child_process').exec;
var dbMap = require('./dbMap.js');
var dbCmd = "./sshDBChange.sh";
var killNode = 'killall node'; 
var type = 'NODE_REQ';
var dbInsertCmd = "./sshPostgresLogScript.sh";
var masterDB =  dbMap.getDB('master');

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.post('/:db/stop', function (req, res,next) {
  var db =dbMap.getDB(req.params.db);
  console.log(db);
  var stopDBCmd = dbCmd+' ' + db + ' stop';
  var messageIns =  db;
  var command = 'stop';
  var time = new Date().toISOString();
  var dbInsert = dbInsertCmd + ' ' + masterDB + ' ' + type + ' ' + command + ' ' +  messageIns + ' ' + time;
  console.log(dbInsert);
  exec(dbInsert, function(error, stdout, stderr) {
           if(error!=null)
           console.log(error);
           console.log(stdout);
           console.log(stderr);
   });

  exec(stopDBCmd, function(error, stdout, stderr) {

	 if(error!=null)
           console.log(error);
           console.log(stdout);
           console.log(stderr);

   });
  
  res.end("Stopped DB Server " + db);
})

app.post('/:db/start', function (req, res,next) {

  var db = dbMap.getDB(req.params.db);
  console.log(db);
  var startDBCmd = dbCmd+' ' + db + ' start';
  var messageIns =  db;
  var command = 'start';
  var time = new Date().toISOString();
  var dbInsert = dbInsertCmd + ' ' + masterDB + ' ' + type + ' ' + command + ' ' +  messageIns + ' ' + time;
  console.log(dbInsert);
  
  exec(startDBCmd, function(error, stdout, stderr) {

	 if(error!=null)
           console.log(error);
           console.log(stdout);
           console.log(stderr);
		
   });
   exec(dbInsert, function(error, stdout, stderr) {

	 if(error!=null)
           console.log(error);
           console.log(stdout);
           console.log(stderr);
   });


  res.end("Started DB Server " + db);


})

app.post('/killNode', function (req, res,next) {
   console.log("Killing Node");
   exec(killNode, function(error, stdout, stderr) {
 
  });
 res.end("Killed node server");
})

var server = app.listen(8080, function () {

  var host = server.address().address;
  var port = server.address().port;
  console.log("Keep alive server listening at  http://%s:%s", host, port);
})
