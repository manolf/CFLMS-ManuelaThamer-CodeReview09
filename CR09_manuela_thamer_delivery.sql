-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 02:49 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery`
--
CREATE DATABASE IF NOT EXISTS `delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressID` int(11) NOT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `Zipcode` int(4) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressID`, `Street`, `Zipcode`, `city`) VALUES
(1, 'Rosensteingasse 7', 1170, 'Wien'),
(2, 'Dietrichgasse 12', 1030, 'Wien'),
(3, 'Markomannenstraße 32', 1220, 'Wien'),
(4, 'Hiezingerkai 66', 1130, 'Wien'),
(5, 'Westbahnstraße 10/4', 1070, 'Wien'),
(6, 'Jurekgasse 8', 1150, 'Wien'),
(7, 'Pilzgasse 67/1', 1210, 'Wien'),
(8, 'Hoher Markt 1', 1010, 'Wien'),
(9, 'Baumgasse 33', 1030, 'Wien'),
(10, 'Landstraße 11/4', 1030, 'Wien'),
(11, 'Rochusgasse 3', 1030, 'Wien'),
(12, 'Pratergasse 22', 1020, 'Wien'),
(13, 'Pilgramgasse 55', 1050, 'Wien'),
(14, 'Simmeringerstraße 55', 1110, 'Wien'),
(15, 'Bahnhofstrasse 22', 1120, 'Wien'),
(16, 'Stephansplatz 44/1/3', 1010, 'Wien'),
(17, 'Kettenbrückengasse 2/1/3', 1060, 'Wien'),
(18, 'Westbahnhof 1', 1150, 'Wien');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(3) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addressID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `firstname`, `lastname`, `email`, `phone`, `addressID`) VALUES
(1, 'Marius', 'Rosegger', 'rosegger@hotmail.com', '069912129898', 1),
(2, 'Anton', 'Mirnegg', 'mirnegg@gmail.com', '068012129898', 9),
(3, 'Simone', 'Benito', 'ciao@gmail.com', '066412129898', 2);

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `deliverydetailsID` int(11) NOT NULL,
  `costs` float DEFAULT NULL,
  `recipientID` int(11) DEFAULT NULL,
  `shippingstatus` enum('accepted','distribution process','on delivery','delivered') DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `ProcessingDate` date DEFAULT NULL,
  `HandOverDate` date DEFAULT NULL,
  `depositDate` date DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliverydetails`
--

INSERT INTO `deliverydetails` (`deliverydetailsID`, `costs`, `recipientID`, `shippingstatus`, `deliveryDate`, `ProcessingDate`, `HandOverDate`, `depositDate`, `itemID`) VALUES
(1, 2, 1, 'distribution process', NULL, '2020-07-08', NULL, NULL, 1),
(2, 2, 1, 'distribution process', NULL, '2020-07-08', NULL, '2020-07-07', 1),
(3, 4.5, 2, 'distribution process', NULL, '2020-07-08', NULL, '2020-07-07', 2),
(4, 2.5, 3, 'on delivery', NULL, '2020-07-09', '2020-07-09', '2020-07-07', 3),
(5, 7.5, 4, 'delivered', '2020-07-10', '2020-07-08', '2020-07-09', '2020-07-07', 4),
(7, 2, 1, 'distribution process', NULL, '2020-07-08', NULL, '2020-07-07', 6);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `addressID` int(11) DEFAULT NULL,
  `stationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `firstname`, `lastname`, `addressID`, `stationID`) VALUES
(1, 'Max', 'Pramreiter', 10, 4),
(2, 'Evelyn', 'Unterlechner', 11, 4),
(3, 'Kingasha', 'Dutta', 12, 4),
(4, 'Marco', 'Schreiner', 14, 1),
(5, 'Lisa', 'Over', 15, 2),
(6, 'Otto', 'Heimböck', 16, 3);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `medium` enum('letter','package') DEFAULT 'letter',
  `weight` float DEFAULT NULL,
  `priority` tinyint(1) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `stationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemID`, `medium`, `weight`, `priority`, `customerID`, `stationID`) VALUES
