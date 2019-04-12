var express = require('express');

var productModel = require.main.require('./model/productModel');
var orderModel = require.main.require('./model/orderModel');

var router = express.Router();


var obj = {
	title: 'order' ,
	msg: '',
	promoArray: ['far' , 'faerf'],
	userinfo: [{ last_name: 'Riyad' }],
	loginStatus: false,
	cart_count : 0
}


router.get('*', function(req, res, next){
		if(req.session.email != null){
			next();
		}else{
			res.redirect('/auth');
		}
});

router.get('/' , function(req, res){
	res.send('order page');
});



router.get('/confirm' , function(req, res){

	obj.loginStatus = true;

	obj.user_id = req.session.userinfo;
		console.log(obj.user_id[0].u_id);
		obj.user_id_P = obj.user_id[0].u_id;

	productModel.cart_count(obj.user_id_P , function(result){
			console.log('cart count result');
			console.log(result[0].cart_count);
			obj.cart_count = result[0].cart_count;
		});



	productModel.getCartProduct(obj.user_id_P , function(result){
			console.log(result[0]);
			console.log(result[0]);
			console.log(result[1][0].total);



			obj.products = result[0];
			obj.total = result[1][0].total;
			

		});





	res.render('Order/confirm_order' , obj);
});




router.post('/confirm' , function(req, res){

	obj.loginStatus = true;

	obj.user_id = req.session.userinfo;
		console.log(obj.user_id[0].u_id);
		obj.user_id_P = obj.user_id[0].u_id;

	productModel.cart_count(obj.user_id_P , function(result){
			console.log('cart count result');
			console.log(result[0].cart_count);
			obj.cart_count = result[0].cart_count;
		});



	productModel.getCartProduct(obj.user_id_P , function(result){
			console.log(result[0]);
			console.log(result[0]);
			console.log(result[1][0].total);



			obj.products = result[0];
			obj.total = result[1][0].total;
			

		});



	var d = new Date();
	var day = d.getDate();
	var month = d.getMonth();
	var year  = d.getFullYear();

	var date = year+'-'+month+'-'+day;

	var orderInfo = {
		uid: obj.user_id_P ,
		order_date: date ,
		payment_method : req.body.optradio 
	}

		orderModel.confirmOrder(orderInfo , function(result){
			
			res.render('Order/done' , obj);

		});


		//console.log(orderInfo);




	

	//res.render('Order/confirm_order' , obj);
});













module.exports = router;