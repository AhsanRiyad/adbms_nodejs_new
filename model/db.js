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
	var connection = oracledb.getConnection(config ,  
		function(err , connection){
			if(err){
	      		console.error(err.message);
				return;
			}
			return connection;

		}		
		);
	
}

//var pool  = mysql.createPool(config);




module.exports = {
	getResult: function(sql , callback){
		var connection = getConnection();
		
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
	},

	execute: function(sql , callback){
		var connection = getConnection();
		
		connection.execute(sql , function(err, status){
			if(err){
          		console.error(err.message);
				callback(false);
			}else{
				console.log(status); 
				callback(status);
			}
		});
		connection.close(function(err){
			
			if (err) {
        		console.error(err.message);
     				 }
			});
	}



}








