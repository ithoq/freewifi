-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 18, 2015 at 06:58 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `radius`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_active_code`
--

DROP TABLE IF EXISTS `app_active_code`;
CREATE TABLE IF NOT EXISTS `app_active_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Truncate table before insert `app_active_code`
--

TRUNCATE TABLE `app_active_code`;
--
-- Dumping data for table `app_active_code`
--

INSERT INTO `app_active_code` (`id`, `username`, `code`) VALUES
(11, 'sysadmin', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `app_building`
--

DROP TABLE IF EXISTS `app_building`;
CREATE TABLE IF NOT EXISTS `app_building` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(45) DEFAULT NULL,
  `building_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `app_building`
--

TRUNCATE TABLE `app_building`;
-- --------------------------------------------------------

--
-- Table structure for table `app_modules`
--

DROP TABLE IF EXISTS `app_modules`;
CREATE TABLE IF NOT EXISTS `app_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `attribute` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Truncate table before insert `app_modules`
--

TRUNCATE TABLE `app_modules`;
--
-- Dumping data for table `app_modules`
--

INSERT INTO `app_modules` (`id`, `name`, `description`, `attribute`, `status`, `created`, `created_by`) VALUES
(1, 'Thoi gian', 'fewwe', 'thoigian', 0, '2015-05-17 12:05:32', 21),
(2, 'Bang thong', 'qdad', 'bangthong', 0, '2015-05-17 14:05:19', 21);

-- --------------------------------------------------------

--
-- Table structure for table `app_orders`
--

DROP TABLE IF EXISTS `app_orders`;
CREATE TABLE IF NOT EXISTS `app_orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `sumtotal` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `app_orders`
--

TRUNCATE TABLE `app_orders`;
--
-- Dumping data for table `app_orders`
--

INSERT INTO `app_orders` (`orderid`, `customerid`, `orderdate`, `status`, `sumtotal`) VALUES
(1, 1, '2015-05-15 00:00:00', 1, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `app_order_details`
--

DROP TABLE IF EXISTS `app_order_details`;
CREATE TABLE IF NOT EXISTS `app_order_details` (
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `unitprice` decimal(18,2) NOT NULL DEFAULT '0.00',
  `quantity` smallint(2) NOT NULL DEFAULT '1',
  `discount` double(8,0) NOT NULL DEFAULT '0',
  `total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`orderid`,`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `app_order_details`
--

TRUNCATE TABLE `app_order_details`;
-- --------------------------------------------------------

--
-- Table structure for table `app_products`
--

DROP TABLE IF EXISTS `app_products`;
CREATE TABLE IF NOT EXISTS `app_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `unit` text,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Truncate table before insert `app_products`
--

TRUNCATE TABLE `app_products`;
--
-- Dumping data for table `app_products`
--

INSERT INTO `app_products` (`id`, `name`, `category`, `price`, `unit`, `created`, `created_by`) VALUES
(1, 'Packet 1', 7, 60000.00, 'VND', NULL, NULL),
(2, 'Packet 2', 7, 60000.00, 'VND', NULL, NULL),
(3, 'Packet 3', 8, 60000.00, 'VND', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_product_categories`
--

DROP TABLE IF EXISTS `app_product_categories`;
CREATE TABLE IF NOT EXISTS `app_product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Truncate table before insert `app_product_categories`
--

TRUNCATE TABLE `app_product_categories`;
--
-- Dumping data for table `app_product_categories`
--

INSERT INTO `app_product_categories` (`id`, `name`, `description`, `created`, `created_by`) VALUES
(6, 'Category 1', 'khong co gi', '0000-00-00 00:00:00', 0),
(7, 'Category 2', 'asdasdasd', '0000-00-00 00:00:00', 0),
(8, 'Category 3', 'adsdadasdd', '0000-00-00 00:00:00', 0),
(11, 'Category 4', 'asdasd', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
CREATE TABLE IF NOT EXISTS `app_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `building` int(11) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `activate` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `packet` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Truncate table before insert `app_users`
--

TRUNCATE TABLE `app_users`;
--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id`, `username`, `password`, `fullname`, `email`, `phone`, `building`, `room`, `activate`, `created`, `created_by`, `packet`) VALUES
(1, 'sysadmin', '380a9e7e1e616ab0d004c61ef2125612', 'Nguyen Minh Hieu', 'hieunguyenminh.93@gmail.com', '01642219419', NULL, NULL, 1, '2015-05-17 01:00:00', 1, 1),
(2, 'free_P9rol', '3e887d79301b851b7bac95df95e0fdc3', 'Auto Register', 'contact@freewifi.vn', NULL, NULL, NULL, 1, '2015-05-18 00:00:00', NULL, 1),
(3, 'free_qUVhb', 'e6bf3e50c8d764b397fc1783820836dc', 'Auto Register', 'contact@freewifi.vn', NULL, NULL, NULL, 1, '2015-05-18 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nas`
--

DROP TABLE IF EXISTS `nas`;
CREATE TABLE IF NOT EXISTS `nas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `server` varchar(64) DEFAULT NULL,
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client',
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `nas`
--

TRUNCATE TABLE `nas`;
-- --------------------------------------------------------

--
-- Table structure for table `radacct`
--

DROP TABLE IF EXISTS `radacct`;
CREATE TABLE IF NOT EXISTS `radacct` (
  `radacctid` bigint(21) NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) DEFAULT '',
  `nasipaddress` varchar(15) NOT NULL DEFAULT '',
  `nasportid` varchar(50) DEFAULT NULL,
  `nasporttype` varchar(32) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctupdatetime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctinterval` int(12) DEFAULT NULL,
  `acctsessiontime` int(12) unsigned DEFAULT NULL,
  `acctauthentic` varchar(32) DEFAULT NULL,
  `connectinfo_start` varchar(50) DEFAULT NULL,
  `connectinfo_stop` varchar(50) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL DEFAULT '',
  `callingstationid` varchar(50) NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) NOT NULL DEFAULT '',
  `servicetype` varchar(32) DEFAULT NULL,
  `framedprotocol` varchar(32) DEFAULT NULL,
  `framedipaddress` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`radacctid`),
  UNIQUE KEY `acctuniqueid` (`acctuniqueid`),
  KEY `username` (`username`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctinterval` (`acctinterval`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `nasipaddress` (`nasipaddress`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Truncate table before insert `radacct`
--

TRUNCATE TABLE `radacct`;
--
-- Dumping data for table `radacct`
--

INSERT INTO `radacct` (`radacctid`, `acctsessionid`, `acctuniqueid`, `username`, `groupname`, `realm`, `nasipaddress`, `nasportid`, `nasporttype`, `acctstarttime`, `acctupdatetime`, `acctstoptime`, `acctinterval`, `acctsessiontime`, `acctauthentic`, `connectinfo_start`, `connectinfo_stop`, `acctinputoctets`, `acctoutputoctets`, `calledstationid`, `callingstationid`, `acctterminatecause`, `servicetype`, `framedprotocol`, `framedipaddress`) VALUES
(1, '55271a9b00000001', 'd31d3bbc4637be1ceafcef3c4efb5513', 'Huy', '', '', '10.1.0.1', '1', 'Wireless-802.11', '2015-05-07 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 257, '', '', '', 433166, 82563, '14-DA-E9-AC-49-F2', '00-21-6A-59-D9-DA', 'User-Request', '', '', '10.1.0.2'),
(2, '5527d13600000001', '4caff22141b8b10da927a2cfcbcd6fe4', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '2015-05-12 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 241300, '', '', '', 8558258, 1565082, '14-DA-E9-AC-49-F2', 'C0-18-85-13-CC-F0', 'User-Request', '', '', '10.1.0.3'),
(3, '552925c100000001', 'd7967754be08ce790d5cf6e16a87dd18', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 192, '', '', '', 37198, 42871, '14-DA-E9-AC-49-F2', '00-21-6A-59-D9-DA', 'NAS-Reboot', '', '', '10.1.0.2'),
(4, '5529274e00000001', 'b8170fbd9611bc236e3ef0480bb0f501', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 24, '', '', '', 1730847, 130158, '14-DA-E9-AC-49-F2', '00-21-6A-59-D9-DA', 'User-Request', '', '', '10.1.0.2'),
(5, '55292fca00000001', 'ac49f9af0eb76283659308a1578fbc73', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 4963, '', '', '', 153964105, 11697578, '14-DA-E9-AC-49-F2', '00-21-6A-59-D9-DA', 'NAS-Reboot', '', '', '10.1.0.3'),
(6, '552a791b00000002', '1af42609259d2dec5368d517d4721fb3', 'hieu', '', '', '10.1.0.1', '2', 'Wireless-802.11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 359, '', '', '', 1230393, 209102, '14-DA-E9-AC-49-F2', 'C0-18-85-13-CC-F0', 'User-Request', '', '', '10.1.0.3'),
(7, '5532850800000001', 'a792eab362dd371b26cad0dac0837640', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 591, '', '', '', 3782180, 434341, '14-DA-E9-AC-49-F2', 'F0-79-59-49-F5-55', 'User-Request', '', '', '10.1.0.2'),
(8, '5532876300000001', 'b2280fb590857cc7b82c33fe9160411e', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 5, '', '', '', 9013, 3407, '14-DA-E9-AC-49-F2', 'F0-79-59-49-F5-55', 'User-Request', '', '', '10.1.0.2'),
(9, '5532879700000001', '19999a7d2f9084815974ba86ee272c47', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 267, '', '', '', 724042, 235932, '14-DA-E9-AC-49-F2', 'F0-79-59-49-F5-55', 'User-Request', '', '', '10.1.0.2'),
(10, '5532882400000002', '8e669728f6d81131ef9d7c28862617d1', 'admin', '', '', '10.1.0.1', '2', 'Wireless-802.11', '2015-05-16 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 156, '', '', '', 605759, 142517, '14-DA-E9-AC-49-F2', '38-59-F9-88-0E-43', 'User-Request', '', '', '10.1.0.3'),
(11, '553927e500000001', '0b0ca6a0c7e2136810cc1108bec519bf', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '2015-04-24 00:13:43', '2015-04-24 00:18:43', '2015-04-24 00:21:39', 300, 476, '', '', '', 274639, 71779, '14-DA-E9-AC-49-F2', 'F0-79-59-49-F5-55', 'NAS-Reboot', '', '', '10.1.0.2'),
(12, '55392a2f00000001', '9b9b85ab2f40543f404fb2787fbb7b66', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '2015-04-24 00:25:40', '2015-04-24 00:25:40', '2015-04-24 00:28:05', NULL, 145, '', '', '', 139731, 27504, '14-DA-E9-AC-49-F2', '38-59-F9-88-0E-43', 'NAS-Reboot', '', '', '10.1.0.3'),
(13, '5553350700000001', 'c03fc4b3dafccdd543e3efe20d714dd6', 'hieu', '', '', '10.1.0.1', '1', 'Wireless-802.11', '2015-05-13 18:27:27', '2015-05-13 18:27:27', '2015-05-13 18:28:23', NULL, 56, '', '', '', 0, 37590, '14-DA-E9-AC-49-F2', 'F0-79-59-49-F5-55', 'NAS-Reboot', '', '', '10.1.0.2'),
(14, '5559d17900000001', '91bf868f49524c34e04c3efdbdcb5915', 'sysadmin', '', '', '10.1.0.1', '1', 'Wireless-802.11', '2015-05-18 18:49:00', '2015-05-18 18:49:00', '2015-05-18 18:49:19', NULL, 19, '', '', '', 75790, 55853, '14-DA-E9-AC-49-F2', 'F0-79-59-49-F5-55', 'User-Request', '', '', '10.1.0.2');

-- --------------------------------------------------------

--
-- Table structure for table `radcheck`
--

DROP TABLE IF EXISTS `radcheck`;
CREATE TABLE IF NOT EXISTS `radcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `radcheck`
--

TRUNCATE TABLE `radcheck`;
--
-- Dumping data for table `radcheck`
--

INSERT INTO `radcheck` (`id`, `username`, `attribute`, `op`, `value`) VALUES
(1, 'sysadmin', 'Md5-Password', ':=', '380a9e7e1e616ab0d004c61ef2125612');

-- --------------------------------------------------------

--
-- Table structure for table `radgroupcheck`
--

DROP TABLE IF EXISTS `radgroupcheck`;
CREATE TABLE IF NOT EXISTS `radgroupcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `radgroupcheck`
--

TRUNCATE TABLE `radgroupcheck`;
-- --------------------------------------------------------

--
-- Table structure for table `radgroupreply`
--

DROP TABLE IF EXISTS `radgroupreply`;
CREATE TABLE IF NOT EXISTS `radgroupreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `radgroupreply`
--

TRUNCATE TABLE `radgroupreply`;
-- --------------------------------------------------------

--
-- Table structure for table `radpostauth`
--

DROP TABLE IF EXISTS `radpostauth`;
CREATE TABLE IF NOT EXISTS `radpostauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL DEFAULT '',
  `reply` varchar(32) NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

--
-- Truncate table before insert `radpostauth`
--

TRUNCATE TABLE `radpostauth`;
--
-- Dumping data for table `radpostauth`
--

INSERT INTO `radpostauth` (`id`, `username`, `pass`, `reply`, `authdate`) VALUES
(1, 'hieu', 'hieu1234', 'Access-Reject', '2015-04-07 11:11:37'),
(2, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-07 11:12:53'),
(3, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-07 13:06:40'),
(4, 'hieu', '0x008215ba056b2e787171008b3cbed2f6c3', 'Access-Reject', '2015-04-09 14:44:33'),
(5, 'hieu', '0x003ff8aa4855912bd440ca874023a123cc', 'Access-Reject', '2015-04-09 14:44:36'),
(6, 'hieu', '0x00fe8b3e3d33acb22fa5e63d3d45bc8ba3', 'Access-Reject', '2015-04-09 14:44:47'),
(7, 'hieu', '0x00c62cd14c0029c4e0170f4214d93d3a77', 'Access-Reject', '2015-04-09 14:45:00'),
(8, 'hieu', '0x00d68be423930f3c3b3fe4ea5b45a29023', 'Access-Reject', '2015-04-09 14:52:30'),
(9, 'hieu', '0x008994533ef3cf72f471d3e4f44715702d', 'Access-Reject', '2015-04-09 18:20:01'),
(10, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:09:22'),
(11, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:09:23'),
(12, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:09:45'),
(13, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:09:47'),
(14, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:09:48'),
(15, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:16:26'),
(16, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:16:33'),
(17, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:16:36'),
(18, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:16:47'),
(19, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:16:49'),
(20, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:16:52'),
(21, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:18:43'),
(22, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:18:45'),
(23, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:31:39'),
(24, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:31:39'),
(25, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:31:40'),
(26, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:31:41'),
(27, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:31:42'),
(28, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:31:43'),
(29, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:31:46'),
(30, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:34:43'),
(31, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:34:46'),
(32, '00-21-6A-59-D9-DA', '00-21-6A-59-D9-DA', 'Access-Reject', '2015-04-09 19:34:55'),
(33, '00-21-6A-59-D9-DA', '00-21-6A-59-D9-DA', 'Access-Reject', '2015-04-09 19:34:59'),
(34, '00-21-6A-59-D9-DA', '00-21-6A-59-D9-DA', 'Access-Reject', '2015-04-09 19:35:07'),
(35, '00-21-6A-59-D9-DA', '00-21-6A-59-D9-DA', 'Access-Reject', '2015-04-09 19:35:07'),
(36, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:36:09'),
(37, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:36:12'),
(38, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:36:39'),
(39, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:39:02'),
(40, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:40:55'),
(41, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:40:58'),
(42, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:41:25'),
(43, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:41:27'),
(44, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:41:35'),
(45, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:41:36'),
(46, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:41:37'),
(47, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:41:38'),
(48, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:41:39'),
(49, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:41:42'),
(50, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:43:56'),
(51, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:43:59'),
(52, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:45:35'),
(53, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:45:38'),
(54, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:46:36'),
(55, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:47:50'),
(56, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:47:51'),
(57, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:51:36'),
(58, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:53:14'),
(59, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:57:05'),
(60, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:57:31'),
(61, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:57:31'),
(62, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:57:32'),
(63, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:57:33'),
(64, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:57:34'),
(65, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:57:37'),
(66, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:58:07'),
(67, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:58:09'),
(68, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:59:25'),
(69, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:59:26'),
(70, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:59:27'),
(71, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:59:28'),
(72, '74-E5-43-61-BD-05', '74-E5-43-61-BD-05', 'Access-Reject', '2015-04-09 19:59:29'),
(73, 'hieu', '0x007f1cd8c7e444098a75e9b8dfe898c278', 'Access-Reject', '2015-04-09 20:18:13'),
(74, 'ghgh', '0x00a63805f19161490b01032078811772a6', 'Access-Reject', '2015-04-09 20:34:29'),
(75, 'hieu', '0x00a08392a8829ab3a8470b513abda5f5c8', 'Access-Reject', '2015-04-10 00:05:23'),
(76, 'hieu', '0x00bd95732a2133c5053d2a5befab7bef58', 'Access-Reject', '2015-04-10 00:13:21'),
(77, 'hieu', '0x000f633f0ab1161efa3ea759d22fa3da34', 'Access-Reject', '2015-04-10 00:13:56'),
(78, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-10 00:35:04'),
(79, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-10 13:34:04'),
(80, 'fgfg', '', 'Access-Reject', '2015-04-10 14:23:02'),
(81, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-11 13:47:45'),
(82, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-11 13:53:55'),
(83, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-11 14:29:57'),
(84, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-12 13:56:32'),
(85, 'hieu', '0x004917b48f4484a0b0b24d0fcdc7fb614e', 'Access-Reject', '2015-04-18 15:48:25'),
(86, 'hieu', '0x004917b48f4484a0b0b24d0fcdc7fb614e', 'Access-Reject', '2015-04-18 15:50:04'),
(87, 'hieu', '0x001c3eace813c9c95b44502ae76df89593', 'Access-Reject', '2015-04-18 15:50:23'),
(88, 'hieu', '0x005764a94aeef8f90bde7a6d4f94077ea9', 'Access-Reject', '2015-04-18 15:50:41'),
(89, 'hieu', '0x00d09c4f39d50d9d7759637973e69e29db', 'Access-Reject', '2015-04-18 15:51:31'),
(90, 'hieu', '0x0063c279fb5f62944a656bf3e5812eaf7e', 'Access-Reject', '2015-04-18 16:09:28'),
(91, 'hieu', '0x00f6c90cc1c06b8d2776de95bccd82a4ed', 'Access-Reject', '2015-04-18 16:12:10'),
(92, 'hieu', '0x00b8b13bd9955fcce75b869ced7fd094f3', 'Access-Reject', '2015-04-18 16:19:36'),
(93, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-18 16:23:47'),
(94, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-18 16:34:25'),
(95, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-18 16:35:23'),
(96, 'admin', '1234', 'Access-Accept', '2015-04-18 16:37:18'),
(97, 'hieu', 'hieu1234', 'Access-Reject', '2015-04-18 16:40:34'),
(98, 'hieu', 'hieu1234', 'Access-Reject', '2015-04-23 17:07:08'),
(99, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-23 17:13:43'),
(100, 'hieu', 'hieu1234', 'Access-Accept', '2015-04-23 17:25:40'),
(101, 'hieu', 'hieu1234', 'Access-Accept', '2015-05-13 11:27:28'),
(102, 'hieu', 'hieu1234', 'Access-Accept', '2015-05-16 06:00:26'),
(103, 'hoang', 'hoang3010', 'Access-Accept', '2015-05-16 06:06:59'),
(104, 'hieu', '', 'Access-Reject', '2015-05-18 10:28:17'),
(105, 'hieu', 'hieu1234', 'Access-Reject', '2015-05-18 10:28:32'),
(106, 'hieu', 'hieu1234', 'Access-Reject', '2015-05-18 10:43:12'),
(107, 'hieu', 'hieu1234', 'Access-Reject', '2015-05-18 10:51:04'),
(108, 'hieu', 'hieu1234', 'Access-Reject', '2015-05-18 11:03:16'),
(109, 'hieu', 'hieu1234', 'Access-Reject', '2015-05-18 11:05:22'),
(110, 'hieu', 'hieu1234', 'Access-Reject', '2015-05-18 11:13:20'),
(111, 'hieu', 'hieu1234', 'Access-Reject', '2015-05-18 11:13:26'),
(112, 'hieu', 'hieu1234', 'Access-Reject', '2015-05-18 11:13:30'),
(113, 'sysadmin', '1234', 'Access-Reject', '2015-05-18 11:48:08'),
(114, 'sysadmin', 'hieu1234', 'Access-Accept', '2015-05-18 11:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `radreply`
--

DROP TABLE IF EXISTS `radreply`;
CREATE TABLE IF NOT EXISTS `radreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `radreply`
--

TRUNCATE TABLE `radreply`;
-- --------------------------------------------------------

--
-- Table structure for table `radusergroup`
--

DROP TABLE IF EXISTS `radusergroup`;
CREATE TABLE IF NOT EXISTS `radusergroup` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1',
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `radusergroup`
--

TRUNCATE TABLE `radusergroup`;
--
-- Dumping data for table `radusergroup`
--

INSERT INTO `radusergroup` (`username`, `groupname`, `priority`) VALUES
('hieu', 'administrator', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
