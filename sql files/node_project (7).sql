-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2019 at 04:38 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cart` (IN `pid` INT, IN `uid` INT, IN `qnt` INT)  BEGIN
DECLARE p_id , c_id , cart_count int; 
DECLARE status VARCHAR(20);

SELECT cart_id  into c_id  FROM `CART` WHERE product_id = pid AND user_id = uid ;
select c_id;
if c_id IS NOT NULL
then
UPDATE `p_include_cart` SET `product_qntity`= product_qntity + qnt WHERE cart_id = c_id;
UPDATE `CART` SET `quantity`= quantity + qnt WHERE cart_id = c_id;
SET status = 'updated' ; 
select status;
SELECT COUNT(*) into cart_count FROM `cart` WHERE user_id = uid;
select cart_count;
else
INSERT INTO `cart`( `cart_status`, `user_id`,  `product_id` , `quantity` ) VALUES ('cart' , uid , pid , qnt); 
select max(cart_id) into c_id from cart;
INSERT INTO `p_include_cart`(`cart_id`, `product_id`, `product_qntity`) VALUES (c_id , pid , qnt);
SET status = 'added' ; 
select status;
SELECT COUNT(*) into cart_count FROM `cart` WHERE user_id = uid;
select cart_count;
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cartPage` (IN `uid` INT)  BEGIN
select p.product_id , pr.product_name , pr.product_price , p.product_qntity from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = uid;

select SUM(pr.product_price) as total from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = uid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `order_t` (IN `uid` INT, IN `o_date` DATE, IN `p_method` VARCHAR(20))  BEGIN
DECLARE o_no, p_id , qntity INT;
DECLARE status VARCHAR(20);
DECLARE b INT DEFAULT 0;
DECLARE cur_1 CURSOR FOR 
SELECT product_id , quantity FROM CART WHERE user_id = uid;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;

SELECT MAX(order_id) INTO o_no FROM ORDER_T;
INSERT INTO `order_t`(`order_id`, `order_date`, `payment_method`,  `user_id`) VALUES (o_no+1 , o_date , p_method , uid );

OPEN cur_1;
REPEAT FETCH cur_1 INTO p_id , qntity ;

INSERT INTO `order_includ_product`(`order_id`, `product_id`, `qntity`) VALUES (o_no+1 , p_id ,qntity);


SELECT p_id , qntity;

UNTIL b = 1
END REPEAT;
CLOSE cur_1;
SET status = 'done' ;
DELETE FROM `cart` WHERE user_id = uid;
SELECT status;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `review` (IN `uid` INT, IN `pid` INT, IN `rev_text` VARCHAR(50), IN `rev_date` DATE)  BEGIN

DECLARE rev_id INT;
DECLARE status VARCHAR(20);
SET status = 'DONE';

SELECT review_id INTO rev_id FROM `review` WHERE product_id = pid and user_id = uid;

IF rev_id IS NOT NULL
THEN

UPDATE `review` SET `review_text`= rev_text ,`review_date`= rev_date WHERE product_id= pid AND user_id= uid;

SELECT status;


ELSE

INSERT INTO `review`( `review_text`, `review_date`, `product_id`, `user_id`) VALUES (rev_text , rev_date , pid , uid ) ; 

SELECT status;

END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(5) NOT NULL,
  `a_password` varchar(50) NOT NULL,
  `a_email` varchar(50) NOT NULL,
  `a_adress` varchar(50) NOT NULL,
  `a_mobile` int(50) NOT NULL,
  `u_status` varchar(50) NOT NULL,
  `u_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_name`
--

