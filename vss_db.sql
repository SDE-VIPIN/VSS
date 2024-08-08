-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: vss_db
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(45) NOT NULL,
  `admin_pass` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin','Vipin Yadav','vipinyadav@gmial.com','8896959595');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` varchar(45) NOT NULL,
  `client_pass` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('Abhay1272','Abhay@123','Anurag','abhay@gmail.com','8487356428','Lucknow','Lekhraj Metro Station, S-1','2024-03-07'),('Akhil123','Akhil@123','Vibhor','anurag@gmail.com','8756264222','Lucknow','Gole Market, S-15','2024-03-02'),('As123','As@123','Ashish','as@gmail.com','8565653251','Lucknow','BBdu','2024-05-14'),('Raghav11','Raghav@123','Raghav','raghav@gmail.com','9425367481','Ayodhya','K.S. Saket P.G. College ','2024-03-07'),('Sagar123','Sagar@123','Sagar','ss@gmail.com','8625462210','Ayodhya','Aditya Nagar Colony, 224001','2024-05-12'),('Vinay123','Vinay@123','Vinay','vinay@gmail.com','854526384','Lucknow','BBD University, Tiwariganj','2024-03-07'),('Vivek123','Vivek@123','Vivek','vv@gmail.com','9999636520','Lucknow','BBDU','2024-05-15');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_phone` varchar(10) NOT NULL,
  `user_question` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Vinay','vinay@gmail.com','8896324512','Is the service is available in Lucknow? ','2024-03-07'),(2,'Tarun','tarun@gmail.com','9394562863','Can we get the original part for the Hyundai model? ','2024-03-07'),(3,'Sagar','sagar@gmail.com','8486828110','Is it free for vehicle owners.','2024-05-12'),(20,'Varun','varun@gmail.com','8284865322','Is the service available in Delhi?','2024-05-15');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `serial_number` int NOT NULL AUTO_INCREMENT,
  `provider_id` varchar(45) NOT NULL,
  `emp_id` varchar(45) NOT NULL,
  `emp_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`serial_number`),
  UNIQUE KEY `serial_number_UNIQUE` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Var123','emp1','VIPIN YADAV','rs@gmail.com','8896969696','2024-04-08'),(6,'Var123','Anil123','Anil','anil@gmail.com','8485868210','2024-04-08'),(8,'Var123','emp2','Vinay','Vinay@gmail.com','9456256310','2024-05-15');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `rating` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'Vipin','vipin@gmail.com','Excellent customer support.',5,'2024-03-07'),(2,'Vinay','vinay@gmail.com','Excellent customer support.',5,'2024-03-07'),(3,'Tarun','tarun@gmail.com','Excellent service.',5,'2024-03-07'),(4,'aman','aman@gmail.com','Excellent service.',4,'2024-03-11'),(6,'Akash','varun@gmail.com','Excellent service',5,'2024-05-15'),(7,'Mohit','m@gmail.com','Excellent service',5,'2024-05-15'),(8,'abcd','abcd@gmail.com','ok.',0,'2024-05-15'),(9,'asdf','asff@gmail.com','ok.',2,'2024-05-15'),(10,'asdfghjk','vcdfds@gmail.com','ok.',5,'2024-05-15');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_scheme`
--

DROP TABLE IF EXISTS `offer_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer_scheme` (
  `schemeId` int NOT NULL AUTO_INCREMENT,
  `providerId` varchar(45) NOT NULL,
  `serviceId` int NOT NULL,
  `discount_offer` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`schemeId`),
  KEY `pf_idx` (`providerId`),
  CONSTRAINT `pf` FOREIGN KEY (`providerId`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_scheme`
--

LOCK TABLES `offer_scheme` WRITE;
/*!40000 ALTER TABLE `offer_scheme` DISABLE KEYS */;
INSERT INTO `offer_scheme` VALUES (3,'Var123',13,'','2024-04-24'),(4,'Var123',13,'','2024-04-24'),(5,'Var123',13,'','2024-04-24'),(6,'Var123',13,'','2024-04-24'),(7,'Var123',13,'','2024-04-24'),(8,'Var123',13,'','2024-04-24'),(9,'Var123',13,'','2024-04-24'),(10,'Var123',13,'','2024-04-24'),(11,'Var123',13,'','2024-04-24'),(12,'Var123',13,'','2024-04-24'),(13,'Var123',13,'','2024-04-24'),(14,'Var123',13,'','2024-04-24'),(15,'Var123',13,'','2024-04-24'),(16,'Var123',13,'','2024-04-30'),(17,'Var123',24,'30% off ','2024-05-12');
/*!40000 ALTER TABLE `offer_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(45) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `charge` varchar(5) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'Silver','3 Month','5000','2024-05-10'),(2,'Gold','5 Month','8000','2024-05-10'),(3,'Platinum','12 Month','8000','2024-05-10');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `provider_id` varchar(45) NOT NULL,
  `provider_password` varchar(45) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `owner` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `about` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `registration_no` varchar(45) NOT NULL,
  `plan_name` varchar(45) NOT NULL,
  `payment_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES ('Ab123','Ab@123','Abhay Services','9284855555','Abhay Singh','abhay@gmail.com','Lucknow','Baadshah Nagar, Gole Market S-6\r\n','We provide vehicle maintenance services for any type of cars and bikes.\r\n','2024-03-05','U52341UP2024PTC052891','Silver','paid'),('Ak123','Ak@123','ASS','8586812410','Akash Services','ak@gmail.com','lucknow','BBDU','We provide all type of vehicle services','2024-05-15','U55541UP2024PTC023480','Silver','paid'),('Mayank22','Mayank@123','Mayank Service Station','8946246137','Mayank Agarwal','ma@gmail.com','Lucknow','BBD University, Tiwariganj','Our company provide every type of car and bike services.','2024-03-07','U52541UP2024PTC052854','Gold','paid'),('SS123','Ss@123','Rajiv Services','8525656524','Rajiv Singh','rs@gmail.com','Lucknow','Baadshah Nagar, Gole Market S-16','We provide vehicle maintenance services for any type of cars and bikes.','2024-03-05','U52841UP2024PTC052899','Platinum','paid'),('Tarun123','Tarun@123','TSS','5154656666','Tarun','tss@gmail.com','lucknow','BBDU','We provide all types of car and bike repair and maintenance services.','2024-05-15','U55541UP2024PTC055555','Silver',NULL),('Var123','Var@123','Atul Service station','8489862366','Atul','atul@gmail.com','Lucknow','Chinhut','Established since 2003. Provide better service on your choice.','2024-03-01','U53341UP2024PTC053391','Silver','paid'),('Vip123','Vip@123','Vipinl Service Station','8866553322','Vipin','vipin@gmail.com','Lucknow','BBDU','We provide vehicle maintenance services for any type of cars and bikes.','2024-02-29','U55541UP2024PTC052900','Platinum','paid');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicebooking`
