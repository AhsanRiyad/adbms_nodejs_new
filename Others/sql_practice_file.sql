
<% if(msg=='invalid'){ %> 
<small id="idExampleInputEmail1Small" style="color: red;"> Invalid Email</small> 
<% } %>

<% else { %> 
<small id="idExampleInputEmail1Small" style="color: red;"> Email*</small> 
<% } %>

<% 
if(msg=='invalid')
{
%> 
		<small id="idExampleInputEmail1Small" style="color: red;"> Invalid Email</small>
<% 
}
else
{
%> 
	<small id="idExampleInputEmail1Small" style="color: red;">Email*</small>
<% 
}
%> 




email
password
month day year gender first_name last_name phone toc[]



DROP PROCEDURE IF EXISTS registration; CREATE PROCEDURE registration(IN email VARCHAR(25) , IN password VARCHAR(25) , IN first_name VARCHAR(25) , IN last_name VARCHAR(25) , IN phone INT )  INSERT INTO `user`( `u_password`,  `u_email`, `u_mobile`) VALUES (password,email, phone,  ); END;



DROP PROCEDURE IF EXISTS REG; CREATE PROCEDURE REG(IN EMAIL VARCHAR(25) , IN PASSWORD VARCHAR(25) , IN FIRST_NAME VARCHAR(25) , IN LAST_NAME VARCHAR(25) , IN PHONE VARCHAR(25) , IN TYPE VARCHAR(25), IN STATUS VARCHAR(25) ) BEGIN DECLARE X INT;  SELECT * FROM USER;  
	INSERT  INTO USER (`U_EMAIL`, `U_PASSWORD` , `U_MOBILE` , `U_STATUS` , `U_TYPE`)VALUES(EMAIL , PASSWORD , PHONE ,  STATUS , TYPE);
	SELECT MAX(U_ID) INTO X FROM USER;
	INSERT INTO `g_user_name`(`g_u_id`, `u_type`, `first_name`, `last_name`) VALUES (X , TYPE, FIRST_NAME,LAST_NAME);
	   END;


DECLARE X INT; 
SELECT MAX(U_ID) INTO X FROM USER;
INSERT INTO `g_user_name`(`g_u_id`, `u_type`, `first_name`, `last_name`) VALUES (X , TYPE, FIRST_NAME,LAST_NAME);






DROP PROCEDURE IF EXISTS REG;
CREATE OR REPLACE PROCEDURE REG(IN EMAIL VARCHAR(25) , IN PASSWORD VARCHAR(25) , IN FIRST_NAME VARCHAR(25), IN LAST_NAME VARCHAR(25) , IN PHONE INT, IN TYPE VARCHAR(25), IN STATUS VARCHAR(25) )
 BEGIN 
 DECLARE X INT;
 SELECT * FROM USER; 
 INSERT  INTO 'USER' ('U_EMAIL', 'U_PASSWORD' , 'U_MOBILE' , 'U_STATUS' , 'U_TYPE')VALUES(EMAIL , PASSWORD , PHONE ,  STATUS , TYPE); 
 SELECT MAX(U_ID) INTO X FROM USER; 
 INSERT INTO 'g_user_name'('g_u_id', 'u_type', 'first_name', 'last_name') VALUES (X , TYPE, FIRST_NAME,LAST_NAME); 
 END;


 DROP PROCEDURE IF EXISTS REG;

DELIMITER $$
CREATE OR REPLACE PROCEDURE REG(IN EMAIL VARCHAR(25) , IN PASSWORD VARCHAR(25) , IN FIRST_NAME VARCHAR(25), IN LAST_NAME VARCHAR(25) , IN PHONE INT, IN TYPE VARCHAR(25), IN STATUS VARCHAR(25) )
 BEGIN 
 DECLARE X INT;
 SELECT * FROM USER; 
 
 INSERT INTO USER VALUES(100 ,  'AFA' , 'FARF' , 'FRAEF');
 
 END$$


DELIMITER $$
CREATE OR REPLACE PROCEDURE REG(IN EMAIL VARCHAR(25) , IN PASSWORD VARCHAR(25) , IN FIRST_NAME VARCHAR(25), IN LAST_NAME VARCHAR(25) , IN PHONE INT, IN TYPE VARCHAR(25), IN STATUS VARCHAR(25) )
 BEGIN 
 DECLARE X INT;
SELECT * FROM USER; 
SELECT MAX(U_ID) INTO X FROM USER; 
 
 END$$



