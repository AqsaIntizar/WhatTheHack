-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: westartup
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applied_for`
--

DROP TABLE IF EXISTS `applied_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `applied_for` (
  `EUID` int(11) NOT NULL,
  `ESID` int(11) NOT NULL,
  KEY `FK_EUIDAF` (`EUID`),
  KEY `FK_ESIDAF` (`ESID`),
  CONSTRAINT `FK_ESIDAF` FOREIGN KEY (`ESID`) REFERENCES `startup` (`SID`),
  CONSTRAINT `FK_EUIDAF` FOREIGN KEY (`EUID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applied_for`
--

LOCK TABLES `applied_for` WRITE;
/*!40000 ALTER TABLE `applied_for` DISABLE KEYS */;
INSERT INTO `applied_for` VALUES (1,1);
/*!40000 ALTER TABLE `applied_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chat` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `ChatName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'Jhon,Jan');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `looking_for`
--

DROP TABLE IF EXISTS `looking_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `looking_for` (
  `ESID` int(11) NOT NULL,
  `ESKID` int(11) NOT NULL,
  KEY `FK_ESIDLF` (`ESID`),
  KEY `FK_SKIDLF` (`ESKID`),
  CONSTRAINT `FK_ESIDLF` FOREIGN KEY (`ESID`) REFERENCES `startup` (`SID`),
  CONSTRAINT `FK_SKIDLF` FOREIGN KEY (`ESKID`) REFERENCES `skill_class` (`SKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `looking_for`
--

LOCK TABLES `looking_for` WRITE;
/*!40000 ALTER TABLE `looking_for` DISABLE KEYS */;
/*!40000 ALTER TABLE `looking_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `MID` int(11) NOT NULL AUTO_INCREMENT,
  `SenderID` int(11) NOT NULL,
  `ECID` int(11) NOT NULL,
  `MTime` time NOT NULL,
  `Msg` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`MID`),
  KEY `FK_UIDM` (`SenderID`),
  KEY `FK_CIDM` (`ECID`),
  CONSTRAINT `FK_CIDM` FOREIGN KEY (`ECID`) REFERENCES `chat` (`CID`),
  CONSTRAINT `FK_UIDM` FOREIGN KEY (`SenderID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,2,1,'09:29:48','My brother is Jhon Doe 2.');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notification` (
  `EUID` int(11) NOT NULL,
  `NID` int(11) NOT NULL AUTO_INCREMENT,
  `Message` varchar(500) NOT NULL,
  `T` timestamp NOT NULL,
  PRIMARY KEY (`NID`),
  KEY `FK_UIDNOT` (`EUID`),
  CONSTRAINT `FK_UIDNOT` FOREIGN KEY (`EUID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (2,1,'Welcome to WeStartup, Jhon Doe','2019-03-02 08:33:15');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ranking` (
  `EUID` int(11) NOT NULL,
  `total_score` int(11) DEFAULT NULL,
  `amount_of_votes` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `EUID` (`EUID`),
  CONSTRAINT `FK_EUIDR` FOREIGN KEY (`EUID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranking`
--

LOCK TABLES `ranking` WRITE;
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
INSERT INTO `ranking` VALUES (2,5,1);
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `skill` (
  `EUID` int(11) NOT NULL,
  `skilltag` varchar(225) DEFAULT NULL,
  `ESKID` int(11) NOT NULL AUTO_INCREMENT,
  KEY `FK_EUIDSK` (`EUID`),
  KEY `FK_ESKIDSK` (`ESKID`),
  CONSTRAINT `FK_ESKIDSK` FOREIGN KEY (`ESKID`) REFERENCES `skill_class` (`SKID`),
  CONSTRAINT `FK_EUIDSK` FOREIGN KEY (`EUID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (2,'Mathematical Statistician',1);
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_class`
--

DROP TABLE IF EXISTS `skill_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `skill_class` (
  `SKID` int(11) NOT NULL AUTO_INCREMENT,
  `SkillName` varchar(225) NOT NULL,
  PRIMARY KEY (`SKID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_class`
--

LOCK TABLES `skill_class` WRITE;
/*!40000 ALTER TABLE `skill_class` DISABLE KEYS */;
INSERT INTO `skill_class` VALUES (1,'Mathematician');
/*!40000 ALTER TABLE `skill_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup`
--

DROP TABLE IF EXISTS `startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `startup` (
  `SID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner_ID` int(11) NOT NULL,
  `About` varchar(500) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `StartupName` varchar(225) NOT NULL,
  `Join_Date` varchar(225) NOT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Image` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`SID`),
  KEY `Owner_ID` (`Owner_ID`),
  CONSTRAINT `startup_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup`
--

LOCK TABLES `startup` WRITE;
/*!40000 ALTER TABLE `startup` DISABLE KEYS */;
INSERT INTO `startup` VALUES (1,2,'Jhon Doe\'s startup','jhonIsDaBomb.com','DaBomb','2019-03-02 09:14:38','Neverland',NULL);
/*!40000 ALTER TABLE `startup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_in_chat`
--

DROP TABLE IF EXISTS `user_in_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_in_chat` (
  `EUID` int(11) NOT NULL,
  `ECID` int(11) NOT NULL,
  KEY `FK_EUIDUIC` (`EUID`),
  KEY `FK_ECIDUIC` (`ECID`),
  CONSTRAINT `FK_ECIDUIC` FOREIGN KEY (`ECID`) REFERENCES `chat` (`CID`),
  CONSTRAINT `FK_EUIDUIC` FOREIGN KEY (`EUID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_in_chat`
--

LOCK TABLES `user_in_chat` WRITE;
/*!40000 ALTER TABLE `user_in_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_in_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr`
--

DROP TABLE IF EXISTS `usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usr` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `ImagePath` varchar(225) DEFAULT NULL,
  `CVPath` varchar(225) DEFAULT NULL,
  `joindate` date DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `PW` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr`
--

LOCK TABLES `usr` WRITE;
/*!40000 ALTER TABLE `usr` DISABLE KEYS */;
INSERT INTO `usr` VALUES (1,'Janssens','Jan','jan.janssens@gmail.com',NULL,NULL,'2019-03-02','Leuven','f03881a88c6e39135f0ecc60efd609b9'),(2,'Doe','Jhon','jhon.doe@gmail.com',NULL,NULL,'2019-03-02','Neverland','f2f86d6bdd231f23b356f858191b3887');
/*!40000 ALTER TABLE `usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr_in_startup`
--

DROP TABLE IF EXISTS `usr_in_startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usr_in_startup` (
  `EUID` int(11) NOT NULL,
  `ESID` int(11) NOT NULL,
  `Join_time` time NOT NULL,
  KEY `FK_EUID` (`EUID`),
  KEY `FK_ESID` (`ESID`),
  CONSTRAINT `FK_ESID` FOREIGN KEY (`ESID`) REFERENCES `startup` (`SID`),
  CONSTRAINT `FK_EUID` FOREIGN KEY (`EUID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr_in_startup`
--

LOCK TABLES `usr_in_startup` WRITE;
/*!40000 ALTER TABLE `usr_in_startup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usr_in_startup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewed`
--

DROP TABLE IF EXISTS `viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `viewed` (
  `EUID` int(11) NOT NULL,
  `ESID` int(11) NOT NULL,
  KEY `FK_EUIDV` (`EUID`),
  KEY `FK_ESIDV` (`ESID`),
  CONSTRAINT `FK_ESIDV` FOREIGN KEY (`ESID`) REFERENCES `startup` (`SID`),
  CONSTRAINT `FK_EUIDV` FOREIGN KEY (`EUID`) REFERENCES `usr` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewed`
--

LOCK TABLES `viewed` WRITE;
/*!40000 ALTER TABLE `viewed` DISABLE KEYS */;
INSERT INTO `viewed` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `viewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_info`
--

DROP TABLE IF EXISTS `website_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `website_info` (
  `about` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_info`
--

LOCK TABLES `website_info` WRITE;
/*!40000 ALTER TABLE `website_info` DISABLE KEYS */;
INSERT INTO `website_info` VALUES ('Koomt nog');
/*!40000 ALTER TABLE `website_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-02 10:30:45
