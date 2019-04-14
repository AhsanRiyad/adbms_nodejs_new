var express = require('express');

var productModel = require.main.require('./model/productModel');
var router = express.Router();


var obj = {
	title: 'add product' ,
	msg: '',
	promoArray: ['far' , 'faerf'],
	userinfo: [{ last_name: 'Riyad' }],
	loginStatus: false,
	cart_count : 0
}


// middleware
function sessionCheck(req , res , next){
	if(req.session.email){
		obj.loginStatus = true;
		}else{
		obj.loginStatus = false;
		}
		next();
}

router.use(sessionCheck);


router.get('/autosearch/:id/:cat' , function(req, res){


	obj.userinfo = req.session.userinfo;
	console.log('get block');
	console.log(req.params.id);
	console.log(req.params.cat);

	

	// session
	if(req.session.email){
		obj.userinfo = req.session.userinfo;
		obj.loginStatus = true;
		}else{
		obj.loginStatus = false;
		}


	var searchDetails = {
		searchText : req.params.id, 
		category: req.params.cat
	}

	productModel.searchProduct(searchDetails , function(result){
		if(result.length<1){
			console.log('no result');
			res.jsonp({ user: 'no match'  });
		}else{
			console.log('result found');
			console.log(result);

			var abc = {};
			for(var i = 0 ; i<result.length; i++)
			{
				console.log(i);
				console.log(result[i].product_name);
				abc['product'+i] = result[i].product_name;
			}


			console.log(abc);

			res.jsonp(abc);
		}

	});

	
	
});


router.post('/review' , function(req, res){
	
	var d = new Date();
	var day = d.getDate();
	var month = d.getMonth();
	var year = d.getFullYear();

	var date = year+'-'+month+'-'+day;

	var revInfo = {
		rev_text: req.body.rev_text, 
		rev_date: date ,
		productId: req.body.productid ,
		user_id: req.body.uid

	}

	productModel.addReview(revInfo , function(result){
		console.log(result);
		console.log(revInfo);
		var url_p = 'productdetails/'+req.body.productid;
		res.redirect(url_p);
	});

	

});


router.get('/search' , function(req , res){

	
		console.log('parameters');
	var searchQuery = req.query.searchbox;
	console.log(req.query.searchbox);
	console.log(req.query.catValue);

	var searchDetails = {
		searchText : req.query.searchbox ,
		category: req.query.catValue 

	}

	console.log(searchDetails);

	
	productModel.searchPage(searchDetails , function(result){

		if(result.length<1){
			console.log(result);
			obj.searchResult = result;
			console.log(obj);
			res.render('product/productSearch' , obj);
		}
		else{
			console.log(result);
			obj.searchResult = result;
			console.log(obj);
			res.render('product/productSearch' , obj);
		}

		
	});
	



	//res.render('product/productSearch' , obj);


});




router.get('/category/:catName/:subCat' , function(req , res){

	
	console.log('parameters');
	
	var catName = req.params.catName ;
	var subCat = req.params.subCat ; 
	
	productModel.searchCat(catName , subCat , function(result){

		if(result.length<1){
			console.log(result);
			obj.searchResult = result;
			obj.catName = catName ; 
			obj.subCat = subCat;
			console.log(obj);
			res.render('product/product_cat' , obj);
		}
		else{
			console.log(result);
			obj.searchResult = result;
			obj.subCat = subCat;
			
			obj.catName = catName ; 

			console.log(obj);
			res.render('product/product_cat' , obj);
		}

		
	});
	



	//res.render('product/productSearch' , obj);


});










router.get('/viewproducts' , function(req, res){

	console.log('view products')
	obj.userinfo = req.session.userinfo;
	productModel.getAllProduct(function(result){
		console.log(result);
		
		obj.allProducts = result;

		res.render('product/viewproducts' , obj);

		
	});


});


