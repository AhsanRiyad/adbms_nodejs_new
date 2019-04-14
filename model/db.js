
var oracledb = require('oracledb');

var config = {
	user          : 'riyad',
    password      : '448787' ,
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
getResult: function(sql , params,  callback){

oracledb.getConnection(
  config,
  function(err, connection) {
    if (err) {
      console.error(err.message);
      return;
    }
    connection.execute(
    
      sql,
      params,
      { outFormat: oracledb.OBJECT }, 
      
      function(err, result) {
        if (err) {
          console.error(err.message);
          doRelease(connection);
          callback([]);
        }
        
        //console.log(result.rows);   
        
        // callback(result.rows);
        callback(result);
        doRelease(connection);
      });
  });

},



execute: function(sql , params , callback){
oracledb.getConnection(
  config,
  function(err, connection) {
    if (err) {
      console.error(err.message);
      return;
    }
    connection.execute(
    
      sql,
      params,
   
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

