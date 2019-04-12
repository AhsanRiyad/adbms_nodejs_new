create table Admin
(
a_id number(5),
a_password varchar2(15),
a_address varchar2(30) not null,
a_email varchar2(30) unique,
a_mobile number(11) not null,
u_status varchar2(30) not null,
CONSTRAINT Admin_pk PRIMARY KEY (a_id)

);

insert into Admin values('11','12','sirajgonj','nishi@gmail.com','01111','valid');
insert into Admin values('12','12','sirajgonj','nish2@gmail.com','01111','valid');
insert into Admin values('13','12','sirajgonj','nish3@gmail.com','01111','valid');
insert into Admin values('14','12','sirajgonj','nish4@gmail.com','01111','valid');
insert into Admin values('15','12','sirajgonj','nish5@gmail.com','01111','valid');

create table Seller
(
s_id number(5) ,
s_password varchar2(30),
s_address varchar2(30),
s_email varchar2(30) unique,
s_mobile number(11) unique,
u_status varchar2(30) not null,
constraint  Seller_pk primary key(s_id )
);

insert into Seller values('21','orange','tangail','jannat@gmail.com','019437438','valid');
insert into Seller values('22','orange','tangail','jannat2@gmail.com','0194374382','valid');
insert into Seller values('23','orange','tangail','jannat3@gmail.com','0194374383','valid');
insert into Seller values('24','orange','tangail','jannat4@gmail.com','0194374384','valid');
insert into Seller values('25','orange','tangail','jannat5@gmail.com','0194374385','valid');


create table G_user
(
g_u_id number(5),
g_u_password varchar2(15),
g_u_address varchar2(30) not null,
g_u_email varchar2(30) unique,
g_u_mobile number(11) not null,
u_status varchar2(30) not null,
constraint  g_user_pk primary key(g_u_id )
);

insert into G_user values('31','orange','tangail','jannat1@gmail.com','019437438','valid');
insert into G_user values('32','orange','tangail','jannat2@gmail.com','019437438','valid');
insert into G_user values('33','orange','tangail','jannat3@gmail.com','019437438','valid');
insert into G_user values('34','orange','tangail','jannat4@gmail.com','019437438','valid');
insert into G_user values('35','orange','tangail','jannat5@gmail.com','019437438','valid');






create table Seller_name
(
s_id number(5),
first_name varchar2(30),
last_name varchar2(30),
constraint s_id_fk foreign key(s_id) references Seller(s_id),
constraint seller_name_pk primary key (s_id )
);




CREATE TABLE Admin_name 
   (	a_id NUMBER(5), 
	first_name varchar2(30), 
	last_name varchar2(30), 
	 CONSTRAINT a_id_fk FOREIGN KEY (a_id)
	  REFERENCES  Admin (a_id),
constraint admin_name_pk primary key (a_id )

   );


CREATE TABLE G_user_name 
   (	g_u_id NUMBER(5), 
	first_name varchar2(30), 
	last_name varchar2(30), 
	 CONSTRAINT g_u_id_fk FOREIGN KEY (g_u_id)
	  REFERENCES  G_user (g_u_id),
constraint g_u_name_pk primary key (g_u_id )
   );


create table Promo
(
   promo_id number(5),
   promo_desc varchar2(30),
   Promo_expiry date ,
   promo_percentage number(10),
   promo_status varchar2(20),
   promo_limit number(10),
   promo_use_count number(10),
   a_id number(5),
   CONSTRAINT Promo_pk PRIMARY KEY (promo_id),
   CONSTRAINT a_idi_fk FOREIGN KEY (a_id) REFERENCES Admin(a_id)
);




