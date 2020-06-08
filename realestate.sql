-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: RealEstate
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `profile_image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Admins','admin@gmail.com','adminusername','admin','/loginImages/240px-Bus-logo.svg.png'),(2,'Admin2','admin2@gmail.com','admin2','admin',NULL),(3,'Epc','epc@smartenergie.be','Epc','fiver2020',NULL),(4,'Immokeuring','immokeuring@gmail.com ','Immokeuring','Maasmechelen@2019',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Association` int(11) DEFAULT NULL,
  `allocated_image` varchar(200) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `fk_adminassociation` (`Association`),
  CONSTRAINT `fk_adminassociation` FOREIGN KEY (`Association`) REFERENCES `admins` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (1,'Ethan','ethaned@gmail.com','password',1,'/loginImages/6.jpg','Company'),(2,'TestAgent','tagent@gmail.com','password',1,'/loginImages/Unknown.png','myCompany'),(3,'dirk','dirk@gmail.com','admin',1,'/loginImages/paraaf.jpg','IMMO DIRK'),(4,'translationcheck','tcheck@gmail.com','tpassword',1,'/loginImages/Unknown.png','abc'),(5,'Ismail Kolkiran','info@smile-energy.be','Immokeuring2020',1,'/loginImages/Ismailkolkiran-2 - kopie - kopie.jpg','Smile Energy');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_Lookup`
--

DROP TABLE IF EXISTS `request_Lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_Lookup` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_Lookup`
--

