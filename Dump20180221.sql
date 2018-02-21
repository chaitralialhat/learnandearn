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
-- Table structure for table `monthlypayment`
--

DROP TABLE IF EXISTS `monthlypayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthlypayment` (
  `username` varchar(50) DEFAULT NULL,
  `totalmonthlypayment` double DEFAULT '0',
  `month` varchar(100) DEFAULT '0',
  `year` varchar(45) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthlypayment`
--

LOCK TABLES `monthlypayment` WRITE;
/*!40000 ALTER TABLE `monthlypayment` DISABLE KEYS */;
INSERT INTO `monthlypayment` VALUES ('chaitrali',489.5,'January','2018'),('akshaya',0,'January','2018'),('kiran',778.5,'January','2018'),('null',0,'January','2018'),('chaitanya',560,'January','2018');
/*!40000 ALTER TABLE `monthlypayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `mobile` bigint(10) DEFAULT NULL,
  `college` varchar(50) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `mailID` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`studentid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'chaitrali','Female',8446276702,'MIT','computer','chaitrali@gmail.com','bhosari','pune','Maharashtra','india','chaitrali','alhat','student'),(2,'suresh','Male',8446276702,'MIT','computer','suresh@gmail.com','bhosari','pune','Maharashtra','india','suresh','Alhat','admin'),(3,'akshaya','Female',8452145265,'MIT','BCS','akshaya@gmail.com','moshi','pune','Maharashtra','india','akshaya','alhat','student'),(4,'madhvi','Female',7854251458,'VIT','computer','madhvi@gmail.com','hadapsar','pune','maharashatra','india','madhavi','bhoite','student'),(5,'komal','Female',7854859654,'mit','computer','komal@gmail.com','bhosari','pune','Maharashtra','india','komal','jadhav','student'),(6,'chaitanya','Male',8457154251,'coep','entc','chaitanya@gmail.com','bhosari','pune','Maharashtra','india','chaitanya','alhat','student'),(7,'kiran','Female',8452152478,'COEP','computer','kiran@gmail.com','Moshi','pune','Maharashtra','India','kiran','alhat','student');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentlogin`
--

DROP TABLE IF EXISTS `studentlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentlogin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(65) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentlogin`
--

LOCK TABLES `studentlogin` WRITE;
/*!40000 ALTER TABLE `studentlogin` DISABLE KEYS */;
INSERT INTO `studentlogin` VALUES ('akshaya','d7b3cedae555572347aaaf507bf7b7f12d40c1c52705bb808618f573d8eb','student'),('chaitanya','ba75a5a76f66b4193663da7e7267c5cdc88aace376350687ba3cf215612628','student'),('chaitrali','bc71557a1ca3bcb1ac83f7e9d8826e61d961552fd6ec732cf49b99633a2ea','student'),('kiran','fc34d751fd3ab4373ea1b537475d19f61f31147bbaed23b796b382cf224534ef','student'),('komal','4163765a08462e3f2a8806941fef87148427f3229cb52ccf2ab4bd684a2','student'),('madhavi','6684a8f74844b78824cf4762a5d2b4acd9e3f3d9cc1fd8c695f279f3d6b3beb','student'),('suresh','35ea7f63ff7496ffe0a733f11fa3705412f77644955cc71f46ea0ebd33d1','admin');
/*!40000 ALTER TABLE `studentlogin` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `workingtime` VALUES ('chaitrali','9:45','18:54','9:9',274.5,'2017-12-23',9,9),('chaitrali','9:45','18:54','9:9',274.5,'2017-12-23',9,9),('chaitrali','8:45','19:00','10:15',307.5,'2017-12-18',10,15),('chaitrali','7:48','4:55','-2:-53',-86.5,'2017-12-26',-2,-53),('akshaya','9:45','21:45','12:0',360,'2017-12-23',12,5),('akshaya','8:45','12:45','4:0',120,'2017-12-18',4,5),('akshaya','7:45','13:50','6:5',182.5,'2017-12-11',6,5),('akshaya','8:45','6:35','-2:-10',-65,'2017-12-10',-2,-10),('akshaya','9:45','7:55','-1:-50',-55,'2017-12-04',-1,-50),('chaitrali','9:45','11:50','2:5',62.5,'2016-08-08',2,5),('chaitrali','4:30','21:45','17:15',517.5,'2016-08-23',17,15),('chaitrali','8:35','14:55','6:20',190,'2017-12-27',6,20),('chaitrali','9:55','18:30','8:35',257.5,'2017-11-26',8,35),('madhavi','8:55','16:45','7:50',235,'2017-11-25',7,50),('madhavi','8:56','18:50','9:54',297,'2017-10-15',9,54),('madhavi','9:54','11:55','2:1',60.5,'2017-12-28',2,1),('komal','12:55','24:40','11:45',352.5,'2017-12-28',11,45),('chaitrali','9:50','16:15','6:25',192.5,'2017-12-30',6,25),('komal','9:18','20:18','11:0',330,'2017-12-30',11,35),('chaitanya','8:55','15:30','6:35',197.5,'2017-12-30',6,35),('chaitrali','8:57','16:55','7:58',239,'2018-05-01',7,58),('chaitrali','8:55','16:57','8:2',241,'2017-01-05',8,2),('chaitrali','8:57','9:55','0:58',29,'2018-01-05',8,58),('chaitrali','8:59','17:20','8:21',250.5,'2018-01-05',8,21),('komal','8:57','14:55','5:58',179,'2018-01-12',5,58),('komal','8:55','14:55','6:0',180,'2019-05-08',6,35),('komal','8:55','14:55','6:0',180,'2018-06-13',6,35),('komal','8:55','9:55','1:0',30,'2018-01-25',1,35),('komal','9:55','13:30','3:35',107.5,'2018-08-02',3,35),('kiran','8:58','16:55','7:57',238.5,'2018-01-11',7,57),('kiran','8:55','16:40','7:45',232.5,'2018-01-10',7,45),('kiran','7:55','9:30','1:35',47.5,'2018-01-09',1,35),('kiran','9:15','17:55','8:40',260,'2018-01-07',8,40),('chaitanya','8:55','16:40','7:45',232.5,'2018-01-11',7,45),('chaitanya','10:40','18:40','8:0',240,'2018-01-10',8,55),('chaitanya','7:50','10:45','2:55',87.5,'2018-01-08',2,55),('chaitrali','8:45','15:45','7:0',210,'2018-01-11',7,0),('komal','8:55','11:55','3:0',90,'2018-01-11',3,0);
/*!40000 ALTER TABLE `workingtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearlypayment`
--

DROP TABLE IF EXISTS `yearlypayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yearlypayment` (
  `username` varchar(50) DEFAULT NULL,
  `totalyearpayment` double DEFAULT '0',
  `year` varchar(45) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearlypayment`
--

LOCK TABLES `yearlypayment` WRITE;
/*!40000 ALTER TABLE `yearlypayment` DISABLE KEYS */;
INSERT INTO `yearlypayment` VALUES ('chaitrali',728.5,'2018'),('null',0,'2018'),('komal',496.5,'2018'),('akshaya',0,'2018'),('chaitanya',560,'2018'),('kiran',778.5,'2018'),('null',0,'2018'),('null',0,'2018');
/*!40000 ALTER TABLE `yearlypayment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-21 17:46:26
