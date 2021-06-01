-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: aula5
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `mat_aluno` int NOT NULL AUTO_INCREMENT,
  `cod_curso` int DEFAULT NULL,
  `dat_nasc` date NOT NULL,
  `tot_cred` int NOT NULL,
  `mgp` double NOT NULL,
  `nom_alun` varchar(60) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mat_aluno`),
  KEY `fk_cod_curso` (`cod_curso`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,2,'2000-10-05',60,8.75,'Diogo Rodrigues','diogo@gmail.com'),(2,3,'2001-10-05',60,8.75,'Andrea','andrea@gmail.com'),(3,NULL,'2001-10-05',60,8.75,'Pedro','Pedro@gmail.com'),(4,NULL,'2001-10-05',60,8.75,'Alexandre','alexandre@gmail.com'),(5,NULL,'1999-12-01',60,8.75,'Alfredo','alfredo@email.com'),(6,NULL,'1998-12-02',60,8.75,'Beltrano','betinho@email.com'),(7,NULL,'1997-12-02',60,8.75,'Celta','celta_orkuteiro@email.com'),(40,NULL,'1997-12-02',60,8.75,'Faustão','faust_globo@email.com'),(39,NULL,'1997-12-02',60,8.75,'Eleno','leninho@email.com'),(38,NULL,'1997-12-02',60,8.75,'Donzelo','don@email.com'),(36,NULL,'1997-12-02',60,8.75,'Eleno','leninho@email.com'),(37,NULL,'1997-12-02',60,8.75,'Faustão','faust_globo@email.com'),(35,NULL,'1997-12-02',60,8.75,'Donzelo','don@email.com'),(34,NULL,'1997-12-02',60,8.75,'Faustão','feust_globo@email.com'),(33,NULL,'1997-12-02',60,8.75,'Eleno','leninho@email.com'),(32,NULL,'1997-12-02',60,8.75,'Donzelo','don@email.com'),(31,0,'1111-11-01',60,8.2,'abcde','12345@email.com'),(30,0,'0000-00-00',60,8.2,'aaaaaaaa','aaaa@email.com');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `cod_curso` int NOT NULL AUTO_INCREMENT,
  `tot_cred` int DEFAULT NULL,
  `nome_curso` varchar(60) NOT NULL,
  `cod_coord` int NOT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,200,'Egenharia da Computacao',1),(2,320,'Engenharia Eletrica',1),(3,300,'Ciencia da Computacao',1),(4,150,'Sistema de Informacao',2),(5,140,'Egenharia Civil',3);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31 22:21:03