LOCK TABLES `request_Lookup` WRITE;
/*!40000 ALTER TABLE `request_Lookup` DISABLE KEYS */;
INSERT INTO `request_Lookup` VALUES (1,'Pending Files'),(2,'Finished Files');
/*!40000 ALTER TABLE `request_Lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `attachments` varchar(250) DEFAULT NULL,
  `date_of_visit` varchar(250) DEFAULT NULL,
  `admin_comments` varchar(255) DEFAULT NULL,
  `service_type` int(11) DEFAULT NULL,
  `customername` varchar(200) DEFAULT NULL,
  `customersurname` varchar(200) DEFAULT NULL,
  `invoice_type` varchar(45) NOT NULL,
  `urgent` int(11) DEFAULT NULL,
  `invoice_address` varchar(200) DEFAULT NULL,
  `mobile_number` varchar(100) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `admin_request` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_request_idx` (`request_type`),
  KEY `fk_service_idx` (`service_type`),
  KEY `fk_status_idx` (`status`),
  CONSTRAINT `fk_request` FOREIGN KEY (`request_type`) REFERENCES `request_Lookup` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `fk_service` FOREIGN KEY (`service_type`) REFERENCES `service_Lookup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_status` FOREIGN KEY (`status`) REFERENCES `status_lookup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,2,5,'Prager Straße, Vienna, Austria','Wien','abc@gmail.com','12345678','new comments','/Files/Crescent-kuickpay-back.jpg','05/05/2022',NULL,1,'','','Professional',NULL,'','1234567','TestAgent',2,0),(2,2,5,'Berlin, WI, USA','Berlin','abc@gmail.com','12345678','NEW COMMENTS','/Files/Crescent-kuickpay-back.jpg','01/05/2020',NULL,1,'','','Customer',1,'Berlin, WI, USA','12365','Ethan',1,0),(3,2,5,'Hague, Netherlands','The Hague','abc@gmail.com','12345678','NEW COMMENTS','/Files/2206DC19-82F2-412A-B96D-76ACEF1638F2.jpeg','28/05/2020',NULL,1,'','','Professional',NULL,'','123456','TestAgent',2,0),(4,2,5,'Hà N?i, Hoàn Ki?m, Hanoi, Vietnam','Hanoi','aas@gmail.com','1245678','sad','/Files/Unknown.png','29/05/2020',NULL,3,'','','Customer',1,'Hà N?i, Hoàn Ki?m, Hanoi, Vietnam','1234','Admins',1,0),(5,2,5,'Vuhan, Hubei, China','Wuhan','abc@gmail.com','1234567','da','/Files/Logo.png','28/05/2020',NULL,1,'','','Professional',NULL,'','1234567','Admins',1,0),(6,2,5,'Silicon Valley, CA, USA','CA','abc@gmail.com','12345','No comments','/Files/zamponi2012aanlegpizzfadef.pdf','27/05/2020',NULL,2,'','','Customer',1,'Silicon Valley, CA, USA','1234567','Admins',1,1),(7,2,5,'Taiping, Perak, Malaysia','Taiping','abc@gmail.com','123456','no comments','/Files/zamponi2012aanlegpizzfadef.pdf','15/05/2020',NULL,1,'','','Professional',NULL,'','123456','TestAgent',2,0),(8,2,5,'Sydney NSW, Australia','Sydney','s@gmail.com','1234657','test','/Files/Crescent-kuickpay-back.jpg','31/05/2020',NULL,1,'','','Professional',NULL,'','123456','Admins',1,1),(9,2,5,'Witloofstraat, Zemst, België','BRUSSEL','gozenf@gmail.com','0478978499','qsdfqsdfqsdf','/Files/2020_03_18_Korona_Salgini_Vesilesiyle_Hacet_Duasi.pdf','20/05/2020',NULL,3,'','','Customer',1,'Witloofstraat, Zemst, België','+32478978499','dirk',3,0),(10,1,1,'beringsesteenweg, 41','HEPPEN','info@mfgozen.be','0478978499','qsd','/Files/',NULL,NULL,1,'','','Professional',NULL,'','+32478978499','dirk',3,0),(11,1,4,'Berlin, Germany','Berlin','abc@gmail.com','12345678','no comments','/Files/','11/05/2022',NULL,1,'','','Professional',NULL,'','12345678','TestAgent',2,0),(12,2,5,'Prague, Czechia','Prague','abc@gmail.com','123456','no comments','/Files/Unknown.png','15/05/2020',NULL,4,'','','Professional',NULL,'','12345','translationcheck',4,0),(13,1,4,'WITLOOFSTRAAT 7','BRUSSEL','info@smartenergie.be','0472345890','sdfg','/Files/','',NULL,1,'','','Professional',NULL,'','0472345890','dirk',3,0),(14,1,1,'Joseph Smeetslaan 11, Maasmechelen, België','Maasmechelen','info@smile-energy.be','0898784473','','/Files/Kadaster appartement.pdf',NULL,NULL,4,'Ismail ','Kelek','Customer',1,'Joseph Smeetslaan 11, Maasmechelen, België','+32§9878373','Admins',1,1),(15,2,5,'Creemersweg 1','Maasmechelen','info@smilenergy.be','9489878373','','/Files/Kadaster algemene delen.pdf','19/05/2020',NULL,2,'','','Professional',1,'','+3248987839','Ismail Kolkiran',5,0);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_Lookup`
--

DROP TABLE IF EXISTS `service_Lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_Lookup` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_Lookup`
--

LOCK TABLES `service_Lookup` WRITE;
/*!40000 ALTER TABLE `service_Lookup` DISABLE KEYS */;
INSERT INTO `service_Lookup` VALUES (1,'Electricity Inspection'),(2,'Energy Certification'),(3,'Energy+Electricity'),(4,'Olietank keuring');
/*!40000 ALTER TABLE `service_Lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_lookup`
--

DROP TABLE IF EXISTS `status_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_lookup` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_lookup`
--

LOCK TABLES `status_lookup` WRITE;
/*!40000 ALTER TABLE `status_lookup` DISABLE KEYS */;
INSERT INTO `status_lookup` VALUES (1,'Planned'),(2,'Customer Unreachable'),(3,'Waiting for Customer'),(4,'Report in Preparation'),(5,'Complete');
/*!40000 ALTER TABLE `status_lookup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-08 18:00:43
