
var oracledb = require('oracledb');

var config = {
	user          : 'scott',
    password      : 'tiger' ,
    connectString : 'localhost:1521/xe'
}

function doRelease(connection) {
  connection.close(
    function(err) {
      if (err) {
        console.error(err.message);
      }
    });
}


module.exports ={
getResult: function(sql , callback){

oracledb.getConnection(
  config,
  function(err, connection) {
    if (err) {
      console.error(err.message);
      return;
    }
    connection.execute(
    
      sql,
      {},
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        if (err) {
          console.error(err.message);
          doRelease(connection);
          callback([]);
        }
        
        console.log(result.rows);   
        doRelease(connection);
        callback(result.rows);
      });
  });

},

execute: function(sql , callback){

oracledb.getConnection(
  config,
  function(err, connection) {
    if (err) {
      console.error(err.message);
      return;
    }
    connection.execute(
    
      sql,
   
      function(err, status) {
        if (err) {
          console.error(err.message);
          doRelease(connection);
          callback(false);
        }
        
        console.log(status);    
        doRelease(connection);
        callback(status);
      });
  });
}

}