router.get('/up_rev/:product_id' , function(req, res){

	console.log('up rev products')

	//res.send('up rev');
	obj.userinfo = req.session.userinfo;
	var pid = req.params.product_id;
	
	console.log(pid);

	productModel.getReview(pid , function(result){

		console.log(result);

		obj.allReviews = result;
		res.render('product/up_rev' , obj);

	});

});



router.post('/up_rev/:product_id' , function(req, res){

	console.log('up rev products')

	//res.send('up rev');
	obj.userinfo = req.session.userinfo;
	var pid = req.params.product_id;
	var rev_id = req.body.rev_id;

	console.log('inside post req');
	console.log(pid);

	console.log('rev id');
	console.log(rev_id);

	productModel.deleteReview(rev_id , function(status){

		var url_p = ''+pid;
		res.redirect(url_p);


	});


});












router.get('/cart' , function(req, res){
	// session
	if(req.session.email){
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
			res.render('product/cart' , obj);

		});



		}else{
		obj.loginStatus = false;
		res.redirect('/auth');
		}







	
});


// product details starts

router.get('/productdetails/:pid' , function(req, res){

	
	var ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;

	// session
	
	var pid = req.params.pid;
	productModel.getProductDetails(pid , function(result){
		console.log(result.rows);
		obj.product = result.rows[0];
		// console.log(result[0].product_name);
		// console.log(obj);
		obj.user_id_P = '';

		console.log(obj.product.PRODUCT_NAME);	
		if(req.session.userinfo){
			obj.user_id = req.session.userinfo;
			console.log(obj.user_id[0].u_id);
			obj.user_id_P = obj.user_id[0].u_id;

		}
		
		obj.pid = pid ; 



		productModel.getReview(pid , function(result){
			console.log('get review controller');
			
			console.log(result.rows);
			console.log(result.length);
			//console.log(result[0].review_text);
			obj.reviews = result.rows;

			//res.render('product/productdetails' , obj);	
				console.log(obj);
			


		});

	})
	

	console.log(req.headers);
	console.log(ip);

	var visitTable = {
				ip: ip,
				productid : pid
			}

	productModel.recommendProduct(visitTable , function(result){


		if(result.rows.length<1){
			console.log('ip not found');
			console.log(result);
			var visitTable = {
				ip: ip,
				productid : pid
			}


			productModel.insertIp(visitTable , function(status){
				if(status){
					console.log('ip added');
				}
				else{
					console.log('ip not added');
				}
			});


		}

		console.log(result);



	});	

	/*console.log(pid);
	console.log(obj);
	console.log(obj.promoArray[0]);

	console.log('before');

	console.log(obj.product.product_name);*/
	// console.log(obj.product);
	

});

// product details ends



/*router.get('/autosearch' , function(req, res){
	obj.userinfo = req.session.userinfo;
	console.log(req.params.term);
	res.json();
});*/


router.get('/addpromo' , function(req, res){


	if(req.session.email == null){
		res.redirect('/auth');
	}

	obj.userinfo = req.session.userinfo;
	res.render('product/addpromo' , obj);
});

router.post('/addpromo' , function(req, res){
	obj.userinfo = req.session.userinfo;
	obj.msg = 'none';
	if(req.session.email == null){
		res.redirect('/auth');
	}

	if(req.body.promo_desc == '' || req.body.promo_percentage == '' || req.body.promo_status == '' || req.body.promo_limit == '' || req.body.promot_use_count == '')
	{
		obj.msg = 'null';
		res.render('product/addpromo' , obj);
	}
	else{
		

		var promo = {
			promo_desc: req.body.promo_desc,
			promo_percentage : req.body.promo_percentage,
			promo_status: req.body.promo_status,
			promo_limit: req.body.promo_limit,
			promo_use_count: req.body.promo_use_count,
			user_id: req.session.userinfo[0].u_id,
			promo_expiry: req.body.Promo_expiry
		}

		productModel.addPromo(promo , function(status){
			if(status){
				obj.msg = 'added';
				console.log('add promo block ');
				console.log(promo);

				res.render('product/addpromo' , obj);
			}
			else{
				obj.msg = 'db';
				res.render('product/addpromo' , obj);
			}
		} );

	}


	
});