(1, 'letter', 22, 1, 1, 1),
(2, 'package', 33, 2, 2, 2),
(3, 'letter', 15, 3, 2, 2),
(4, 'package', 88, 1, 3, 3),
(6, 'letter', 27, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `packagedetail`
--

CREATE TABLE `packagedetail` (
  `packageDetailID` int(11) NOT NULL,
  `itemID` int(11) DEFAULT NULL,
  `itemnr` int(2) DEFAULT NULL,
  `setID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packagedetail`
--

INSERT INTO `packagedetail` (`packageDetailID`, `itemID`, `itemnr`, `setID`) VALUES
(1, 1, 1, 1150),
(2, 6, 2, 1150),
(4, 2, 3, 1150),
(5, 3, 1, 1130),
(6, 4, 1, 1010);

-- --------------------------------------------------------

--
-- Table structure for table `packageset`
--

CREATE TABLE `packageset` (
  `setID` int(11) NOT NULL,
  `stationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packageset`
--

INSERT INTO `packageset` (`setID`, `stationID`) VALUES
(1220, 1),
(1130, 2),
(1010, 3),
(1030, 4),
(1050, 5),
(1150, 6);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipientID` int(3) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `addressID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipientID`, `firstname`, `lastname`, `addressID`) VALUES
(1, 'Peter', 'Langer', 16),
(2, 'Petra', 'Hammerfahr', 5),
(3, 'Georg', 'Weinzierl', 6),
(4, 'Georgina', 'Nietzsche', 8);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shippingID` int(11) NOT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `recipientID` int(11) DEFAULT NULL,
  `setID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shippingID`, `employeeID`, `recipientID`, `setID`) VALUES
(1, 5, 3, 1130),
(2, 6, 1, 1010);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `stationID` int(11) NOT NULL,
  `addressID` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`stationID`, `addressID`, `name`) VALUES
(1, 3, 'Delivery 22'),
(2, 4, 'Delivery 13'),
(3, 8, 'Delivery 1'),
(4, 9, 'Delivery3'),
(5, 13, 'Delivery5'),
(6, 18, 'Delivery15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `addressID` (`addressID`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`deliverydetailsID`),
  ADD KEY `recipientID` (`recipientID`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `stationID` (`stationID`),
  ADD KEY `addressID` (`addressID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `stationID` (`stationID`);

--
-- Indexes for table `packagedetail`
--
ALTER TABLE `packagedetail`
  ADD PRIMARY KEY (`packageDetailID`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `setID` (`setID`);

--
-- Indexes for table `packageset`
--
ALTER TABLE `packageset`
  ADD PRIMARY KEY (`setID`),
  ADD KEY `stationID` (`stationID`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipientID`),
  ADD KEY `addressID` (`addressID`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shippingID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `recipientID` (`recipientID`),
  ADD KEY `setID` (`setID`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`stationID`),
  ADD KEY `addressID` (`addressID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `deliverydetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `packagedetail`
--
ALTER TABLE `packagedetail`
  MODIFY `packageDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `packageset`
--
ALTER TABLE `packageset`
  MODIFY `setID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1221;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipientID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shippingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `stationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`);

--
-- Constraints for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD CONSTRAINT `deliverydetails_ibfk_1` FOREIGN KEY (`recipientID`) REFERENCES `recipient` (`recipientID`),
  ADD CONSTRAINT `deliverydetails_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`stationID`) REFERENCES `station` (`stationID`),
  ADD CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`stationID`) REFERENCES `station` (`stationID`);

--
-- Constraints for table `packagedetail`
--
ALTER TABLE `packagedetail`
  ADD CONSTRAINT `packagedetail_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`),
  ADD CONSTRAINT `packagedetail_ibfk_2` FOREIGN KEY (`setID`) REFERENCES `packageset` (`setID`);

--
-- Constraints for table `packageset`
--
ALTER TABLE `packageset`
  ADD CONSTRAINT `packageset_ibfk_2` FOREIGN KEY (`stationID`) REFERENCES `station` (`stationID`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_3` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `shipping_ibfk_2` FOREIGN KEY (`recipientID`) REFERENCES `recipient` (`recipientID`),
  ADD CONSTRAINT `shipping_ibfk_4` FOREIGN KEY (`setID`) REFERENCES `packageset` (`setID`);

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `station_ibfk_4` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
