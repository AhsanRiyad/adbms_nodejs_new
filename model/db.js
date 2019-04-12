//var mysql = require('mysql');
var oracledb = require('oracledb');


/*var config = {
	host: '127.0.0.1',
	user: 'root',
	password: '',
	database: 'node_project',
	multipleStatements: true
};*/

var config = {
	user          : 'scott',
    password      : 'tiger' ,
    connectString : 'localhost:1521/xe'
}



/*function getConnection(){
	var connection = mysql.createConnection(config);
	connection.connect(function(err){
		if(err){
			console.log(err.stack);
		}
		console.log('connection id is: '+ connection.threadId);
	});
	return connection;
}*/

function getConnection(){
	oracledb.getConnection( 

		config
	 ,  
		function(err , connection){
			if(err){
	      		console.error(err.message);
				return;
			}
			

			connection.execute(sql , function(err, result){
			if(err){
          		console.error(err.message);
				callback([]);
			}else{
				console.log(result.rows); 
				callback(result.rows);
			}
		});

			connection.close(function(err){
			
			if (err) {
        		console.error(err.message);
     				 }
			});


		}		
		);
	
}

//var pool  = mysql.createPool(config);



module.exports ={
execute: function(obj , callback){



oracledb.getConnection(
  {
    user          : 'scott',
    password      : 'tiger',
    connectString : 'localhost:1521/xe'
  },
  function(err, connection) {
    if (err) {
      console.error(err.message);
      return;
    }

 
    var sql = "select * from emp"; 
    connection.execute(
      // The statement to execute
      sql,

      // The "bind value" 180 for the bind variable ":id"
      // [180],

      // execute() options argument.  Since the query only returns one
      // row, we can optimize memory usage by reducing the default
      // maxRows value.  For the complete list of other options see
      // the documentation.
      // { maxRows: 1
        //, outFormat: oracledb.OBJECT  // query result format
        //, extendedMetaData: true      // get extra metadata
        //, fetchArraySize: 100         // internal buffer allocation size for tuning
      // },

      // The callback function handles the SQL execution results
      function(err, result) {
        if (err) {
          console.error(err.message);
          doRelease(connection);
          callback([]);
        }
        //console.log(result.metaData); // [ { name: 'DEPARTMENT_ID' }, { name: 'DEPARTMENT_NAME' } ]
        console.log(result.rows);     // [ [ 180, 'Construction' ] ]
        doRelease(connection);
        callback(result.rows);
      });
  });

// Note: connections should always be released when not needed
function doRelease(connection) {
  connection.close(
    function(err) {
      if (err) {
        console.error(err.message);
      }
    });
}










}

 }







