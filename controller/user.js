var express = require('express');


var router = express.Router();
var userModel = require.main.require('./model/userModel');

var obj = {
	title: 'add product' ,
	msg: '',
	promoArray: ['far' , 'faerf'],
	userinfo: [{ last_name: 'Riyad' }],
	loginStatus: false,
	cart_count: 0
}



router.get('/addUser' , function(req, res){


	if(req.session.email == null){
		res.redirect('/auth');
	}else{
		obj.userinfo = req.session.userinfo;
		res.render('user/addUser' , obj);
	}

	
});

router.post('/addUser' , function(req, res){
	obj.userinfo = req.session.userinfo;
	obj.msg = 'none';
	if(req.session.email == null){
		res.redirect('/auth');
	}
	else if(req.body.user_name == '' || req.body.user_password == '' || req.body.user_email == '' || req.body.user_mobile == '' || req.body.user_type == '' || req.body.user_status == '')
	{
		obj.msg = 'null';
		res.render('user/addUser' , obj);
	}
	else{
		

		var userFormInfo = {
			user_name: req.body.user_name,
			user_password : req.body.user_password,
			user_email: req.body.user_email,
			user_mobile: req.body.user_mobile,
			user_type: req.body.user_type,
			user_status: req.body.user_status
		}

		userModel.addUser(userFormInfo , function(status){
			if(status){
				obj.msg = 'added';
				console.log('add user block ');
				console.log(userFormInfo);

				res.render('user/addUser' , obj);
			}
			else{
				obj.msg = 'db';
				res.render('user/addUser' , obj);
			}
		} );

	}


	
});



router.get('/viewuser' , function(req, res){

	if(req.session.email == null){
		res.redirect('/auth');
	}

	obj.userinfo = req.session.userinfo;
	userModel.viewUser(function(result){
		console.log('view user section');
		console.log(result.length);
		obj.userArray = result;
		console.log(obj.userArray);
		res.render('user/viewuser' , obj);
	});
	
});


router.post('/deleteuser' , function(req, res){
	console.log('delete promo');
	
	var userid = req.body.userIdDelete;
	obj.userinfo = req.session.userinfo;
	userModel.deleteuser(userid , function(status){
		
		userModel.viewUser(function(result){
			console.log('view user section');
			console.log(result.length);
			obj.userArray = result;
			console.log(obj.userArray);
			res.render('user/viewuser' , obj);
		});

	})


});

router.get('/updateuser/:userid' , function(req, res){
	
	if(req.session.email == null){

		res.redirect('/auth');
	}else{
		obj.userinfo = req.session.userinfo;
		var userid = req.params.userid;
		console.log(userid);
		obj.userid = userid;

		res.render('user/updateuser' , obj);
	}

	

});


router.post('/updateuser/:userid' , function(req, res){
	obj.userinfo = req.session.userinfo;
	obj.msg = 'none';
	if(req.session.email == null){
		res.redirect('/auth');
	}else 
	{
	var u_id = req.params.userid;
	if(req.body.user_name == '' || req.body.user_password == '' || req.body.user_email == '' || req.body.user_mobile == '' || req.body.user_type == '' || req.body.user_status == '')
	{
		obj.msg = 'null';
		res.render('user/updateuser' , obj);
	}
	else{
		

		var userFormInfo = {
			user_name: req.body.user_name,
			user_password : req.body.user_password,
			user_email: req.body.user_email,
			user_mobile: req.body.user_mobile,
			user_type: req.body.user_type,
			user_status: req.body.user_status,
			user_id: u_id
		}

		userModel.updateuser(userFormInfo , function(status){
			if(status){
				obj.msg = 'added';
				console.log('add user block ');
				console.log(userFormInfo);

				res.render('user/updateuser' , obj);
			}
			else{
				obj.msg = 'db';
				res.render('user/updateuser' , obj);
			}
		} );

	}

}
	
});






module.exports = router;