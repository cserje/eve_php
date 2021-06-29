-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: EVE
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Table structure for table `CATEGORY`
--

DROP TABLE IF EXISTS `CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORY` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `icon` varchar(45) NOT NULL DEFAULT 'undefined.jpg',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` VALUES (1,'Arc- és szemvédelem','undefined.jpg'),(2,'Fejvédelem','undefined.jpg'),(3,'Hallásvédelem','undefined.jpg'),(4,'Kéz- és karvédelem','undefined.jpg'),(5,'Lábvédelem','undefined.jpg'),(6,'Leesés elleni védelem','undefined.jpg'),(7,'Légzésvédelem','undefined.jpg'),(8,'Védőruhák','undefined.jpg');
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPMENT`
--

DROP TABLE IF EXISTS `EQUIPMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EQUIPMENT` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_worker` int NOT NULL,
  `id_standard_item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_EQUIPMENT_1_idx` (`id_worker`),
  KEY `fk_EQUIPMENT_2_idx` (`id_standard_item_id`),
  CONSTRAINT `fk_EQUIPMENT_1` FOREIGN KEY (`id_worker`) REFERENCES `WORKER` (`id`),
  CONSTRAINT `fk_EQUIPMENT_2` FOREIGN KEY (`id_standard_item_id`) REFERENCES `STANDARD_ITEM` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENT`
--