insert into Promo values('1','pri',(TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss')),50,'valid','limited',34,11);
insert into Promo values('2','pri',(TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss')),50,'valid','limited',34,11);
insert into Promo values('3','pri',(TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss')),50,'valid','limited',34,11);
insert into Promo values('4','pri',(TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss')),50,'valid','limited',34,11);
insert into Promo values('5','pri',(TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss')),50,'valid','limited',34,11);




create table Promo_use
(
   promo_id number(5),
  user_id number(5),
user_type varchar2(30),
user_use_date date,
user_use_count number(20),
   CONSTRAINT promid_fk FOREIGN KEY (promo_id) REFERENCES Promo(promo_id),
 CONSTRAINT promid_user_fk FOREIGN KEY (user_id) REFERENCES G_user(g_u_id ),
CONSTRAINT Promo_use_pk PRIMARY KEY (user_id , promo_id)

);

insert into Promo_use values('1','31','user',to_date('09-02-19','dd-mm-yyyy'),'23');
insert into Promo_use values('2','31','user',to_date('09-02-19','dd-mm-yyyy'),'23');
insert into Promo_use values('3','31','user',to_date('09-02-19','dd-mm-yyyy'),'23');
insert into Promo_use values('4','31','user',to_date('09-02-19','dd-mm-yyyy'),'23');
insert into Promo_use values('5','31','user',to_date('09-02-19','dd-mm-yyyy'),'23');


create table Categories
(
 category_id number(5),
 category_name varchar2(30),
CONSTRAINT Categories_pk PRIMARY KEY (category_id)
);

insert into Categories values('1','first');
insert into Categories values('2','second');
insert into Categories values('3','first');
insert into Categories values('4','first');
insert into Categories values('5','first');

create table Products
(
   product_id number(5),
   product_name varchar2(30) ,
   product_price varchar2(30) ,
   product_avlble varchar2(30) ,
   product_sell_price number(5) ,
   product_original_price number(5) ,
   category_id number(5),
   CONSTRAINT Products_pk PRIMARY KEY (product_id),
   CONSTRAINT Products_fk FOREIGN KEY (category_id) REFERENCES Categories(category_id)
  
);

ALTER TABLE Products
MODIFY product_price number;
ALTER TABLE Products
MODIFY product_avlble number;





insert into Products values(1,'soap',100,200, 100,80,1);
insert into Products values(2,'soap',100,200, 100,80,1);
insert into Products values(3,'soap',100,200, 100,80,1);
insert into Products values(4,'soap',100,200, 100,80,1);
insert into Products values(5,'soap',100,200, 100,80,1);

create table Order_t
(
   order_id number(5),
   order_date date,
   payment_method varchar2(30),
   payment_status varchar2(30),
   CONSTRAINT Order_t_pk PRIMARY KEY (order_id)
 
)

insert into Order_t values(1,to_date('09-09-18','dd-mm-yyyy'),'cash','pending');
insert into Order_t values(2,to_date('09-09-18','dd-mm-yyyy'),'cash','pending');
insert into Order_t values(3,to_date('09-09-18','dd-mm-yyyy'),'cash','pending');
insert into Order_t values(4,to_date('09-09-18','dd-mm-yyyy'),'cash','pending');
insert into Order_t values(5,to_date('09-09-18','dd-mm-yyyy'),'cash','pending');


create table Cart
(
   cart_id number(5),
   cart_status varchar2(30) ,
   g_u_id  number(5),
   order_id number(5),
   CONSTRAINT Cart_pk PRIMARY KEY (cart_id),
   CONSTRAINT userid1_fk FOREIGN KEY (g_u_id) REFERENCES G_user(g_u_id),
   CONSTRAINT orderid1_fk FOREIGN KEY (order_id) REFERENCES Order_t(order_id)
);

insert into Cart values(1,'cart',31 ,1);
insert into Cart values(2,'cart',31 ,1);
insert into Cart values(3,'cart',31 ,1);
insert into Cart values(4,'cart',31 ,1);
insert into Cart values(5,'cart',31 ,1);

create table P_include_cart
(
   cart_id number(5),
   product_id number(5) ,
   product_qntity number(5) ,
   constraint P_include_cart_pk primary key(cart_id , product_id),
   CONSTRAINT cartid3_fk FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
   CONSTRAINT productid2_fk FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

ALTER TABLE P_include_cart
MODIFY product_qntity number;

insert into P_include_cart values(1,1,1);
insert into P_include_cart values(2,1,1);
insert into P_include_cart values(3,1,1);
insert into P_include_cart values(4,1,1);
insert into P_include_cart values(5,1,1);


create table Supply_order
(
 supply_id number(5),
 supply_date date ,
supply_status varchar2(30),
s_id number(5),
CONSTRAINT Supply_order_pk PRIMARY KEY (supply_id),
CONSTRAINT sid3_fk FOREIGN KEY (s_id) REFERENCES Seller(s_id)
);


insert into Supply_order values(1,to_date('09-06-18','dd-mm-yyyy'),'valid' , 21);
insert into Supply_order values(2,to_date('09-06-18','dd-mm-yyyy'),'valid' , 21);
insert into Supply_order values(3,to_date('09-06-18','dd-mm-yyyy'),'valid' , 21);
insert into Supply_order values(4,to_date('09-06-18','dd-mm-yyyy'),'valid' , 21);
insert into Supply_order values(5,to_date('09-06-18','dd-mm-yyyy'),'valid' , 21);



create table Supply_contains
(
   supply_id number(5),
   product_id number(5),
   product_qntity varchar2(30) ,
   CONSTRAINT supplyid1_fk FOREIGN KEY (supply_id) REFERENCES Supply_order(supply_id),
   CONSTRAINT productid3_fk FOREIGN KEY (product_id) REFERENCES Products(product_id),
CONSTRAINT Supply_contains_pk PRIMARY KEY (supply_id , product_id)
   
);


ALTER TABLE Supply_contains
MODIFY product_qntity number;

insert into Supply_contains values(1,1,1);
insert into Supply_contains values(2,1,1);
insert into Supply_contains values(3,1,1);
insert into Supply_contains values(4,1,1);
insert into Supply_contains values(5,1,1);


create table review
(
review_id number(5),
review_text varchar2(30),
review_status varchar2(30),
review_date date ,
product_id number(5),
CONSTRAINT review_pk PRIMARY KEY (review_id),
 CONSTRAINT productid4_fk FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

insert into review values(1,'post','user',to_date('09-05-18','dd-mm-yyyy'),1);
insert into review values(2,'post','user',to_date('09-05-18','dd-mm-yyyy'),1);
insert into review values(3,'post','user',to_date('09-05-18','dd-mm-yyyy'),1);
insert into review values(4,'post','user',to_date('09-05-18','dd-mm-yyyy'),1);
insert into review values(5,'post','user',to_date('09-05-18','dd-mm-yyyy'),1);


create table Give_review
(
review_id number(5),
user_id number(5),
s_id number(5),
CONSTRAINT Give_review_pk PRIMARY KEY (review_id , user_id , s_id ),
CONSTRAINT review2_fk FOREIGN KEY (review_id) REFERENCES review(review_id),
CONSTRAINT sid4_fk FOREIGN KEY (s_id) REFERENCES Seller(s_id),
 CONSTRAINT userid5_fk FOREIGN KEY (user_id) REFERENCES G_user(g_u_id )
);


insert into Give_review values(1,31,21);
insert into Give_review values(2,31,21);
insert into Give_review values(3,31,21);
insert into Give_review values(4,31,21);
insert into Give_review values(5,31,21);







