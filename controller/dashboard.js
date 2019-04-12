var express = require('express');


var router = express.Router();
var userModel = require.main.require('./model/userModel');




router.get('*', function(req, res, next){
		if(req.session.email != null){
			next();
		}else{
			res.redirect('/auth');
		}
});

var obj = {
	title: 'dashboard' ,
	userinfo:  [] , 
	loginStatus : false, 
	
}


router.get('/' , function(req, res){
	obj.userinfo = req.session.userinfo;
	res.render('dashboard/dashboard' , obj);
	console.log('in the dashboard');
	// res.send('dashboard');

})


router.get('/profile' , function(req, res){
	obj.userinfo = req.session.userinfo;
	res.render('dashboard/profile' , obj);
});


router.get('/updateprofile' , function(req, res){
	obj.userinfo = req.session.userinfo;
	res.render('dashboard/updateprofile' , obj);

});

router.post('/updateprofile' , function(req, res){
	console.log('post update profile');
	obj.userinfo = req.session.userinfo;
	var myinfoJson =  req.body.myinfo;
	var myinfo = JSON.parse(myinfoJson);
	console.log(myinfo);
	var updateInfo = {
		'name': 'riyad',
		'msg' : 'profileUpdated',
		'user_id': obj.userinfo[0].u_id
	}
	myinfo.u_id = obj.userinfo[0].u_id;
	console.log(myinfoJson);
	//jsontest.user_id = obj.userinfo[0].u_id;
	
	userModel.updateprofile(myinfo , function(status){
		if(status==true){
			myinfo.status = true;
			res.json(myinfo);
			//res.json(JSON.parse(myinfoJson));
			console.log('updated');
		}
		else{
			console.log('failed');
		}
	});

	

	//res.render('dashboard/updateprofile' , obj);
	
});

module.exports = router;