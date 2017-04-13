-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: inwentaryzacja
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `computer_models`
--

DROP TABLE IF EXISTS `computer_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer_models` (
  `computer_model_id` int(3) NOT NULL,
  `computer_model_name` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`computer_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_models`
--

LOCK TABLES `computer_models` WRITE;
/*!40000 ALTER TABLE `computer_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `computer_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computers` (
  `computer_id` int(3) NOT NULL AUTO_INCREMENT,
  `asset_id` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `computer_name` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `computer_type_id` int(2) DEFAULT NULL,
  `computer_model_id` int(3) DEFAULT NULL,
  `serial_number` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `os_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`computer_id`),
  KEY `computer_model_id` (`computer_model_id`),
  KEY `os_id` (`os_id`),
  CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`computer_model_id`) REFERENCES `computer_models` (`computer_model_id`),
  CONSTRAINT `computers_ibfk_2` FOREIGN KEY (`os_id`) REFERENCES `osnames` (`os_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computers_software`
--

DROP TABLE IF EXISTS `computers_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computers_software` (
  `id` varchar(3) COLLATE utf8_polish_ci DEFAULT NULL,
  `computer_id` int(3) DEFAULT NULL,
  `software_id` int(3) DEFAULT NULL,
  KEY `computer_id` (`computer_id`),
  KEY `software_id` (`software_id`),
  CONSTRAINT `computers_software_ibfk_1` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`computer_id`),
  CONSTRAINT `computers_software_ibfk_2` FOREIGN KEY (`software_id`) REFERENCES `software` (`software_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers_software`
--

LOCK TABLES `computers_software` WRITE;
/*!40000 ALTER TABLE `computers_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `computers_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licences`
--

DROP TABLE IF EXISTS `licences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licences` (
  `licence_id` int(3) NOT NULL,
  `purchased` date DEFAULT NULL,
  `licence_type` varchar(12) COLLATE utf8_polish_ci DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `serial_nr` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `inventory_nr` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`licence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licences`
--

LOCK TABLES `licences` WRITE;
/*!40000 ALTER TABLE `licences` DISABLE KEYS */;
/*!40000 ALTER TABLE `licences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licences_software`
--

DROP TABLE IF EXISTS `licences_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licences_software` (
  `id` int(3) DEFAULT NULL,
  `software_id` int(3) DEFAULT NULL,
  `licence_id` int(3) DEFAULT NULL,
  KEY `software_id` (`software_id`),
  KEY `licence_id` (`licence_id`),
  CONSTRAINT `licences_software_ibfk_1` FOREIGN KEY (`software_id`) REFERENCES `software` (`software_id`),
  CONSTRAINT `licences_software_ibfk_2` FOREIGN KEY (`licence_id`) REFERENCES `licences` (`licence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licences_software`
--

LOCK TABLES `licences_software` WRITE;
/*!40000 ALTER TABLE `licences_software` DISABLE KEYS */;
/*!40000 ALTER TABLE `licences_software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_models`
--

DROP TABLE IF EXISTS `monitor_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_models` (
  `monitor_model_id` int(3) NOT NULL,
  `monitor_model_name` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`monitor_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_models`
--

LOCK TABLES `monitor_models` WRITE;
/*!40000 ALTER TABLE `monitor_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitors`
--

DROP TABLE IF EXISTS `monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitors` (
  `monitor_id` int(3) NOT NULL AUTO_INCREMENT,
  `asset_id` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `monitor_model_id` int(3) DEFAULT NULL,
  `serial_number` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`monitor_id`),
  KEY `monitor_model_id` (`monitor_model_id`),
  CONSTRAINT `monitors_ibfk_1` FOREIGN KEY (`monitor_model_id`) REFERENCES `monitor_models` (`monitor_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitors`
--

LOCK TABLES `monitors` WRITE;
/*!40000 ALTER TABLE `monitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osnames`
--

DROP TABLE IF EXISTS `osnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osnames` (
  `os_id` int(2) NOT NULL,
  `os_name` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`os_id`),
  CONSTRAINT `osnames_ibfk_1` FOREIGN KEY (`os_id`) REFERENCES `osversions` (`os_ver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osnames`
--

LOCK TABLES `osnames` WRITE;
/*!40000 ALTER TABLE `osnames` DISABLE KEYS */;
/*!40000 ALTER TABLE `osnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osversions`
--

DROP TABLE IF EXISTS `osversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osversions` (
  `os_ver_id` int(2) NOT NULL AUTO_INCREMENT,
  `os_version` varchar(36) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`os_ver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osversions`
--

LOCK TABLES `osversions` WRITE;
/*!40000 ALTER TABLE `osversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `osversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `software` (
  `software_id` int(3) NOT NULL,
  `software_name` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `software_version` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`software_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_assets`
--

DROP TABLE IF EXISTS `user_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_assets` (
  `id` int(3) NOT NULL,
  `user_id` int(5) DEFAULT NULL,
  `computer_id` int(3) DEFAULT NULL,
  `monitor_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `computer_id` (`computer_id`),
  KEY `monitor_id` (`monitor_id`),
  CONSTRAINT `user_assets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_assets_ibfk_2` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`computer_id`),
  CONSTRAINT `user_assets_ibfk_3` FOREIGN KEY (`monitor_id`) REFERENCES `monitors` (`monitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_assets`
--

LOCK TABLES `user_assets` WRITE;
/*!40000 ALTER TABLE `user_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(70) COLLATE utf8_polish_ci DEFAULT NULL,
  `join_date` varchar(16) COLLATE utf8_polish_ci DEFAULT NULL,
  `departament_id` int(2) NOT NULL,
  `location_id` int(3) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `firstname` (`firstname`,`lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-13 17:54:03
