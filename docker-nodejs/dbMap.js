var db = [];
db['db1'] = '52.33.180.77';
db['db2'] = '52.35.11.167';
db['db3'] = '52.35.29.210';
db['master'] = '52.26.7.178';

module.exports={
getDB: function(name){

return db[name];
}

};
