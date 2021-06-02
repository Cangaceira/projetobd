-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: comercial
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
-- Table structure for table `comclien`
--

DROP TABLE IF EXISTS `comclien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comclien` (
  `n_numeclien` int NOT NULL AUTO_INCREMENT,
  `c_codiclien` varchar(10) DEFAULT NULL,
  `c_nomeclien` varchar(50) DEFAULT NULL,
  `c_razaclien` varchar(50) DEFAULT NULL,
  `d_dataclien` date DEFAULT NULL,
  `c_cnpjclien` varchar(20) DEFAULT NULL,
  `c_foneclien` varchar(15) DEFAULT NULL,
  `c_cidaclien` varchar(50) DEFAULT NULL,
  `c_estaclien` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`n_numeclien`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comclien`
--

LOCK TABLES `comclien` WRITE;
/*!40000 ALTER TABLE `comclien` DISABLE KEYS */;
/*!40000 ALTER TABLE `comclien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comforne`
--

DROP TABLE IF EXISTS `comforne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comforne` (
  `n_numeforne` int NOT NULL AUTO_INCREMENT,
  `c_codiforne` varchar(10) DEFAULT NULL,
  `c_nomeforne` varchar(50) DEFAULT NULL,
  `c_razaforne` varchar(50) DEFAULT NULL,
  `c_foneforne` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`n_numeforne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comforne`
--

LOCK TABLES `comforne` WRITE;
/*!40000 ALTER TABLE `comforne` DISABLE KEYS */;
/*!40000 ALTER TABLE `comforne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comivenda`
--

DROP TABLE IF EXISTS `comivenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comivenda` (
  `n_numeivenda` int NOT NULL AUTO_INCREMENT,
  `n_numevenda` int NOT NULL,
  `n_numeprodu` int NOT NULL,
  `n_valoivenda` float(10,2) DEFAULT NULL,
  `n_qtdeivenda` int DEFAULT NULL,
  `n_descivenda` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`n_numeivenda`),
  KEY `fk_comivenda_comprodu` (`n_numeprodu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comivenda`
--

LOCK TABLES `comivenda` WRITE;
/*!40000 ALTER TABLE `comivenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `comivenda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tri_vendas_ai` AFTER INSERT ON `comivenda` FOR EACH ROW begin
    ## declaro as variáveis que utilizarei
    declare vtotal_itens float(10,2) DEFAULT 0;
    declare vtotal_item float(10,2) DEFAULT 0;
    declare total_item float(10,2);
    DECLARE quantidade_item INT DEFAULT 0; 
    DECLARE endloop INT DEFAULT 0; 

    ## cursor para buscar os itens já registrados da venda
    declare busca_itens cursor for
	select n_valoivenda, n_qtdeivenda
	from comivenda
	where n_numevenda = new.n_numevenda;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '03000' SET endloop = 1;

    ## abro o cursor
    open busca_itens;
	## declaro e inicio o loop
	itens : loop

	IF endloop = 1 THEN LEAVE itens;
	END IF;

	fetch busca_itens into total_item, quantidade_item;

	## somo o valor total dos itens (produtos)
	SET vtotal_item = total_item * quantidade_item;
	SET vtotal_itens = vtotal_itens + vtotal_item;

	end loop itens;
    close busca_itens;

    set vtotal_item = NEW.n_valoivenda * NEW.n_qtdeivenda;

    update comvenda 
    set n_totavenda = vtotal_itens - vtotal_item
    where n_numevenda = new.n_numevenda;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comprodu`
--

DROP TABLE IF EXISTS `comprodu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprodu` (
  `n_numeprodu` int NOT NULL AUTO_INCREMENT,
  `c_codiprodu` varchar(20) DEFAULT NULL,
  `c_descprodu` varchar(100) DEFAULT NULL,
  `n_valoprodu` float(10,2) DEFAULT NULL,
  `c_situprodu` varchar(1) DEFAULT NULL,
  `n_numeforne` int DEFAULT NULL,
  PRIMARY KEY (`n_numeprodu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprodu`
--

LOCK TABLES `comprodu` WRITE;
/*!40000 ALTER TABLE `comprodu` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprodu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comvenda`
--

DROP TABLE IF EXISTS `comvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comvenda` (
  `n_numevenda` int NOT NULL AUTO_INCREMENT,
  `c_codivenda` varchar(10) DEFAULT NULL,
  `n_numeclien` int NOT NULL,
  `n_numeforne` int NOT NULL,
  `n_numevende` int NOT NULL,
  `n_valovenda` float(10,2) DEFAULT NULL,
  `n_descvenda` float(10,2) DEFAULT NULL,
  `n_totavenda` float(10,2) DEFAULT NULL,
  `d_datavenda` date DEFAULT NULL,
  `n_vcomvenda` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`n_numevenda`),
  KEY `fk_comprodu_conforne` (`n_numeforne`),
  KEY `fk_comvenda_comclien` (`n_numeclien`),
  KEY `fk_comvenda_comvende` (`n_numevende`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comvenda`
--

LOCK TABLES `comvenda` WRITE;
/*!40000 ALTER TABLE `comvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `comvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comvende`
--

DROP TABLE IF EXISTS `comvende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comvende` (
  `n_numevende` int NOT NULL AUTO_INCREMENT,
  `c_codivende` varchar(10) DEFAULT NULL,
  `c_nomevende` varchar(50) DEFAULT NULL,
  `c_razavende` varchar(50) DEFAULT NULL,
  `c_fonevende` varchar(15) DEFAULT NULL,
  `n_porcvende` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`n_numevende`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comvende`
--

LOCK TABLES `comvende` WRITE;
/*!40000 ALTER TABLE `comvende` DISABLE KEYS */;
/*!40000 ALTER TABLE `comvende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'comercial'
--

--
-- Dumping routines for database 'comercial'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-01 22:18:55
