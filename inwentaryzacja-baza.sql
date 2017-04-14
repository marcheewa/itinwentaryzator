-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2017 at 11:17 AM
-- Server version: 5.7.17-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inwentaryzacja`
--

-- --------------------------------------------------------

--
-- Table structure for table `computers`
--

CREATE TABLE `computers` (
  `computer_id` int(3) NOT NULL,
  `asset_id` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `computer_name` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `computer_type_id` int(2) DEFAULT NULL,
  `computer_model_id` int(3) DEFAULT NULL,
  `serial_number` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `os_id` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `computers_software`
--

CREATE TABLE `computers_software` (
  `id` varchar(3) COLLATE utf8_polish_ci DEFAULT NULL,
  `computer_id` int(3) DEFAULT NULL,
  `software_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `computer_models`
--

CREATE TABLE `computer_models` (
  `computer_model_id` int(3) NOT NULL,
  `computer_model_name` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `licences`
--

CREATE TABLE `licences` (
  `licence_id` int(3) NOT NULL,
  `purchased` date DEFAULT NULL,
  `licence_type` varchar(12) COLLATE utf8_polish_ci DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `serial_nr` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `inventory_nr` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `licences_software`
--

CREATE TABLE `licences_software` (
  `id` int(3) DEFAULT NULL,
  `software_id` int(3) DEFAULT NULL,
  `licence_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monitors`
--

CREATE TABLE `monitors` (
  `monitor_id` int(3) NOT NULL,
  `asset_id` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `monitor_model_id` int(3) DEFAULT NULL,
  `serial_number` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monitor_models`
--

CREATE TABLE `monitor_models` (
  `monitor_model_id` int(3) NOT NULL,
  `monitor_model_name` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `osnames`
--

CREATE TABLE `osnames` (
  `os_id` int(2) NOT NULL,
  `os_name` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `osver_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `osversions`
--

CREATE TABLE `osversions` (
  `osver_id` int(2) NOT NULL,
  `os_version` varchar(36) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

CREATE TABLE `software` (
  `software_id` int(3) NOT NULL,
  `software_name` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `software_version` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(5) NOT NULL,
  `firstname` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(70) COLLATE utf8_polish_ci DEFAULT NULL,
  `join_date` varchar(16) COLLATE utf8_polish_ci DEFAULT NULL,
  `departament_id` int(2) NOT NULL,
  `location_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `user_assets`
--

CREATE TABLE `user_assets` (
  `id` int(3) NOT NULL,
  `user_id` int(5) DEFAULT NULL,
  `computer_id` int(3) DEFAULT NULL,
  `monitor_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`computer_id`),
  ADD KEY `computer_model_id` (`computer_model_id`),
  ADD KEY `os_id` (`os_id`);

--
-- Indexes for table `computers_software`
--
ALTER TABLE `computers_software`
  ADD KEY `computer_id` (`computer_id`),
  ADD KEY `software_id` (`software_id`);

--
-- Indexes for table `computer_models`
--
ALTER TABLE `computer_models`
  ADD PRIMARY KEY (`computer_model_id`);

--
-- Indexes for table `licences`
--
ALTER TABLE `licences`
  ADD PRIMARY KEY (`licence_id`);

--
-- Indexes for table `licences_software`
--
ALTER TABLE `licences_software`
  ADD KEY `software_id` (`software_id`),
  ADD KEY `licence_id` (`licence_id`);

--
-- Indexes for table `monitors`
--
ALTER TABLE `monitors`
  ADD PRIMARY KEY (`monitor_id`),
  ADD KEY `monitor_model_id` (`monitor_model_id`);

--
-- Indexes for table `monitor_models`
--
ALTER TABLE `monitor_models`
  ADD PRIMARY KEY (`monitor_model_id`);

--
-- Indexes for table `osnames`
--
ALTER TABLE `osnames`
  ADD PRIMARY KEY (`os_id`),
  ADD KEY `osnames_ibfk_1` (`osver_id`);

--
-- Indexes for table `osversions`
--
ALTER TABLE `osversions`
  ADD PRIMARY KEY (`osver_id`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`software_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `firstname` (`firstname`,`lastname`);

--
-- Indexes for table `user_assets`
--
ALTER TABLE `user_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `computer_id` (`computer_id`),
  ADD KEY `monitor_id` (`monitor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `computers`
--
ALTER TABLE `computers`
  MODIFY `computer_id` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `monitors`
--
ALTER TABLE `monitors`
  MODIFY `monitor_id` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `osversions`
--
ALTER TABLE `osversions`
  MODIFY `osver_id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `computers`
--
ALTER TABLE `computers`
  ADD CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`computer_model_id`) REFERENCES `computer_models` (`computer_model_id`),
  ADD CONSTRAINT `computers_ibfk_2` FOREIGN KEY (`os_id`) REFERENCES `osnames` (`os_id`);

--
-- Constraints for table `computers_software`
--
ALTER TABLE `computers_software`
  ADD CONSTRAINT `computers_software_ibfk_1` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`computer_id`),
  ADD CONSTRAINT `computers_software_ibfk_2` FOREIGN KEY (`software_id`) REFERENCES `software` (`software_id`);

--
-- Constraints for table `licences_software`
--
ALTER TABLE `licences_software`
  ADD CONSTRAINT `licences_software_ibfk_1` FOREIGN KEY (`software_id`) REFERENCES `software` (`software_id`),
  ADD CONSTRAINT `licences_software_ibfk_2` FOREIGN KEY (`licence_id`) REFERENCES `licences` (`licence_id`);

--
-- Constraints for table `monitors`
--
ALTER TABLE `monitors`
  ADD CONSTRAINT `monitors_ibfk_1` FOREIGN KEY (`monitor_model_id`) REFERENCES `monitor_models` (`monitor_model_id`);

--
-- Constraints for table `osnames`
--
ALTER TABLE `osnames`
  ADD CONSTRAINT `osnames_ibfk_1` FOREIGN KEY (`osver_id`) REFERENCES `osversions` (`osver_id`);

--
-- Constraints for table `user_assets`
--
ALTER TABLE `user_assets`
  ADD CONSTRAINT `user_assets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_assets_ibfk_2` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`computer_id`),
  ADD CONSTRAINT `user_assets_ibfk_3` FOREIGN KEY (`monitor_id`) REFERENCES `monitors` (`monitor_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
