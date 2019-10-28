-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Assets`
--

DROP TABLE IF EXISTS `Assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assets` (
  `Asset_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Details` varchar(200) NOT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`Asset_Id`),
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `Assets_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assets`
--

LOCK TABLES `Assets` WRITE;
/*!40000 ALTER TABLE `Assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Claim_Details`
--

DROP TABLE IF EXISTS `Claim_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Claim_Details` (
  `Claim_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Damage` varchar(100) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Policy_Number` int(11) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Claim_Id`),
  KEY `Policy_Number` (`Policy_Number`),
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `Claim_Details_ibfk_1` FOREIGN KEY (`Policy_Number`) REFERENCES `Customer_Policies` (`Policy_Number`) ON DELETE CASCADE,
  CONSTRAINT `Claim_Details_ibfk_2` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Claim_Details`
--

LOCK TABLES `Claim_Details` WRITE;
/*!40000 ALTER TABLE `Claim_Details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Claim_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company` (
  `Name` varchar(50) NOT NULL,
  `Company_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Contact_Information` varchar(15) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `Pincode` varchar(10) NOT NULL,
  `Country` varchar(20) NOT NULL,
  PRIMARY KEY (`Company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Customer_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `Pincode` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  PRIMARY KEY (`Customer_Id`),
  KEY `username` (`username`),
  CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (2,'customer1','preet vihar ,kaccha malak road, jagraon','142026','India','customer');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Contact`
--

DROP TABLE IF EXISTS `Customer_Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Contact` (
  `Contact` varchar(15) NOT NULL,
  `Customer_Id` int(11) NOT NULL,
  PRIMARY KEY (`Contact`,`Customer_Id`),
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `Customer_Contact_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Contact`
--

LOCK TABLES `Customer_Contact` WRITE;
/*!40000 ALTER TABLE `Customer_Contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Email_Id`
--

DROP TABLE IF EXISTS `Customer_Email_Id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Email_Id` (
  `Email_Id` varchar(40) NOT NULL,
  `Customer_Id` int(11) NOT NULL,
  PRIMARY KEY (`Email_Id`,`Customer_Id`),
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `Customer_Email_Id_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Email_Id`
--

LOCK TABLES `Customer_Email_Id` WRITE;
/*!40000 ALTER TABLE `Customer_Email_Id` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_Email_Id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Policies`
--

DROP TABLE IF EXISTS `Customer_Policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Policies` (
  `Policy_Number` int(11) NOT NULL AUTO_INCREMENT,
  `Date_of_Purchase` date NOT NULL,
  `date_of_expire` date NOT NULL,
  `Policy_id` int(11) DEFAULT NULL,
  `Customer_Id` int(11) NOT NULL,
  `Asset_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Policy_Number`),
  KEY `Policy_id` (`Policy_id`),
  KEY `Customer_Id` (`Customer_Id`),
  KEY `Asset_Id` (`Asset_Id`),
  CONSTRAINT `Customer_Policies_ibfk_1` FOREIGN KEY (`Policy_id`) REFERENCES `Policy` (`Policy_id`) ON DELETE CASCADE,
  CONSTRAINT `Customer_Policies_ibfk_2` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE,
  CONSTRAINT `Customer_Policies_ibfk_3` FOREIGN KEY (`Asset_Id`) REFERENCES `Assets` (`Asset_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Policies`
--

LOCK TABLES `Customer_Policies` WRITE;
/*!40000 ALTER TABLE `Customer_Policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_Policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documentof`
--

DROP TABLE IF EXISTS `Documentof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Documentof` (
  `Document_Id` int(11) NOT NULL,
  `Policy_Number` int(11) NOT NULL,
  `Customer_Id` int(11) NOT NULL,
  PRIMARY KEY (`Document_Id`,`Policy_Number`,`Customer_Id`),
  KEY `Policy_Number` (`Policy_Number`),
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `Documentof_ibfk_1` FOREIGN KEY (`Document_Id`) REFERENCES `Documents` (`Document_Id`) ON DELETE CASCADE,
  CONSTRAINT `Documentof_ibfk_2` FOREIGN KEY (`Policy_Number`) REFERENCES `Customer_Policies` (`Policy_Number`) ON DELETE CASCADE,
  CONSTRAINT `Documentof_ibfk_3` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documentof`
--

LOCK TABLES `Documentof` WRITE;
/*!40000 ALTER TABLE `Documentof` DISABLE KEYS */;
/*!40000 ALTER TABLE `Documentof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documents`
--

DROP TABLE IF EXISTS `Documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Documents` (
  `Document_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Document_Type` varchar(100) NOT NULL,
  `Verification_Status` int(11) NOT NULL,
  `Link_to_doc` varchar(200) NOT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Document_Id`),
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `Documents_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documents`
--

LOCK TABLES `Documents` WRITE;
/*!40000 ALTER TABLE `Documents` DISABLE KEYS */;
INSERT INTO `Documents` VALUES (2,'aadahar1',0,'kkk',2);
/*!40000 ALTER TABLE `Documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Name` varchar(50) NOT NULL,
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_of_joining` date NOT NULL,
  `Street` varchar(30) NOT NULL,
  `Contact_Information` varchar(15) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Pincode` varchar(10) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `Identification` int(11) DEFAULT NULL,
  `Office_Id` int(11) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  PRIMARY KEY (`User_Id`),
  KEY `Identification` (`Identification`),
  KEY `Office_Id` (`Office_Id`),
  KEY `username` (`username`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Identification`) REFERENCES `Employee_type` (`Identification`) ON DELETE CASCADE,
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`Office_Id`) REFERENCES `Office` (`Office_Id`) ON DELETE CASCADE,
  CONSTRAINT `Employee_ibfk_3` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('parv jain',2,'1999-10-10','preet vihar ,kaccha malak road','839e33','parv jain','142026','India',1,1,'parv1010');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_type`
--

DROP TABLE IF EXISTS `Employee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_type` (
  `Type` varchar(30) NOT NULL,
  `Salary` float NOT NULL,
  `Identification` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Identification`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_type`
--

LOCK TABLES `Employee_type` WRITE;
/*!40000 ALTER TABLE `Employee_type` DISABLE KEYS */;
INSERT INTO `Employee_type` VALUES ('software developer',10,1);
/*!40000 ALTER TABLE `Employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feedback` (
  `Remarks` varchar(200) NOT NULL,
  `Serial_Number` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Serial_Number`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `Employee` (`User_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES ('i am good',2,2);
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manager` (
  `Manager_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Manager_Id`,`User_Id`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `Manager_ibfk_1` FOREIGN KEY (`Manager_Id`) REFERENCES `Employee` (`User_Id`),
  CONSTRAINT `Manager_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `Employee` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Office`
--

DROP TABLE IF EXISTS `Office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Office` (
  `Office_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Office_name` varchar(50) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Pincode` varchar(10) NOT NULL,
  `Country` varchar(15) NOT NULL,
  PRIMARY KEY (`Office_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Office`
--

LOCK TABLES `Office` WRITE;
/*!40000 ALTER TABLE `Office` DISABLE KEYS */;
INSERT INTO `Office` VALUES (1,'Office1','preet vihar ,kaccha malak road','222','142026','India');
/*!40000 ALTER TABLE `Office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policy`
--

DROP TABLE IF EXISTS `Policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Policy` (
  `Policy_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name_of_Policy` varchar(50) NOT NULL,
  `Cost_per_month` float NOT NULL,
  `things_to_cover` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `Company_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Policy_id`),
  KEY `Company_Id` (`Company_Id`),
  CONSTRAINT `Policy_ibfk_1` FOREIGN KEY (`Company_Id`) REFERENCES `Company` (`Company_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policy`
--

LOCK TABLES `Policy` WRITE;
/*!40000 ALTER TABLE `Policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `Policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policy_Things_covered`
--

DROP TABLE IF EXISTS `Policy_Things_covered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Policy_Things_covered` (
  `Things_covered` varchar(100) NOT NULL,
  `Policy_id` int(11) NOT NULL,
  PRIMARY KEY (`Things_covered`,`Policy_id`),
  KEY `Policy_id` (`Policy_id`),
  CONSTRAINT `Policy_Things_covered_ibfk_1` FOREIGN KEY (`Policy_id`) REFERENCES `Policy` (`Policy_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policy_Things_covered`
--

LOCK TABLES `Policy_Things_covered` WRITE;
/*!40000 ALTER TABLE `Policy_Things_covered` DISABLE KEYS */;
/*!40000 ALTER TABLE `Policy_Things_covered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relations`
--

DROP TABLE IF EXISTS `Relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Relations` (
  `Relationship_Type` varchar(20) NOT NULL,
  `Customer_Id` int(11) NOT NULL,
  `CustomersRelation_Id` int(11) NOT NULL,
  PRIMARY KEY (`Customer_Id`,`CustomersRelation_Id`),
  KEY `CustomersRelation_Id` (`CustomersRelation_Id`),
  CONSTRAINT `Relations_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`),
  CONSTRAINT `Relations_ibfk_2` FOREIGN KEY (`CustomersRelation_Id`) REFERENCES `Customer` (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relations`
--

LOCK TABLES `Relations` WRITE;
/*!40000 ALTER TABLE `Relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `username` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(200) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('customer','$2a$10$YixJu3h1jx0fv2.XPfUJne.fiVUtx27m3fpF8uIZ1jSJej1QYrUqa','customer'),('dallagandu','$2a$10$RgGOO6vAHbZXDkIUnxfyX.QQES2LunP7o8S/8utDxuYn7/4nUgoW6','admin'),('parv1010','$2a$10$ITKp1Kac0Y9AJj8NAHkbc.4JzEJoxbPplYCirv4K96JLztkdIpqaW','employee');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wallet`
--

DROP TABLE IF EXISTS `Wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wallet` (
  `Wallet_id` int(11) NOT NULL AUTO_INCREMENT,
  `Balance` float NOT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Wallet_id`),
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `Wallet_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wallet`
--

LOCK TABLES `Wallet` WRITE;
/*!40000 ALTER TABLE `Wallet` DISABLE KEYS */;
INSERT INTO `Wallet` VALUES (2,105.05,2);
/*!40000 ALTER TABLE `Wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionid` int(11) NOT NULL,
  `money` float NOT NULL,
  `status` int(11) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Customer_Id` int(11) NOT NULL,
  PRIMARY KEY (`transactionid`),
  KEY `Customer_Id` (`Customer_Id`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `Employee` (`User_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-15  2:08:24
