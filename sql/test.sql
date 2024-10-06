-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 02:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` smallint(6) NOT NULL,
  `licensePlate` varchar(8) DEFAULT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `year` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `licensePlate`, `brand`, `model`, `year`, `description`, `price`) VALUES
(1, 'BMW-123', 'Bmw', 'M3', '0000-00-00', 'Fuel Consumption. 11.8 (Manual City), 7.7 (Manual Highway),3.2L L6 DOHC 24 valves, 240 hp @ 6000 rpm, 5 speed manual, Coupe', 23000);

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE `day` (
  `id` mediumint(9) NOT NULL,
  `_date` datetime NOT NULL,
  `type` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`id`, `_date`, `type`) VALUES
(1, '0000-00-00 00:00:00', 1),
(2, '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `daytype`
--

CREATE TABLE `daytype` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `price` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `daytype`
--

INSERT INTO `daytype` (`id`, `name`, `description`, `price`) VALUES
(1, 'Nyílt pályanap', 'Egész napos autózás.', 18000),
(2, 'Élményautózós pályanap', 'Egész napos autózás.', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `proxy`
--

CREATE TABLE `proxy` (
  `id` mediumint(9) NOT NULL,
  `userId` mediumint(9) DEFAULT NULL,
  `dayId` mediumint(9) NOT NULL,
  `carId` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `proxy`
--

INSERT INTO `proxy` (`id`, `userId`, `dayId`, `carId`) VALUES
(1, 1, 1, NULL),
(2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `_user`
--

CREATE TABLE `_user` (
  `id` mediumint(9) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `birthDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `_user`
--

INSERT INTO `_user` (`id`, `firstName`, `lastName`, `email`, `password`, `birthDate`) VALUES
(1, 'Teszt', 'Elek', 'teszt.elek@example.com', 'TesztElek123', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `licensePlate` (`licensePlate`);

--
-- Indexes for table `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `daytype`
--
ALTER TABLE `daytype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proxy`
--
ALTER TABLE `proxy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `dayId` (`dayId`),
  ADD KEY `carId` (`carId`);

--
-- Indexes for table `_user`
--
ALTER TABLE `_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `day`
--
ALTER TABLE `day`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `daytype`
--
ALTER TABLE `daytype`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proxy`
--
ALTER TABLE `proxy`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `_user`
--
ALTER TABLE `_user`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `day`
--
ALTER TABLE `day`
  ADD CONSTRAINT `day_ibfk_1` FOREIGN KEY (`type`) REFERENCES `daytype` (`id`);

--
-- Constraints for table `proxy`
--
ALTER TABLE `proxy`
  ADD CONSTRAINT `proxy_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `_user` (`id`),
  ADD CONSTRAINT `proxy_ibfk_2` FOREIGN KEY (`dayId`) REFERENCES `day` (`id`),
  ADD CONSTRAINT `proxy_ibfk_3` FOREIGN KEY (`carId`) REFERENCES `cars` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
