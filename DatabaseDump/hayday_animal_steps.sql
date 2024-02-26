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
-- Table structure for table `animal_steps`
--

DROP TABLE IF EXISTS `animal_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_steps` (
  `id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `level` int NOT NULL,
  `experience` int NOT NULL,
  `cooldown` decimal(5,2) NOT NULL,
  `step_value` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_steps`
--

LOCK TABLES `animal_steps` WRITE;
/*!40000 ALTER TABLE `animal_steps` DISABLE KEYS */;
INSERT INTO `animal_steps` VALUES (1,'Chicken',1,2,0.33,1),(2,'Cow',6,3,1.00,1),(3,'Pig',10,5,4.00,1),(4,'Sheep',16,5,6.00,1),(5,'Goat',32,6,8.00,1),(31,'Retriever',20,30,6.00,22),(32,'Sulphur Crested Cockatoo',20,40,6.00,NULL),(33,'Major Mitchell\'s Cockatoo',20,0,6.00,NULL),(34,'Toco Toucan',20,40,6.00,NULL),(35,'Keel-billed Toucan',20,40,6.00,NULL),(36,'Plate-billed Mountain Toucan',20,40,6.00,NULL),(37,'White Peacock',20,40,6.00,NULL),(38,'Brown Peacock',20,40,6.00,NULL),(39,'Blue Peacock',20,40,6.00,NULL),(40,'Rose-Breasted Cockatoo',20,40,6.00,NULL),(41,'Australian Pelican',20,40,6.00,NULL),(42,'Brown Pelican',20,40,6.00,NULL),(43,'Capped Heron',20,40,6.00,NULL),(44,'Tricolored Heron',20,40,6.00,NULL),(45,'Agami Heron',20,40,6.00,NULL),(46,'Dalmatian Pelican',20,40,6.00,NULL),(47,'Tabby Cat',21,20,6.00,26),(48,'Pinscher',22,40,6.00,28),(49,'Calico Cat',23,30,6.00,32),(50,'Bay Horse',27,60,6.00,30),(51,'Hound',30,50,6.00,34),(52,'Tuxedo Cat',31,40,6.00,20),(53,'White Bunny',31,30,6.00,25),(54,'Palomino Horse',32,80,6.00,36),(55,'Pinto Horse',34,100,6.00,42),(56,'Retriever Puppy',35,35,6.00,29),(57,'Black Bunny',38,30,6.00,25),(58,'Andalusian Horse',40,100,6.00,42),(59,'Fluffy Bunny',41,30,6.00,25),(60,'Provence Donkey',43,25,1.00,8),(61,'Lipizzaner Horse',47,100,6.00,42),(62,'Tabby Kitten',49,40,6.00,36),(63,'Pinscher Puppy',50,35,6.00,29),(64,'Anatolian Donkey',52,35,1.00,10),(65,'Hound Puppy',54,35,6.00,29),(66,'Andalusian Donkey',55,30,1.00,9),(67,'Calico Kitten',56,40,6.00,36),(68,'Teddy Guinea Pig',60,40,6.00,20),(69,'Tuxedo Kitten',60,40,6.00,36),(70,'Appaloosa Horse',61,100,6.00,42),(71,'Sheba Guinea Pig',64,40,6.00,NULL),(72,'Silkie Guinea Pig',71,40,6.00,NULL);
/*!40000 ALTER TABLE `animal_steps` ENABLE KEYS */;
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
