-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2015 at 11:50 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `USERNAME` varchar(25) NOT NULL,
  `PASSWORD` varchar(25) NOT NULL,
  `CART` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `MYSTERY` varchar(40) NOT NULL,
  `FICTION` varchar(40) NOT NULL,
  `NONFICTION` varchar(40) NOT NULL,
  `HORROR` varchar(40) NOT NULL,
  `ADULT` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`MYSTERY`, `FICTION`, `NONFICTION`, `HORROR`, `ADULT`) VALUES
('the girl with the dragon tattoo', 'matterhorn', 'into the wild', 'the walking dead', 'fifty shades of grey');

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE IF NOT EXISTS `detail` (
  `BOOKNAME` varchar(40) NOT NULL,
  `PRICE` varchar(40) NOT NULL,
  `AUTHOR` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`BOOKNAME`, `PRICE`, `AUTHOR`) VALUES
('into the wild', '12.50', 'john krauker'),
('fifty shades of grey', '5.99', 'e.l. james'),
('the girl with the dragon tattoo', '14.50', 'stieg larrson'),
('matterhorn', '16.25', 'karl marlentes'),
('the walking dead', '4.50', 'robert kirkman');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `address` varchar(25) NOT NULL,
  `credit_card_info` varchar(25) NOT NULL,
  `store_credit` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`username`, `password`, `first_name`, `last_name`, `address`, `credit_card_info`, `store_credit`) VALUES
('cdamico', 'password', 'Cody', 'Damico', '29588 Peppertwon Rd.', '100000000', '93856382'),
('qwe', 'qew', 'qew', 'qew', 'qew', 'qew', 'qew'),
('cdamico1', 'password', '', '', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
