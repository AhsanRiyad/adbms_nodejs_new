var db = require('./db');

module.exports={	
	validate: function(user, callback){
		var sql = "select * from user where u_email='"+user.email+"' and u_password='"+user.password+"' ";

		db.getResult(sql , callback);
	},
	registration: function(user, callback){

		var dob = user.year+'-'+user.month+'-'+user.day;
		console.log(user.day);
		console.log(user.month);
		console.log(user.year);
		console.log(dob);

		var sql1 = "INSERT INTO `user`( `u_password`,  `u_email`, `u_mobile`, `dob`, `u_status`, `u_type`) VALUES ('"+user.password+"','"+user.email+"',"+user.phone+",'"+dob+"','"+user.user_type+"','valid', '"+dob+"')";
		




		var  sql = "INSERT INTO `user`(`u_password`, `u_email`, `u_mobile`, `dob`, `u_status`, `u_type`, `first_name`, `last_name`) VALUES ('"+user.password+"','"+user.email+"',"+user.phone+",'"+dob+"','valid','"+user.user_type+"','"+user.first_name+"','"+user.last_name+"')";






		console.log('sql block');
		console.log(sql);

		db.execute(sql, callback);


	},
	updateprofile: function(user , callback){
		var sql = "UPDATE `user` SET `u_password`= '"+user.password+"' ,`u_email`= '"+user.email+"' ,`u_mobile`= "+user.mobile+" WHERE u_id= "+user.u_id+"";
		db.execute(sql , callback);
	},
	addUser: function(user , callback){

		
		var sql = "INSERT INTO `user`( `u_password`,  `u_email`, `u_mobile`, `u_status`, `u_type`, `last_name`) VALUES ('"+user.user_password+"','"+user.user_email+"',"+user.user_mobile+",'"+user.user_type+"','"+user.user_status+"', '"+user.user_name+"')" ; 



		console.log(sql);

		db.execute(sql , callback);



	}, 
	viewUser: function(callback){
		var sql = "select * from user";
		console.log(sql);
		//callback([]);
		db.getResult(sql , callback);
	},
	deleteuser: function(userid , callback){
		var sql = "DELETE FROM `user` WHERE u_id="+userid+"";
		
		console.log(sql);

		db.execute(sql, callback);

	},
	updateuser: function(user , callback){

		
		/*var sql = "INSERT INTO `user`( `u_password`,  `u_email`, `u_mobile`, `u_status`, `u_type`, `last_name`) VALUES ('"+user.user_password+"','"+user.user_email+"',"+user.user_mobile+",'"+user.user_type+"','"+user.user_status+"', '"+user.user_name+"')" ; */


		var sql =  "UPDATE `user` SET `u_password`='"+user.user_password+"',`u_email`='"+user.user_email+"',`u_mobile`="+user.user_mobile+",`u_status`='"+user.user_status+"',`u_type`='"+user.user_type+"',`last_name`='"+user.user_name+"' WHERE `u_id`="+user.user_id+"" ; 



		console.log(sql);
		//callback(false);
		db.execute(sql , callback);



	}, 

}



