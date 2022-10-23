-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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
-- Table structure for table `booking service`
--

DROP TABLE IF EXISTS `booking service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking service` (
  `booking id` int(11) NOT NULL,
  `booking reference number` int(11) NOT NULL,
  `pickup location` int(11) NOT NULL,
  `dropoff location` int(11) NOT NULL,
  `driver id` int(11) NOT NULL,
  `official id` int(11) NOT NULL,
  `start time` datetime NOT NULL,
  `end time` datetime NOT NULL,
  `start odometer` int(11) NOT NULL,
  `end odometer` int(11) NOT NULL,
  `vehicle id` int(11) NOT NULL,
  PRIMARY KEY (`booking id`),
  KEY `fk_booking_location_idx` (`pickup location`),
  KEY `fk_booking_location1_idx` (`dropoff location`),
  KEY `fk_booking_driver1_idx` (`driver id`),
  KEY `fk_booking_Official1_idx` (`official id`),
  KEY `fk_booking_Vehicle_info1_idx` (`vehicle id`),
  CONSTRAINT `fk_booking_Official1` FOREIGN KEY (`official id`) REFERENCES `official` (`official id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_Vehicle_info1` FOREIGN KEY (`vehicle id`) REFERENCES `vehicle list` (`vehicle id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_driver1` FOREIGN KEY (`driver id`) REFERENCES `driver` (`driver id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_location` FOREIGN KEY (`pickup location`) REFERENCES `location` (`location id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_location1` FOREIGN KEY (`dropoff location`) REFERENCES `location` (`location id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking service`
--

LOCK TABLES `booking service` WRITE;
/*!40000 ALTER TABLE `booking service` DISABLE KEYS */;
INSERT INTO `booking service` VALUES (1,1,1,2,1,2,'2022-10-01 12:00:00','2022-10-01 13:15:00',0,78,1000);
INSERT INTO `booking service` VALUES (2,2,3,4,2,4,'2022-10-03 11:00:00','2022-10-03 15:00:00',0,95,1001);
INSERT INTO `booking service` VALUES (3,3,5,6,3,3,'2022-10-05 14:00:00','2022-10-05 15:10:00',0,49,1002);
/*!40000 ALTER TABLE `booking service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `driver id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `license` varchar(45) NOT NULL,
  `security clearnance level` varchar(45) NOT NULL,
  `language` varchar(45) NOT NULL,
  `FATL level` int(11) DEFAULT NULL,
  `FATL date` date DEFAULT NULL,
  `STLVT level` int(11) DEFAULT NULL,
  `STLVT date` date DEFAULT NULL,
  `STLVT Certifying Authority` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`driver id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Andrew','123456789000000000','1','English',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `driver` VALUES (2,'David','123456789000000001','2','Japanese',2,'2015-10-10',NULL,NULL,NULL);
INSERT INTO `driver` VALUES (3,'Enoch','123456789000000002','3','German',9,'2014-09-15',4,'2016-11-23','ADT Inc.');
INSERT INTO `driver` VALUES (4,'George','123456789000000003','4','Korean',NULL,NULL,2,'2018-04-20','ADT Inc.');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location id` int(11) NOT NULL,
  `address` text NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`location id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'123, Central-ro, Yeonsu-gu, Incheon, Republic of Korea','Incheon Central Park','Park');
INSERT INTO `location` VALUES (2,'43, Songnae-daero, Bucheon-si, Gyeonggi-do, Republic of Korea','Song Nae Station','Station');
INSERT INTO `location` VALUES (3,'269, Jemullyang-ro, Jung-gu, Incheon, Republic of Korea','Incheon Station','Station');
INSERT INTO `location` VALUES (4,'175, Biryu-daero, Yeonsu-gu, Incheon, Republic of Korea','Song Do Station','Station');
INSERT INTO `location` VALUES (5,'15, Gwangjang-ro, Bupyeong-gu, Incheon, Republic of Korea','Bupyeong Station','Station');
INSERT INTO `location` VALUES (6,'\'271, Gonghang-ro, Jung-gu, Incheon, Republic of Korea','Incheon International Airport','Airport');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official`
--

DROP TABLE IF EXISTS `official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `official` (
  `official id` int(11) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`official id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official`
--

LOCK TABLES `official` WRITE;
/*!40000 ALTER TABLE `official` DISABLE KEYS */;
INSERT INTO `official` VALUES (1,'KR','ko','coach','23010520','\'Kim Min Ho\'');
INSERT INTO `official` VALUES (2,'US','en','judge','23060500','\'Charles Otto Puth Jr.');
INSERT INTO `official` VALUES (3,'DE','de','coach','23070580','Hermann Karl Hesse');
INSERT INTO `official` VALUES (4,'JP','ja','psysician','23060540','Ken Shimizu');
INSERT INTO `official` VALUES (5,'IN','hi','psysician','23060670','\'Mohammed Aamir Hussain Khan');
/*!40000 ALTER TABLE `official` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle list`
--

DROP TABLE IF EXISTS `vehicle list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle list` (
  `vehicle id` int(11) NOT NULL,
  `registration` varchar(45) DEFAULT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `current odometer` int(11) DEFAULT NULL,
  `passanger capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicle id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle list`
--

LOCK TABLES `vehicle list` WRITE;
/*!40000 ALTER TABLE `vehicle list` DISABLE KEYS */;
INSERT INTO `vehicle list` VALUES (1000,'2001ABC','Volvo','XC90 SE','Silver',4350,4);
INSERT INTO `vehicle list` VALUES (1001,'2006AFD','Kia','K7','Black',2195,4);
INSERT INTO `vehicle list` VALUES (1002,'2021AHR','Telsa','2020 F','White',590,4);
INSERT INTO `vehicle list` VALUES (1003,'2020DXF','Ford','Transit','Silver',974,2);
/*!40000 ALTER TABLE `vehicle list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle maintenance`
--

DROP TABLE IF EXISTS `vehicle maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle maintenance` (
  `vehicle id` int(11) NOT NULL,
  `action type` varchar(45) NOT NULL,
  `odometer` int(11) NOT NULL,
  `finalcost` int(11) NOT NULL,
  `description` text NOT NULL,
  `start date` date NOT NULL,
  `end date` date NOT NULL,
  PRIMARY KEY (`vehicle id`),
  CONSTRAINT `fk_Vehicle maintenance_vehicle list1` FOREIGN KEY (`vehicle id`) REFERENCES `vehicle list` (`vehicle id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle maintenance`
--

LOCK TABLES `vehicle maintenance` WRITE;
/*!40000 ALTER TABLE `vehicle maintenance` DISABLE KEYS */;
INSERT INTO `vehicle maintenance` VALUES (1000,'M',4350,300,'Tire replacement','2022-10-15','2022-10-15');
INSERT INTO `vehicle maintenance` VALUES (1001,'R',2195,1000,'Engine replacement','2022-10-17','2022-10-18');
/*!40000 ALTER TABLE `vehicle maintenance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-23 23:27:46
