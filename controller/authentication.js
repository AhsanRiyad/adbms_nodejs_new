var express = require('express');
var router = express.Router();

var userModel = require.main.require('./model/userModel');

var obj = {
	title: 'login',
	validCheck: true,
	msg:'Welcome, Create your Umart Account',
	checkbox : '',
	regSuceess: 'other',
	nullVal : false,
	loginStatus: false, 
	cart_count: 0
		
}


function sessionCheck(req, res, next){

	// session
	if(req.session.email){
		obj.loginStatus = true;
		}else{
		obj.loginStatus = false;
		}
		console.log('middleware');
		next();

}

//middleware
router.use(sessionCheck);



var reg = ['/reg']

router.get('/logout' , function(req, res){
	req.session.email = null;
	obj.loginStatus = false;
	res.render('authentication/login' , obj);
});



router.get('/' , function(req, res){


	obj.msg = 'Welcome, Create your Umart Account';
	obj.loginStatus = false;
	res.render('authentication/login' , obj);
});


router.post('/' , function(req, res){
	var user = {
		email: req.body.email,
		password: req.body.password
	};

	
	userModel.validate(user , function(result){
		if(result.length<1){
			obj.loginStatus = false;
			console.log(result);
			obj.validCheck = false;
			res.render('authentication/login' , obj);
		}
		else{
			
			req.session.email = req.body.email;
			obj.loginStatus = true;
			console.log(result[0].u_id);
			obj.validCheck = true;
			req.session.userinfo = result;
			console.log('login session');
			console.log(req.session.userinfo);
			obj.userinfo = req.session.userinfo;
			console.log('redirecting to dashboard');
			res.redirect('/dashboard');
		}



	});
	


})

router.get( '/reg' , function(req, res){
	obj.nullVal = false;
	obj.checkbox = '';
	obj.loginStatus = false;
	obj.msg = 'Welcome, Create your Umart Account';
	obj.regSuceess = 'other';
	res.render('authentication/registration' , obj);
});

router.post( '/reg' , function(req, res){
	obj.loginStatus = false;
	obj.regSuceess = 'other';
	obj.msg = 'Welcome, Create your Umart Account';
	var val =  req.body.email;

	var emailPat = /[\D]+[a-zA-Z0-9]*@[a-zA-Z]{3,8}\.{1}[a-zA-Z]{2,3}/g;
	var result = emailPat.test(val);

	if(result == false)
	{
		obj.msg = 'invalid';
		console.log(req.body.email);
		console.log(req.body.toc);
		console.log('email box');
		res.render('authentication/registration' , obj);
	}
	else if(req.body.toc!='yes'){
		obj.checkbox = 'invalid';
		console.log('toc');
		res.render('authentication/registration' , obj);
	}
	else if(req.body.email!='' && req.body.password!='' && req.body.first_name!='' && req.body.last_name!='' && req.body.phone!=''){
		
		var user = 
		{
		email : req.body.email,
		password : req.body.password,
		month  : req.body.month,
		day  : req.body.day,
		year  : req.body.year,
		gender  : req.body.gender,
		first_name  : req.body.first_name,
		last_name  : req.body.last_name,
		phone : req.body.phone,
		user_type: req.body.user_type
		}
		
		userModel.registration(user, function(status){
			if(!status){
			obj.msg = 'email already registered';
			console.log('reg error');
			res.render('authentication/registration' , obj);
			}
			else{
				obj.msg = 'success';
				obj.regSuceess = true;
				res.render('authentication/registration' , obj);

			}
		});

		//obj.msg = 'invalid';
		//res.redirect('authentication/registration' , obj);


	}
	else{
		console.log(req.body);
		obj.msg = 'null value';
		console.log('null block');
		res.render('authentication/registration' , obj);
	}


	
});

router.get('/rr' , function(req, res){
	res.render('authentication/a1' , obj)
})


module.exports = router;