--

DROP TABLE IF EXISTS `servicebooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicebooking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `client_id` varchar(45) NOT NULL,
  `service_id` int NOT NULL,
  `provider_id` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `booking_status` varchar(45) NOT NULL DEFAULT 'false',
  `provider_response` varchar(45) DEFAULT NULL,
  `employee_id` varchar(45) DEFAULT NULL,
  `pick_status` varchar(45) DEFAULT NULL,
  `drop_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `cid_idx` (`client_id`),
  CONSTRAINT `cid` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicebooking`
--

LOCK TABLES `servicebooking` WRITE;
/*!40000 ALTER TABLE `servicebooking` DISABLE KEYS */;
INSERT INTO `servicebooking` VALUES (1,'Akhil123',13,'Var123','2024-04-04','true','ok','emp1','picked',NULL),(2,'Akhil123',14,'Var123','2024-04-04','true','ok','emp1','picked','dropped'),(7,'Akhil123',15,'Var123','2024-04-10','true','ok.','emp1','picked','dropped'),(8,'Akhil123',16,'Var123','2024-04-10','true','ok.','emp1','picked','dropped'),(9,'Akhil123',17,'Mayank22','2024-04-10','false',NULL,NULL,NULL,NULL),(10,'Akhil123',18,'Mayank22','2024-04-10','false',NULL,NULL,NULL,NULL),(11,'Akhil123',1,'Ab123','2024-04-11','false',NULL,NULL,NULL,NULL),(12,'Akhil123',4,'Ab123','2024-04-11','false',NULL,NULL,NULL,NULL),(18,'Akhil123',15,'Var123','2024-04-11','true','','emp1','picked','dropped'),(19,'Akhil123',16,'Var123','2024-04-11','true','ok.','Anil123','picked','dropped'),(20,'Akhil123',13,'Var123','2024-04-11','true','soon we will pick your vehicle.','Anil123','picked','dropped'),(21,'Akhil123',14,'Var123','2024-04-11','true','soon we will pick your vehicle.','Anil123','picked','dropped'),(22,'Akhil123',15,'Var123','2024-04-11','true','soon we will pick the vehicle','Anil123',NULL,NULL),(23,'Akhil123',16,'Var123','2024-04-11','true','soon we will contact you.','Anil123','picked','dropped'),(24,'Akhil123',13,'Var123','2024-04-11','true','soon we will contact you.','Anil123','picked','dropped'),(25,'Akhil123',14,'Var123','2024-04-11','true','ok.','Anil123','picked','dropped'),(26,'Akhil123',15,'Var123','2024-04-11','true','soon we will pick the vehicle','Anil123',NULL,NULL),(27,'Akhil123',16,'Var123','2024-04-11','true','soon we will pick the vehicle','Anil123',NULL,NULL),(28,'Akhil123',13,'Var123','2024-04-11','false',NULL,NULL,NULL,NULL),(29,'Akhil123',14,'Var123','2024-04-11','true','soon we will pick your vehicle.','emp1','picked',NULL),(30,'Akhil123',15,'Var123','2024-04-11','true','','emp1','picked','dropped'),(31,'Akhil123',16,'Var123','2024-04-11','true','soon we will pick your vehicle.','emp1',NULL,NULL),(32,'Akhil123',13,'Var123','2024-04-11','false',NULL,NULL,NULL,NULL),(33,'Akhil123',14,'Var123','2024-04-11','true','soon we will come','Anil123','picked','dropped'),(34,'Akhil123',15,'Var123','2024-04-11','true','','emp1',NULL,NULL),(35,'Akhil123',16,'Var123','2024-04-11','true','ok.','emp1',NULL,NULL),(36,'Akhil123',5,'SS123','2024-04-30','false',NULL,NULL,NULL,NULL),(37,'Akhil123',5,'SS123','2024-05-07','false',NULL,NULL,NULL,NULL),(38,'Akhil123',5,'SS123','2024-05-07','false',NULL,NULL,NULL,NULL),(50,'Sagar123',2,'Ab123','2024-05-12','false',NULL,NULL,NULL,NULL),(51,'Sagar123',3,'Ab123','2024-05-12','false',NULL,NULL,NULL,NULL),(60,'Akhil123',1,'Ab123','2024-05-12','false',NULL,NULL,NULL,NULL),(61,'Akhil123',3,'Ab123','2024-05-12','false',NULL,NULL,NULL,NULL),(62,'Akhil123',1,'Ab123','2024-05-12','false',NULL,NULL,NULL,NULL),(63,'Akhil123',3,'Ab123','2024-05-12','false',NULL,NULL,NULL,NULL),(64,'Akhil123',1,'Ab123','2024-05-12','false',NULL,NULL,NULL,NULL),(65,'Akhil123',3,'Ab123','2024-05-12','false',NULL,NULL,NULL,NULL),(66,'Akhil123',9,'Vip123','2024-05-13','false',NULL,NULL,NULL,NULL),(67,'Akhil123',9,'Vip123','2024-05-13','false',NULL,NULL,NULL,NULL),(68,'Akhil123',9,'Vip123','2024-05-13','false',NULL,NULL,NULL,NULL),(69,'Akhil123',9,'Vip123','2024-05-13','false',NULL,NULL,NULL,NULL),(70,'Akhil123',9,'Vip123','2024-05-13','false',NULL,NULL,NULL,NULL),(71,'Akhil123',9,'Vip123','2024-05-13','false',NULL,NULL,NULL,NULL),(72,'Akhil123',10,'Vip123','2024-05-13','false',NULL,NULL,NULL,NULL),(78,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(79,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(80,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(81,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(82,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(83,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(84,'Akhil123',2,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(85,'Akhil123',2,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(86,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(87,'Akhil123',2,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(88,'Akhil123',2,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(89,'Akhil123',2,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(90,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(91,'Akhil123',4,'Ab123','2024-05-13','false',NULL,NULL,NULL,NULL),(92,'Akhil123',2,'Ab123','2024-05-14','false',NULL,NULL,NULL,NULL),(93,'Akhil123',4,'Ab123','2024-05-14','false',NULL,NULL,NULL,NULL),(94,'Akhil123',2,'Ab123','2024-05-15','false',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `servicebooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `provider_id` varchar(45) NOT NULL,
  `service_name` varchar(45) NOT NULL,
  `charge` float NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `fk_idx` (`provider_id`),
  CONSTRAINT `fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Ab123','Car wash',500,'Car wash with polish'),(2,'Ab123','Custom services',1500,'Monthly service'),(3,'Ab123','Battery replacement',3500,'Original Product'),(4,'Ab123','Denting and Painting',9500,'Charges may vary depends on car or bike condition'),(5,'SS123','Car wash',500,'Car wash with polish'),(6,'SS123','Custom services',1500,'Monthly service'),(7,'SS123','Battery replacement',3500,'Original Product'),(8,'SS123','Denting and Painting',9500,'Charges may vary depends on car or bike condition\r\n'),(9,'Vip123','Car wash',500,'Car wash with polish'),(10,'Vip123','Custom services',1500,'Monthly service'),(11,'Vip123','Battery replacement',3500,'Original Product'),(12,'Vip123','Denting and Painting',9500,'Charges may vary depends on car or bike condition'),(14,'Var123','Custom services',1500,'Monthly service'),(15,'Var123','Battery replacement',3000,'Original Product'),(16,'Var123','Denting and Painting',10000,'Charges may vary depends on car or bike condition\r\n '),(17,'Mayank22','Car wash',500,'Car wash with polish'),(18,'Mayank22','Custom services',1000,'Monthly service'),(20,'Mayank22','Denting and Painting',10000,'Charges may vary depends on car or bike condition\r\n  '),(21,'Var123','Washing',500,'Car washing with polish'),(24,'Var123','Oiling and Greecing',500,'Oiling and Greecing with one month warranty.');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tips`
--

DROP TABLE IF EXISTS `tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tips` (
  `tips_id` int NOT NULL AUTO_INCREMENT,
  `provider_id` varchar(45) NOT NULL,
  `provider_name` varchar(45) NOT NULL,
  `tips_topic` varchar(45) NOT NULL,
  `tips_content` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`tips_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tips`
--

LOCK TABLES `tips` WRITE;
/*!40000 ALTER TABLE `tips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tips` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15 21:46:23
