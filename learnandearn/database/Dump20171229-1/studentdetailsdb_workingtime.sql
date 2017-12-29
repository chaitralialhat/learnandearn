CREATE DATABASE  IF NOT EXISTS `studentdetailsdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `studentdetailsdb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: studentdetailsdb
-- ------------------------------------------------------
-- Server version	5.5.21

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
-- Table structure for table `workingtime`
--

DROP TABLE IF EXISTS `workingtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workingtime` (
  `username` varchar(100) NOT NULL,
  `intime` varchar(25) DEFAULT NULL,
  `outtime` varchar(25) DEFAULT NULL,
  `totalhours` varchar(25) DEFAULT '0',
  `totalpayment` double DEFAULT '0',
  `date` date NOT NULL,
  `hours` float DEFAULT '0',
  `minites` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workingtime`
--

LOCK TABLES `workingtime` WRITE;
/*!40000 ALTER TABLE `workingtime` DISABLE KEYS */;
INSERT INTO `workingtime` VALUES ('chaitrali','9:45','18:54','9:9',274.5,'2017-12-23',9,9),('chaitrali','9:45','18:54','9:9',274.5,'2017-12-23',9,9),('chaitrali','8:45','19:00','10:15',307.5,'2017-12-18',10,15),('chaitrali','7:48','4:55','-2:-53',-86.5,'2017-12-26',-2,-53),('akshaya','9:45','21:45','12:0',360,'2017-12-23',12,5),('akshaya','8:45','12:45','4:0',120,'2017-12-18',4,5),('akshaya','7:45','13:50','6:5',182.5,'2017-12-11',6,5),('akshaya','8:45','6:35','-2:-10',-65,'2017-12-10',-2,-10),('akshaya','9:45','7:55','-1:-50',-55,'2017-12-04',-1,-50),('chaitrali','9:45','11:50','2:5',62.5,'2016-08-08',2,5),('chaitrali','4:30','21:45','17:15',517.5,'2016-08-23',17,15),('chaitrali','8:35','14:55','6:20',190,'2017-12-27',6,20),('chaitrali','9:55','18:30','8:35',257.5,'2017-11-26',8,35),('madhavi','8:55','16:45','7:50',235,'2017-11-25',7,50),('madhavi','8:56','18:50','9:54',297,'2017-10-15',9,54),('madhavi','9:54','11:55','2:1',60.5,'2017-12-28',2,1),('komal','12:55','24:40','11:45',352.5,'2017-12-28',11,45);
/*!40000 ALTER TABLE `workingtime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-29  9:22:34