CREATE TABLE `admin_name` (
  `a_id` int(5) NOT NULL,
  `a_u_type` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(5) NOT NULL,
  `cart_status` varchar(50) NOT NULL,
  `user_id` int(5) NOT NULL,
  `g_u_type` varchar(20) NOT NULL DEFAULT 'user',
  `order_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(5) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `give_review`
--

CREATE TABLE `give_review` (
  `review_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `seller_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `g_user`
--

CREATE TABLE `g_user` (
  `g_u_id` int(5) NOT NULL,
  `g_u_password` varchar(50) NOT NULL,
  `g_u_address` varchar(50) NOT NULL,
  `g_u_email` varchar(50) NOT NULL,
  `g_u_mobile` int(50) NOT NULL,
  `u_status` varchar(50) NOT NULL,
  `u_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `g_user`
--

INSERT INTO `g_user` (`g_u_id`, `g_u_password`, `g_u_address`, `g_u_email`, `g_u_mobile`, `u_status`, `u_type`) VALUES
(1, '12', 'arfaf', 'riyad298@gmail.com', 1919448787, 'valid', 'g_user'),
(2, '12', 'arfaf', 'riyad@gmail.com', 1719246822, 'valid', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `g_user_name`
--

CREATE TABLE `g_user_name` (
  `g_u_id` int(5) NOT NULL,
  `u_type` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `counter` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `g_user_name`
--

INSERT INTO `g_user_name` (`g_u_id`, `u_type`, `first_name`, `last_name`, `counter`) VALUES
(1, 'user', 'Riyad', 'Ahsan', 1),
(2, 'user', 'Ahsan', 'Riyad', 2),
(115, 'AERF', 'AERF', 'AERFAE', 3),
(128, 'F', 'ff', 'ff', 4),
(129, 'F', 'ff', 'ff', 5),
(131, 'F', 'ff', 'ff', 6),
(133, 'F', 'ff', 'ff', 7),
(135, 'F', 'ff', 'ff', 8),
(137, 'F', 'ff', 'ff', 9),
(139, 'F', 'ff', 'ff', 10),
(141, 'F', 'ff', 'ff', 11),
(143, 'F', 'ff', 'ff', 12),
(145, 'F', 'ff', 'ff', 13),
(147, 'F', 'ff', 'ff', 14),
(149, 'F', 'ff', 'ff', 15),
(151, 'F', 'ff', 'ff', 16),
(153, 'F', 'ff', 'ff', 17),
(154, 'F', 'ff', 'ff', 18),
(1, 'user', 'ahsan', 'riyad', 19);

-- --------------------------------------------------------

--
-- Table structure for table `msg`
--

CREATE TABLE `msg` (
  `msg_id` int(5) NOT NULL,
  `msg_text` varchar(50) NOT NULL,
  `msg_status` varchar(50) NOT NULL,
  `msg_reply` varchar(50) NOT NULL,
  `msg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `msg-g_user-admin`
--

CREATE TABLE `msg-g_user-admin` (
  `a_id` int(5) NOT NULL,
  `a_type` varchar(50) NOT NULL,
  `g_u_id` int(5) NOT NULL,
  `g_type` varchar(50) NOT NULL,
  `msg_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `msg-seller-admin`
--

CREATE TABLE `msg-seller-admin` (
  `a_id` int(5) NOT NULL,
  `a_u_type` varchar(50) NOT NULL,
  `s_id` int(5) NOT NULL,
  `s_u_type` varchar(50) NOT NULL,
  `msg_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_includ_product`
--

CREATE TABLE `order_includ_product` (
  `order_id` int(8) NOT NULL,
  `product_id` int(8) NOT NULL,
  `qntity` int(8) NOT NULL,
  `counter` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_includ_product`
--

INSERT INTO `order_includ_product` (`order_id`, `product_id`, `qntity`, `counter`) VALUES
(2, 3, 0, 1),
(2, 6, 0, 2),
(2, 10, 0, 3),
(2, 11, 0, 4),
(2, 9, 0, 5),
(2, 5, 0, 6),
(2, 7, 0, 7),
(2, 1, 0, 8),
(2, 8, 1, 9),
(2, 8, 1, 10),
(3, 3, 0, 11),
(3, 6, 0, 12),
(3, 10, 0, 13),
(3, 11, 0, 14),
(3, 9, 0, 15),
(3, 5, 0, 16),
(3, 7, 0, 17),
(3, 1, 0, 18),
(3, 8, 1, 19),
(3, 8, 1, 20),
(4, 10, 1, 21),
(4, 10, 1, 22),
(5, 7, 1, 23),
(5, 7, 1, 24),
(6, 7, 1, 25),
(6, 7, 1, 26),
(7, 8, 1, 27),
(7, 8, 1, 28),
(8, 2, 1, 29),
(8, 2, 1, 30),
(9, 7, 1, 31),
(9, 7, 1, 32),
(10, 10, 1, 33),
(10, 10, 1, 34),
(12, 1, 1, 35),
(12, 1, 1, 36),
(13, 8, 1, 37),
(13, 6, 1, 38),
(13, 6, 1, 39),
(14, 10, 1, 40),
(14, 1, 1, 41),
(14, 1, 1, 42),
(15, 7, 1, 43),
(15, 7, 1, 44),
(16, 7, 4, 45),
(16, 7, 4, 46);

-- --------------------------------------------------------

--
-- Table structure for table `order_t`
--

CREATE TABLE `order_t` (
  `order_id` int(5) NOT NULL,
  `order_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `return_id` int(5) NOT NULL,
  `user_id` int(8) NOT NULL,
  `counter` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(5) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` int(5) NOT NULL,
  `product_avlble` int(5) NOT NULL,
  `product_sell_price` int(5) NOT NULL,
  `product_original_price` int(5) NOT NULL,
  `category_id` int(5) NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_avlble`, `product_sell_price`, `product_original_price`, `category_id`, `descriptions`, `category_name`, `sub_category`) VALUES
(1, 'Monitor LG', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg'),
(2, 'Monitor Samsung ', 343, 34, 235, 2356, 346, 'useful for home', 'monitor', 'samsung'),
(3, 'Monitor Walton', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'walton'),
(4, 'hard disk 1TB', 343, 34, 235, 2356, 346, 'useful for home', 'hdd', 'toshiba'),
(5, 'hard disk 2TB', 33, 33, 33, 34, 34, 'useful for home', 'hdd', 'western_digital'),
(6, 'hard disk 4TB', 33, 33, 33, 34, 34, 'useful for home', 'hdd', 'adata'),
(7, 'Printer Canon', 343, 34, 235, 2356, 346, 'useful for home', 'printer', 'canon'),
(8, 'Printer HP', 33, 33, 33, 34, 34, 'useful for home', 'printer', 'hp'),
(9, 'Ram Transcend', 343, 34, 235, 2356, 346, 'useful for home', 'ram', 'transcend'),
(10, 'Ram Adata', 33, 33, 33, 34, 34, 'useful for home', 'ram', 'adata'),
(11, 'Ram Razor', 33, 33, 33, 34, 34, 'useful for home', 'ram', 'razor'),
(12, 'Motherboard GigaByte', 343, 34, 235, 2356, 346, 'useful for home', 'motherboard', 'gigabyte'),
(13, 'Motherboard Asus', 33, 33, 33, 34, 34, 'useful for home', 'motherboard', 'asus'),
(14, 'Motherboard Intel', 343, 34, 235, 2356, 346, 'useful for home', 'motherboard', 'intel'),
(15, 'Processor Intel', 33, 33, 33, 34, 34, 'useful for home', 'processor', 'intel'),
(16, 'Processor AMD', 33, 34, 235, 34, 34, 'Computer processor , high quality', 'processor', 'amd'),
(17, 'Monitor LG Full HD', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg'),
(18, 'Monitor LG Full HD', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg'),
(19, 'Monitor Samsung 4K', 343, 34, 235, 2356, 346, 'useful for home', 'monitor', 'samsung'),
(20, 'Monitor Walton Plasma', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'walton'),
(21, 'hard disk 1TB 5400rpm', 343, 34, 235, 2356, 346, 'useful for home', 'hdd', 'toshiba'),
(22, 'hard disk 4TB 7200rpm', 33, 33, 33, 34, 34, 'useful for home', 'hdd', 'adata'),
(23, 'Printer Canon For Photos', 343, 34, 235, 2356, 346, 'useful for home', 'printer', 'canon'),
(24, 'Ram Adata 8GB', 33, 33, 33, 34, 34, 'useful for home', 'ram', 'adata'),
(25, 'Ram Razor 16GB', 33, 33, 33, 34, 34, 'useful for home', 'ram', 'razor'),
(26, 'Printer HP 1080P', 33, 33, 33, 34, 34, 'useful for home', 'printer', 'hp'),
(27, 'Motherboard Intel Gaming', 343, 34, 235, 2356, 346, 'useful for home', 'motherboard', 'intel'),
(28, 'Processor Intel Core i3', 33, 33, 33, 34, 34, 'useful for home', 'processor', 'intel'),
(29, 'Processor Intel Core i5', 33, 33, 33, 34, 34, 'useful for home', 'processor', 'intel'),
(30, 'Processor Intel Core i9', 33, 33, 33, 34, 34, 'useful for home', 'processor', 'intel');

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `promo_id` int(5) NOT NULL,
  `promo_desc` varchar(50) NOT NULL,
  `Promo_expiry` date NOT NULL,
  `promo_percentage` int(50) NOT NULL,
  `promo_status` varchar(50) NOT NULL,
  `promo_limit` int(5) NOT NULL,
  `promo_use_count` int(5) NOT NULL,
  `a_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`promo_id`, `promo_desc`, `Promo_expiry`, `promo_percentage`, `promo_status`, `promo_limit`, `promo_use_count`, `a_id`) VALUES
(5, 'arf', '0000-00-00', 2, '3', 22, 22, 0),
(7, 'afre', '0000-00-00', 3, '3', 22, 222, 0),
(8, 'afre', '0000-00-00', 4, '3', 222, 22, 2),
(9, 'arfar', '0000-00-00', 3, '3', 23, 33, 2),
(10, 'afre', '0000-00-00', 4, '4', 12, 222, 2),
(11, 'afre', '0000-00-00', 4, '3', 345, 333, 2),
(12, 'afre', '0000-00-00', 2, '3', 122, 123, 2),
(13, 'afre', '0000-00-00', 2, '3', 122, 123, 2),
(16, 'afre', '2019-03-21', 3, '2', 22, 33, 2);

-- --------------------------------------------------------

--
-- Table structure for table `promo_use`
--

CREATE TABLE `promo_use` (
  `promo_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `g_u_type` varchar(50) NOT NULL,
  `user_use_date` date NOT NULL,
  `user_use_count` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `p_include_cart`
--

CREATE TABLE `p_include_cart` (
  `cart_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `product_qntity` int(5) NOT NULL,
  `counter` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `p_include_wishlist`
--

CREATE TABLE `p_include_wishlist` (
  `wishlist_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `product_qntity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `return_t`
--

CREATE TABLE `return_t` (
  `return_id` int(5) NOT NULL,
  `return_desc` varchar(50) NOT NULL,
  `return_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(5) NOT NULL,
  `review_text` varchar(50) NOT NULL,
  `review_status` varchar(50) NOT NULL,
  `review_date` date NOT NULL,
  `product_id` int(5) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `review_text`, `review_status`, `review_date`, `product_id`, `user_id`) VALUES
(14, 'it is a good product', '', '2019-02-19', 8, 2),
(15, 'it is a good product', '', '2019-02-19', 7, 2),
(16, 'it is a good product', '', '2019-02-19', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `s_id` int(5) NOT NULL,
  `s_password` varchar(50) NOT NULL,
  `s_address` varchar(50) NOT NULL,
  `s_email` varchar(50) NOT NULL,
  `s_mobile` int(50) NOT NULL,
  `u_status` varchar(50) NOT NULL,
  `u_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller_name`
--

CREATE TABLE `seller_name` (
  `s_id` int(5) NOT NULL,
  `u_type` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supply_contains`
--

CREATE TABLE `supply_contains` (
  `supply_id` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `product_qntity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supply_order`
--

CREATE TABLE `supply_order` (
  `supply_id` int(5) NOT NULL,
  `supply_date` date NOT NULL,
  `supply_status` varchar(50) NOT NULL,
  `seller_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(5) NOT NULL,
  `u_password` varchar(50) NOT NULL,
  `u_address` varchar(50) NOT NULL,
  `u_email` varchar(50) NOT NULL,
  `u_mobile` int(5) NOT NULL,
  `dob` date NOT NULL,
  `u_status` varchar(50) NOT NULL,
  `u_type` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_password`, `u_address`, `u_email`, `u_mobile`, `dob`, `u_status`, `u_type`, `first_name`, `last_name`) VALUES
(2, '12', '', 'riyad298@gmail.com', 1919448787, '2007-02-17', 'valid', 'admin', 'Muhammad Ahsan', 'Riyad'),
(4, 'fff', '', 'ffffaaa', 666, '2007-02-14', 'valid', 'user', 'Muhammad Ahsan', 'afa'),
(12, 'afrf', '', 'riyadarfr298@gmail.com', 1919448787, '2007-03-15', 'valid', 'user', 'Muhammad Ahsan', 'Riyad'),
(14, 'arefa', '', 'riyadhellow298@gmail.com', 1919448787, '0000-00-00', 'valid', 'user', 'Muhammad Ahsan', 'Riyad'),
(15, '448787', '', 'riyad298@outlook.com', 1919448787, '0000-00-00', 'valid', 'user', 'Ahsan', 'Riyad'),
(16, 'afaaf', '', 'afa343', 122, '0000-00-00', 'valid', 'user', '', 'afa'),
(18, 'afa', '', 'aafa', 111, '0000-00-00', 'seller', 'valid', '', 'afa'),
(19, '111', '', 'riyad28877722@gmail.com', 1919448787, '0000-00-00', 'valid', 'admin', 'sde', 'edf');

-- --------------------------------------------------------

--
-- Table structure for table `user_name`
--

CREATE TABLE `user_name` (
  `U_id` int(5) NOT NULL,
  `U_type` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `counter` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_name`
--

INSERT INTO `user_name` (`U_id`, `U_type`, `first_name`, `last_name`, `counter`) VALUES
(155, 'F', 'ff', 'ff', 1),
(156, 'F', 'ff', 'ff', 2),
(157, 'user', 'afrfa', 'rfa', 3),
(158, 'user', 'afre', 'afr', 4),
(1, 'user', 'afrfa', 'afr', 5),
(5, 'user', 'afrfa', 'afr', 6),
(7, 'user', 'afrfa', 'rfa', 7),
(9, 'arf', 'refa', 'raefa', 8),
(10, 'arfea', 'afer', 'arfa', 9),
(11, 'afra', 'arfa', 'rfaf', 10),
(12, 'user', 'Muhammad Ahsan', 'Riyad', 11),
(14, 'user', 'afrfa', 'rfa', 12),
(16, 'user', 'Muhammad Ahsan', 'Riyad', 13),
(18, 'user', 'Muhammad Ahsan', 'Riyad', 14),
(20, 'user', 'Muhammad Ahsan', 'Riyad', 15);

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `product_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `user_ip` varchar(50) NOT NULL,
  `hit_count` int(5) NOT NULL,
  `counter` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`product_id`, `user_id`, `user_ip`, `hit_count`, `counter`) VALUES
(2, 0, '::1', 0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(5) NOT NULL,
  `wishlist_status` varchar(50) NOT NULL,
  `user_id` int(5) NOT NULL,
  `g_u_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD UNIQUE KEY `cart_id` (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `g_user`
--
ALTER TABLE `g_user`
  ADD PRIMARY KEY (`g_u_id`);

--
-- Indexes for table `g_user_name`
--
ALTER TABLE `g_user_name`
  ADD PRIMARY KEY (`counter`);

--
-- Indexes for table `msg`
--
ALTER TABLE `msg`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `order_includ_product`
--
ALTER TABLE `order_includ_product`
  ADD PRIMARY KEY (`counter`);

--
-- Indexes for table `order_t`
--
ALTER TABLE `order_t`
  ADD PRIMARY KEY (`counter`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD UNIQUE KEY `promo_id` (`promo_id`);

--
-- Indexes for table `p_include_cart`
--
ALTER TABLE `p_include_cart`
  ADD PRIMARY KEY (`counter`);

--
-- Indexes for table `return_t`
--
ALTER TABLE `return_t`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `supply_order`
--
ALTER TABLE `supply_order`
  ADD PRIMARY KEY (`supply_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `u_email` (`u_email`),
  ADD UNIQUE KEY `u_email_2` (`u_email`);

--
-- Indexes for table `user_name`
--
ALTER TABLE `user_name`
  ADD PRIMARY KEY (`counter`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`counter`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_user`
--
ALTER TABLE `g_user`
  MODIFY `g_u_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `g_user_name`
--
ALTER TABLE `g_user_name`
  MODIFY `counter` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `msg`
--
ALTER TABLE `msg`
  MODIFY `msg_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_includ_product`
--
ALTER TABLE `order_includ_product`
  MODIFY `counter` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `order_t`
--
ALTER TABLE `order_t`
  MODIFY `counter` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `promo_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `p_include_cart`
--
ALTER TABLE `p_include_cart`
  MODIFY `counter` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `return_t`
--
ALTER TABLE `return_t`
  MODIFY `return_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `s_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supply_order`
--
ALTER TABLE `supply_order`
  MODIFY `supply_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_name`
--
ALTER TABLE `user_name`
  MODIFY `counter` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `counter` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