#SUCCESS
DELIMITER $$
CREATE OR REPLACE PROCEDURE REG(IN EMAIL VARCHAR(25) , IN PASSWORD VARCHAR(25) , IN FIRST_NAME VARCHAR(25), IN LAST_NAME VARCHAR(25) , IN PHONE INT, IN TYPE VARCHAR(25), IN STATUS VARCHAR(25) )
 BEGIN 
 DECLARE X INT;
SELECT * FROM USER; 
SELECT MAX(U_ID) INTO X FROM USER; 
SELECT FIRST_NAME;
INSERT INTO `user`( `u_password`, `u_mobile`, `u_email` ,  `u_status`, `u_type`) VALUES ( PASSWORD , PHONE , EMAIL , STATUS ,  TYPE );
SELECT MAX(U_ID) INTO X FROM USER; 
INSERT INTO `g_user_name`(`g_u_id`, `u_type`, `first_name`, `last_name`) VALUES ( X , TYPE , FIRST_NAME , LAST_NAME  );
END$$


"CREATE OR REPLACE PROCEDURE REG(IN EMAIL VARCHAR(25) , IN PASSWORD VARCHAR(25) , IN FIRST_NAME VARCHAR(25), IN LAST_NAME VARCHAR(25) , IN PHONE INT, IN TYPE VARCHAR(25), IN STATUS VARCHAR(25) )
 BEGIN 
 DECLARE X INT;
SELECT * FROM USER; 
SELECT MAX(U_ID) INTO X FROM USER; 
SELECT FIRST_NAME;
INSERT INTO `user`( `u_password`, `u_mobile`, `u_email` ,  `u_status`, `u_type`) VALUES ( PASSWORD , PHONE , EMAIL , STATUS ,  TYPE );
SELECT MAX(U_ID) INTO X FROM USER; 
INSERT INTO `g_user_name`(`g_u_id`, `u_type`, `first_name`, `last_name`) VALUES ( X , TYPE , FIRST_NAME , LAST_NAME  );
END;"





var mysql = require('mysql');
var opts = {
  	host: '127.0.0.1' , 
	user: 'root' , 
	password: '',
	database: 'ff',
	multipleStatements: true
};

var pool = mysql.createPool(opts);
pool.getConnection(function(err, conn) {
  conn.query('DROP PROCEDURE IF EXISTS pp; CREATE PROCEDURE pp(INOUT i INT, IN j INT) BEGIN SET i = 10+j; END;');
  conn.query('SET @test = 1; call pp(@test, 123); SELECT @test as inout_i', function(err, rows) {
    console.log(rows);
  });
});



CREATE OR REPLACE PROCEDURE REG(IN EMAIL VARCHAR(25) , IN PASSWORD VARCHAR(25) , IN FIRST_NAME VARCHAR(25), IN LAST_NAME VARCHAR(25) , IN PHONE INT, IN TYPE VARCHAR(25), IN STATUS VARCHAR(25) )BEGIN DECLARE X INT;  INSERT INTO `user`( `u_password`, `u_mobile`, `u_email` ,  `u_status`, `u_type`) VALUES ( PASSWORD , PHONE , EMAIL , STATUS ,  TYPE );SELECT MAX(U_ID) INTO X FROM USER; INSERT INTO `g_user_name`(`g_u_id`, `u_type`, `first_name`, `last_name`) VALUES ( X , TYPE , FIRST_NAME , LAST_NAME  );END;




connection.query(x , function(err, status){
			if(err){
				callback(false);
			}else{
				 
				//var o = JSON.parse(status[0]);
				//console.log(o);
				//console.log(status[0].u_id);
				//console.log(status);


				//callback(status);
			}
		});





INSERT INTO `user`(`u_id`, `u_password`, `u_address`, `u_email`, `u_mobile`, `dob`, `u_status`, `u_type`, `first_name`, `last_name`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10])






INSERT INTO `products`(`product_id`, `product_name`, `product_price`, `product_avlble`, `product_sell_price`, `product_original_price`, `category_id`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7])



INSERT INTO `promo`(`promo_desc`, `Promo_expiry`, `promo_percentage`, `promo_status`, `promo_limit`, `promot_use_count`, `a_id`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8])






INSERT INTO `promo`(`promo_desc`, `Promo_expiry`, `promo_percentage`, `promo_status`, `promo_limit`, `promot_use_count`) VALUES ()



productModel.updatePromo(promoid , function(status){


	});




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






select p.product_id , pr.product_name , pr.product_price , p.product_qntity from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = 2




select SUM(pr.product_price) from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = 2