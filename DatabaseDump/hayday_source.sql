-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: raspi    Database: hayday
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source` (
  `id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `mastered` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
INSERT INTO `source` VALUES (1,'Animal Product',NULL),(2,'BBQ Grill',NULL),(3,'Bakery',NULL),(4,'Bath Kiosk',NULL),(5,'Cake Oven',NULL),(6,'Candle Maker',NULL),(7,'Candy Machine',NULL),(8,'Coffee Kiosk',NULL),(9,'Dairy',NULL),(10,'Deep Fryer',NULL),(11,'Donut Maker',NULL),(12,'Feed Mill',NULL),(13,'Field',NULL),(14,'Flower Shop',NULL),(15,'Fondue Pot',NULL),(16,'Hat Maker',NULL),(17,'Honey Extractor',NULL),(18,'Hot Dog Stand',NULL),(19,'Ice Cream Maker',NULL),(20,'Jam Maker',NULL),(21,'Jeweler',NULL),(22,'Juice Press',NULL),(23,'Loom',NULL),(24,'Maintenance',NULL),(25,'Mine',NULL),(26,'Pasta Kitchen',NULL),(27,'Pasta Maker',NULL),(28,'Pie Oven',NULL),(29,'Popcorn Pot',NULL),(30,'Pottery Studio',NULL),(31,'Preservation Station',NULL),(32,'Salad Bar',NULL),(33,'Sandwich Bar',NULL),(34,'Sauce Maker',NULL),(35,'Sewing Machine',NULL),(36,'Smelter',NULL),(37,'Smoothie Mixer',NULL),(38,'Soup Kitchen',NULL),(39,'Special',NULL),(40,'Sugar Mill',NULL),(41,'Sushi Bar',NULL),(42,'Taco Kitchen',NULL),(43,'Tea Stand',NULL),(44,'Tree or Bush',NULL),(45,'Wok Kitchen',NULL);
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-26 21:13:19