router.get('/viewpromo' , function(req, res){

	if(req.session.email == null){
		res.redirect('/auth');
	}

	obj.userinfo = req.session.userinfo;
	productModel.getPromo(function(result){
		console.log('view promo section');
		console.log(result.length);
		obj.promoArray = result;
		console.log(obj.promoArray);
		res.render('product/viewpromo' , obj);
	});




	
});


router.post('/deletepromo' , function(req, res){
	console.log('delete promo');
	
	var promoid = req.body.promoIdDelete;
	obj.userinfo = req.session.userinfo;
	productModel.deletePromo(promoid , function(status){
		
		productModel.getPromo(function(result){
			console.log('view promo section');
			console.log(result.length);
			obj.promoArray = result;
			console.log(obj.promoArray);
			res.render('product/viewpromo' , obj);
		});

	})


});

router.get('/updatepromo/:promoid' , function(req, res){
	
	if(req.session.email == null){

		res.redirect('/auth');
	}else{

	obj.userinfo = req.session.userinfo;
	var promoid = req.params.promoid;
	console.log(promoid);
	obj.promoid = promoid;

	res.render('product/updatepromo' , obj);
}

});


router.post('/updatepromo/:promoid' , function(req, res){
	obj.userinfo = req.session.userinfo;
	obj.msg='';
	var promoid = req.params.promoid;
	console.log(promoid);
	obj.promoid = promoid;
	if(req.body.promo_desc == '' || req.body.promo_percentage == '' || req.body.promo_status == '' || req.body.promo_limit == '' || req.body.promot_use_count == '')
	{
		obj.msg = 'null';
		res.render('product/updatepromo' , obj);
	}
	else{
		

		var promo = {
			promo_desc: req.body.promo_desc,
			promo_percentage : req.body.promo_percentage,
			promo_status: req.body.promo_status,
			promo_limit: req.body.promo_limit,
			promo_use_count: req.body.promo_use_count,
			promo_id: promoid
		}

		productModel.updatePromo(promo , function(status){
			if(status){
				obj.msg = 'added';
				res.render('product/updatepromo' , obj);
			}
			else{
				obj.msg = 'db';
				res.render('product/updatepromo' , obj);
			}
		} );

	}


	
});



router.post('/addtocart' , function(req , res){
	console.log('add to cart');

	

	var myinfoJson =  req.body.myinfo;
	var myinfo = JSON.parse(myinfoJson);
	console.log(myinfo);

	productModel.addToCart(myinfo , function(result){
		if(result[1][0].status == 'added'){
			console.log(result);
			console.log('c_id');
			console.log(result[2][0].cart_count);
			console.log('added');

			/*var resJson = { status : result[1][0].status ,
			cart_count : result[2][0].cart_count }
			var myJSON = JSON.stringify(resJson);
			console.log(myJSON);
			res.json(myJSON);
*/
			
			var resJson = { 'status' : result[1][0].status ,
			'cart_count' : result[2][0].cart_count }
			//var myJSON = JSON.stringify(resJson);
			console.log(resJson);
			res.json(resJson);

		}else{
			/*console.log(result);
			var resJson = { status : result[1][0].status ,
			cart_count : result[2][0].cart_count }
			var myJSON = JSON.stringify(resJson);
			console.log(myJSON);
			res.json(myJSON);*/

			var resJson = { 'status' : result[1][0].status ,
			'cart_count' : result[2][0].cart_count }
			//var myJSON = JSON.stringify(resJson);
			console.log(resJson);
			res.json(resJson);



		}
	});

	


});


module.exports = router;