LOCK TABLES `EQUIPMENT` WRITE;
/*!40000 ALTER TABLE `EQUIPMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `EQUIPMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPMENT_VALUE`
--

DROP TABLE IF EXISTS `EQUIPMENT_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EQUIPMENT_VALUE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_equipment` int NOT NULL,
  `id_standard_item_field` int NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_EQUIPMENT_VALUE_1_idx` (`id_equipment`),
  KEY `fk_EQUIPMENT_VALUE_2_idx` (`id_standard_item_field`),
  CONSTRAINT `fk_EQUIPMENT_VALUE_1` FOREIGN KEY (`id_equipment`) REFERENCES `EQUIPMENT` (`id`),
  CONSTRAINT `fk_EQUIPMENT_VALUE_2` FOREIGN KEY (`id_standard_item_field`) REFERENCES `STANDARD_ITEM_FIELD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENT_VALUE`
--

LOCK TABLES `EQUIPMENT_VALUE` WRITE;
/*!40000 ALTER TABLE `EQUIPMENT_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `EQUIPMENT_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIELD_VALUE_SET`
--

DROP TABLE IF EXISTS `FIELD_VALUE_SET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIELD_VALUE_SET` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(45) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  `id_standard_item_field` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_FIELD_VALUE_SET_1_idx` (`id_standard_item_field`),
  CONSTRAINT `fk_FIELD_VALUE_SET_1` FOREIGN KEY (`id_standard_item_field`) REFERENCES `STANDARD_ITEM_FIELD` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIELD_VALUE_SET`
--

LOCK TABLES `FIELD_VALUE_SET` WRITE;
/*!40000 ALTER TABLE `FIELD_VALUE_SET` DISABLE KEYS */;
INSERT INTO `FIELD_VALUE_SET` VALUES (1,'1. szint','1',1),(2,'2. szint','2',1),(3,'3. szint','3',1),(4,'4. szint','4',1),(5,'1. szint','1',2),(6,'2. szint','2',2),(7,'3. szint','3',2),(8,'4. szint','4',2),(9,'5. szint','5',2),(10,'1. szint','1',3),(11,'2. szint','2',3),(12,'3. szint','3',3),(13,'4. szint','4',3),(14,'1. szint','1',4),(15,'2. szint','2',4),(16,'3. szint','3',4),(17,'4. szint','4',4),(18,'A. szint','A',5),(19,'B szint','B',5),(20,'C szint','C',5),(21,'D szint','D',5),(22,'E szint','E',5),(23,'F szint','F',5),(24,'igen','P',6),(25,'nem','',6),(26,'6','6',7),(27,'7','7',7),(28,'8','8',7),(29,'9','9',7),(30,'10','10',7),(31,'11','11',7);
/*!40000 ALTER TABLE `FIELD_VALUE_SET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STANDARD_ITEM`
--

DROP TABLE IF EXISTS `STANDARD_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STANDARD_ITEM` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `standard` varchar(100) NOT NULL,
  `icon` varchar(45) NOT NULL DEFAULT 'undefined.jpg',
  `enabled` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_category_standard_item_idx` (`id_category`),
  CONSTRAINT `fk_category_standard_item` FOREIGN KEY (`id_category`) REFERENCES `CATEGORY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STANDARD_ITEM`
--

LOCK TABLES `STANDARD_ITEM` WRITE;
/*!40000 ALTER TABLE `STANDARD_ITEM` DISABLE KEYS */;
INSERT INTO `STANDARD_ITEM` VALUES (1,4,'Mechanikai veszélyek ellen','MSZ EN 388:2016+A1:2019','undefined.jpg',1),(2,4,'Szemcseszórási műveletekhez','MSZ EN ISO 14877:2003','undefined.jpg',0),(3,4,'Hideg ellen','MSZ EN 511:2006','undefined.jpg',0),(4,4,'Vegyszerek és mikroorganizmusok ellen','MSZ EN ISO 374-1:2016','undefined.jpg',0),(5,4,'Termikus kockázatok ellen','MSZ EN 407:2020','undefined.jpg',0),(6,4,'Hegesztők védőkesztyűi','MSZ EN 12477:2001/A1:2005','undefined.jpg',0),(7,4,'Vágás és szúrás ellen','MSZ EN 1082','undefined.jpg',0),(8,4,'Radioaktív szennyezés ellen','MSZ EN 421:2110','undefined.jpg',0),(9,4,'Ionizáló sugárzás ellen','MSZ EN 421:2010','undefined.jpg',0),(10,4,'Láncfűrészek használói részére','MSZ EN ISO 11393-4:2020','undefined.jpg',0),(11,4,'Szigetelőanyagú kesztyűk','MSZ EN 60903:2004','undefined.jpg',0),(12,4,'Szigatelőanyagú karvédők','MSZ EN 60984:2002','undefined.jpg',0);
/*!40000 ALTER TABLE `STANDARD_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STANDARD_ITEM_FIELD`
--

DROP TABLE IF EXISTS `STANDARD_ITEM_FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STANDARD_ITEM_FIELD` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_standard_item` int NOT NULL,
  `order` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` enum('SELECT','TEXT') NOT NULL,
  `tooltip` varchar(45) DEFAULT NULL,
  `in_standard` tinyint NOT NULL DEFAULT '0',
  `required` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_STANDARD_ITEM_FIELD_idx` (`id_standard_item`),
  CONSTRAINT `fk_STANDARD_ITEM_FIELDS_1` FOREIGN KEY (`id_standard_item`) REFERENCES `STANDARD_ITEM` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STANDARD_ITEM_FIELD`
--

LOCK TABLES `STANDARD_ITEM_FIELD` WRITE;
/*!40000 ALTER TABLE `STANDARD_ITEM_FIELD` DISABLE KEYS */;
INSERT INTO `STANDARD_ITEM_FIELD` VALUES (1,1,1,'Kopásállóság','SELECT','',1,1),(2,1,2,'Késvágással szembeni ellenállás','SELECT','',1,1),(3,1,3,'Továbbszakítással szembeni állóság ','SELECT','',1,1),(4,1,4,'Átlyukasztással szembeni ellenállás','SELECT','',1,1),(5,1,5,'TDM vágási ellenállás','SELECT','',1,1),(6,1,6,'Ütésvédelem','SELECT','',1,1),(7,1,7,'Méret','SELECT','',1,1);
/*!40000 ALTER TABLE `STANDARD_ITEM_FIELD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'Cserjési Szilárd','cserjesi.szilard@bme.hu','ed7e504bada523d45c056c5c072b3305'),(2,'Cserjési Kristóf','cserjesi.kristof@bme.hu','3c6a19c2b20cb3496a9573ef365b8c52');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKER`
--

DROP TABLE IF EXISTS `WORKER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKER` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profession` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_worker_idx` (`id_user`),
  CONSTRAINT `fk_user_worker` FOREIGN KEY (`id_user`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKER`
--

LOCK TABLES `WORKER` WRITE;
/*!40000 ALTER TABLE `WORKER` DISABLE KEYS */;
INSERT INTO `WORKER` VALUES (1,'Tóth János','hegesztő',2),(2,'Cserjési Kristóf','mérnökinformatikus',1);
/*!40000 ALTER TABLE `WORKER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-27  8:47:27
