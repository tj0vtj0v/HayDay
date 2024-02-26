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
-- Table structure for table `ore_probability`
--

DROP TABLE IF EXISTS `ore_probability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ore_probability` (
  `id` int NOT NULL,
  `categories` varchar(32) NOT NULL,
  `silver` decimal(4,2) NOT NULL,
  `gold` decimal(4,2) NOT NULL,
  `platinum` decimal(4,2) NOT NULL,
  `iron` decimal(4,2) NOT NULL,
  `coal` decimal(4,2) NOT NULL,
  `diamond` decimal(4,2) NOT NULL,
  `ores_per_diamond` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ore_probability`
--

LOCK TABLES `ore_probability` WRITE;
/*!40000 ALTER TABLE `ore_probability` DISABLE KEYS */;
INSERT INTO `ore_probability` VALUES (0,'dynamite',31.26,19.81,11.46,16.95,20.53,2.39,41.90),(1,'TNT',39.43,16.39,10.21,16.39,17.58,2.38,42.10),(2,'shovel',30.68,20.74,11.93,17.33,19.32,2.84,35.20),(3,'pickaxe',35.79,21.26,9.76,19.74,13.45,2.17,46.10),(4,'overall',33.67,19.08,10.51,17.25,17.13,2.36,42.33),(5,'Mean_Absolute_Error',3.32,1.82,0.85,0.93,2.43,0.18,2.89);
/*!40000 ALTER TABLE `ore_probability` ENABLE KEYS */;
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
