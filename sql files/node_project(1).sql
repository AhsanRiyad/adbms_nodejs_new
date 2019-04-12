-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2019 at 01:04 AM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `MYPROC` ()  BEGIN
DECLARE X INT;
DECLARE Y INT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `N` ()  BEGIN
DECLARE X INT;
SET X = 200;
SELECT X;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pp` (INOUT `i` INT, IN `j` INT)  BEGIN SET i = 10+j; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REG` (IN `EMAIL` VARCHAR(25), IN `PASSWORD` VARCHAR(25), IN `FIRST_NAME` VARCHAR(25), IN `LAST_NAME` VARCHAR(25), IN `PHONE` VARCHAR(25), IN `TYPE` VARCHAR(25), IN `STATUS` VARCHAR(25))  BEGIN
DECLARE X INT; 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RR` (IN `R` INT)  BEGIN SELECT * FROM USER; SELECT R ; INSERT  INTO USER (`U_MOBILE`)VALUES(R);  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `X` ()  BEGIN
DECLARE N INT;
SET N = 50;
SELECT N;
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
  `g_u_type` int(5) NOT NULL,
  `order_id` int(5) NOT NULL
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
(115, 'AERF', 'AERF', 'AERFAE', 3);

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
-- Table structure for table `order_t`
--

CREATE TABLE `order_t` (
  `order_id` int(5) NOT NULL,
  `order_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `return_id` int(5) NOT NULL
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
  `category_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `promot_use_count` int(5) NOT NULL,
  `a_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `product_qntity` int(5) NOT NULL
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
  `product_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `u_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_password`, `u_address`, `u_email`, `u_mobile`, `dob`, `u_status`, `u_type`) VALUES
(1, '448787', 'bashundhara', 'riyad298@gmail.com', 1919448787, '2019-03-03', 'valid', 'g_user'),
(2, '448787', 'bashundhara', 'riyad@gmail.com', 1919448787, '2019-03-12', 'valid', 'admin'),
(9, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(10, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(11, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(12, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(13, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(14, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(15, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(16, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(17, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(18, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(19, 'arf', '', 'riyad298@gmail.com', 1919448787, '2008-02-10', 'g_user', 'valid'),
(20, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-03-15', 'g_user', 'valid'),
(21, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-03-15', 'g_user', 'valid'),
(22, '12', '', 'riyad298@gmail.com', 1919448787, '2007-03-12', 'g_user', 'valid'),
(23, '12', '', 'riyad298@gmail.com', 1919448787, '2007-03-12', 'g_user', 'valid'),
(24, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-15', 'g_user', 'valid'),
(25, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-15', 'g_user', 'valid'),
(26, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-03-15', 'g_user', 'valid'),
(27, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-03-15', 'g_user', 'valid'),
(28, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-03-16', 'g_user', 'valid'),
(29, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-03-16', 'g_user', 'valid'),
(30, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-03-16', 'g_user', 'valid'),
(31, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-01-15', 'g_user', 'valid'),
(32, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-01-15', 'g_user', 'valid'),
(33, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-01-15', 'g_user', 'valid'),
(34, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-01-15', 'g_user', 'valid'),
(35, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-03-15', 'g_user', 'valid'),
(36, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-04-11', 'g_user', 'valid'),
(37, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-04-13', 'g_user', 'valid'),
(38, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-04-11', 'g_user', 'valid'),
(39, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-04-11', 'g_user', 'valid'),
(40, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-04-11', 'g_user', 'valid'),
(41, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-04-11', 'g_user', 'valid'),
(42, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-04-11', 'g_user', 'valid'),
(43, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(44, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-13', 'g_user', 'valid'),
(45, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-03-14', 'g_user', 'valid'),
(46, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(47, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(48, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(49, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(50, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(51, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(52, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(53, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(54, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(55, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(56, 'afre', '', 'riyad298@gmail.com', 1919448787, '2007-03-12', 'g_user', 'valid'),
(57, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(58, 'arf', '', 'riyad298@gmail.com', 1919448787, '2006-04-13', 'g_user', 'valid'),
(59, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(60, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(61, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(62, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(63, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(64, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(65, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(66, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(67, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-07', 'g_user', 'valid'),
(68, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-07', 'g_user', 'valid'),
(69, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-07', 'g_user', 'valid'),
(70, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-07', 'g_user', 'valid'),
(71, '0', '', '0', 454, '0000-00-00', '', ''),
(72, 'arf', '', 'riyad298@gmail.com', 1919448787, '2007-02-07', 'g_user', 'valid'),
(73, '0', '', '0', 0, '0000-00-00', '', ''),
(74, 'arf', '', 'riyad298@gmail.com', 1919448787, '2008-03-15', 'g_user', 'valid'),
(75, 'arf', '', 'riyad298@gmail.com', 1919448787, '2008-03-15', 'g_user', 'valid'),
(76, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(77, 'ARF', '', 'AREF', 44, '0000-00-00', '', ''),
(78, 'password', '', 'email', 0, '0000-00-00', '', ''),
(79, 'password', '', 'email', 444, '0000-00-00', '', ''),
(80, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(81, 'password', '', 'email', 333, '0000-00-00', '', ''),
(82, 'password', '', 'email', 444, '0000-00-00', '', ''),
(83, 'password', '', 'email', 233, '0000-00-00', '', ''),
(84, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(85, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(86, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(87, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(88, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(89, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(90, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(91, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(92, '', '', '12', 0, '0000-00-00', '', ''),
(93, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(94, '', '', '', 0, '0000-00-00', '', ''),
(95, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(96, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(97, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(98, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(99, 'ARFA', '', 'AFR', 0, '0000-00-00', '', ''),
(100, 'A11', '', 'A11A', 0, '0000-00-00', '', ''),
(101, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(102, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(103, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(104, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(105, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(106, 'AREFAEF', '', 'ARFA', 0, '0000-00-00', '', ''),
(107, 'arf', '', 'riyad298@gmail.com', 1919448787, '2008-02-14', 'g_user', 'valid'),
(108, 'ff', '', 'ff', 0, '0000-00-00', '', ''),
(109, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(110, 'ff', '', 'ff', 0, '0000-00-00', '', ''),
(111, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(112, 'ff', '', 'ff', 0, '0000-00-00', '', ''),
(113, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(114, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(115, 'AERFEA', '', 'AFRAE', 0, '0000-00-00', 'AFRA', 'AERF'),
(116, 'arf', '', 'riyad298@gmail.com', 1919448787, '2008-02-11', 'g_user', 'valid'),
(117, 'arf', '', 'riyad298@gmail.com', 1919448787, '2008-02-11', 'g_user', 'valid'),
(118, 'arf', '', 'riyad298@gmail.com', 1919448787, '2008-02-11', 'g_user', 'valid'),
(119, 'arf', '', 'riyad298@gmail.com', 1919448787, '2008-02-11', 'g_user', 'valid'),
(120, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(121, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid'),
(122, 'arf', '', 'riyad298@gmail.com', 1919448787, '0000-00-00', 'g_user', 'valid');

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

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `product_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `user_ip` varchar(50) NOT NULL,
  `hit_count` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

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
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `user_name`
--
ALTER TABLE `user_name`
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
  MODIFY `counter` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `msg`
--
ALTER TABLE `msg`
  MODIFY `msg_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_t`
--
ALTER TABLE `return_t`
  MODIFY `return_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(5) NOT NULL AUTO_INCREMENT;

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
  MODIFY `u_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `user_name`
--
ALTER TABLE `user_name`
  MODIFY `counter` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
