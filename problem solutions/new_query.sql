
#####################################################

drop table user_table;

drop table products;

drop table visit;

drop table cart;

drop table categories;

drop table give_review;

drop table order_includ_product;

drop table promo;

drop table review;


##################################################

create table user_table
(
u_id number(5),
u_password varchar2(15),
u_address varchar2(30) ,
u_email varchar2(30) unique,
u_mobile number(11) ,
dob date ,
u_status varchar2(30) ,
first_name varchar2(50) NOT NULL,
last_name varchar2(50) NOT NULL,
u_type varchar2(50) NOT NULL,
constraint  g_user_pk primary key(u_id)
);



insert into user_table (u_id, u_password, u_address, u_email, u_mobile, dob, u_status, first_name, last_name , u_type) values('1', '12' , 'tangail' , 'riyad298@gmail.com' , '01919448787' , (TO_DATE('2003/05/03', 'yyyy/mm/dd')) , 'valid' , 'Aiyad' , 'Riyad' , 'admin');


#####################################################################

CREATE TABLE products (
  product_id number(5) NOT NULL,
  product_name varchar2(50) NOT NULL,
  product_price number(5) NOT NULL,
  product_avlble number(5) NOT NULL,
  product_sell_price number(5) NOT NULL,
  product_original_price number(5) NOT NULL,
  category_id number(5) NOT NULL,
  descriptions varchar2(100) NOT NULL,
  category_name varchar2(50) NOT NULL,
  sub_category varchar2(50) NOT NULL
) 



INSERT INTO products (product_id,
product_name,
product_price,
product_avlble,
product_sell_price,
product_original_price,
category_id,
descriptions,
category_name,
sub_category) VALUES
(1, 'Monitor LG', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg');




INSERT INTO products (product_id,
product_name,
product_price,
product_avlble,
product_sell_price,
product_original_price,
category_id,
descriptions,
category_name,
sub_category) VALUES
(2, 'Monitor Samsung ', 343, 34, 235, 2356, 346, 'useful for home', 'monitor', 'samsung');





################################################################


CREATE TABLE visit (
  product_id number(5) NOT NULL,
  user_id number(5) NOT NULL,
  user_ip varchar2(50) NOT NULL,
  hit_count number(5) NOT NULL,
  counter number(8) NOT NULL
) 


INSERT INTO visit (product_id, user_id, user_ip, hit_count, counter) VALUES
(2, 0, '::1', 0, 20);



#################################################################


CREATE TABLE cart (
  cart_id number(5) NOT NULL,
  cart_status varchar2(50) NOT NULL,
  user_id number(5) NOT NULL,
  g_u_type varchar2(20) NOT NULL,
  order_id number(5) NOT NULL,
  product_id number(5) NOT NULL,
  quantity number(5) NOT NULL
)



#################################################################



CREATE TABLE categories (
  category_id number(5) NOT NULL,
  category_name varchar2(50) NOT NULL
)



#################################################################


CREATE TABLE give_review (
  review_id number(5) NOT NULL,
  user_id number(5) NOT NULL,
  seller_id number(5) NOT NULL
)


#################################################################


CREATE TABLE order_includ_product (
  order_id number(8) NOT NULL,
  product_id number(8) NOT NULL,
  qntity number(8) NOT NULL,
  counter number(8) NOT NULL
)



#################################################################


CREATE TABLE promo (
  promo_id number(5) NOT NULL,
  promo_desc varchar2(50) NOT NULL,
  Promo_expiry date NOT NULL,
  promo_percentage number(20) NOT NULL,
  promo_status varchar2(50) NOT NULL,
  promo_limit number(5) NOT NULL,
  promo_use_count number(5) NOT NULL,
  a_id number(5) NOT NULL
)


#################################################################


CREATE TABLE review (
  review_id number(5) NOT NULL,
  review_text varchar(50) NOT NULL,
  review_status varchar(50) NOT NULL,
  review_date date NOT NULL,
  product_id number(5) NOT NULL,
  user_id number(8) NOT NULL
)


#################################################################




