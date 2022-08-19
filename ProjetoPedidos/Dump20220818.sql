-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: dados
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CODIGO` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(120) NOT NULL,
  `CIDADE` varchar(100) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Italo da Cunha','Mato Leitão','RS'),(2,'Alemaodoviski','Lajeado','RS'),(3,'Luanel Messi','Cachoeirinha','RS'),(4,'Drogba','Lajeado','RS'),(5,'Diego','Cachoeirinha','RS'),(6,'Larissa','Cachoeirinha','RS'),(7,'Bruna','Cachoeirinha','RS'),(8,'Luiza','Lajeado','RS'),(9,'Mano Klopp','Mato Leitão','RS'),(10,'Tacigol','Mato Leitão','RS'),(11,'Bruna','Lajeado','RS'),(12,'Talissa','Mato Leitão','RS'),(13,'Tuta','Mato Leitão','RS'),(14,'Tales','Mato Leitão','RS'),(15,'Dorival','Campinas','SP'),(16,'Roger','Campinas','SP'),(17,'Pedro','Campinas','SP'),(18,'Taison','Campinas','SP'),(19,'Nina','Santos','SP'),(20,'Talita','Lajeado','RS'),(21,'Marrone','Campinas','SP'),(22,'Diego Showza','Santos','SP'),(23,'Maicon','Santos','SP'),(24,'Vanessa','Santos','SP'),(25,'Pedro','Lajeado','RS');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ped_itens`
--

DROP TABLE IF EXISTS `ped_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ped_itens` (
  `AUTO_INCREM` int NOT NULL AUTO_INCREMENT,
  `NUMERO_PEDIDO` int NOT NULL,
  `CODIGO_PRODUTO` int NOT NULL,
  `QUANTIDADE` int NOT NULL,
  `VALOR_UNITARIO` decimal(6,2) NOT NULL,
  `VALOR_TOTAL` decimal(6,2) NOT NULL,
  PRIMARY KEY (`AUTO_INCREM`),
  KEY `fk_pedido` (`NUMERO_PEDIDO`),
  KEY `fk_produto` (`CODIGO_PRODUTO`),
  CONSTRAINT `fk_pedido` FOREIGN KEY (`NUMERO_PEDIDO`) REFERENCES `pedidos` (`NUMERO_PEDIDO`),
  CONSTRAINT `fk_produto` FOREIGN KEY (`CODIGO_PRODUTO`) REFERENCES `produtos` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ped_itens`
--

LOCK TABLES `ped_itens` WRITE;
/*!40000 ALTER TABLE `ped_itens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ped_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `NUMERO_PEDIDO` int NOT NULL,
  `DATA_EMISSAO` date DEFAULT NULL,
  `CODIGO_CLIENTE` int DEFAULT NULL,
  `VALOR_TOTAL` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`NUMERO_PEDIDO`),
  KEY `fk_cliente` (`CODIGO_CLIENTE`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`CODIGO_CLIENTE`) REFERENCES `clientes` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `CODIGO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(120) NOT NULL,
  `PRECO_VENDA` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Refrigerante Coca-Cola 2L',3.80),(2,'Cerveja Polar 1L',6.49),(3,'Sabão em Pó Omo 2kg',20.99),(4,'Refrigerante Coca-Cola 1L',4.99),(5,'Refrigerante Fruki 2L',4.99),(6,'Refrigerante Fruki 600ML',3.29),(7,'Refrigerante Fruki 1L',3.99),(8,'Refrigerante Fruki 350ML',2.49),(9,'Refrigerante Coca-Cola 350ML',2.99),(10,'Refrigerante Coca-Cola 600ML',3.99),(11,'Creme Dental Colgate MPA 180GR',7.99),(12,'Creme Dental Colgate MPA 90GR',5.99),(13,'Creme Dental Colgate MPA 50GR',3.99),(14,'Papel Bob 60M C/4',3.99),(15,'Papel Bob 90M C/4',4.99),(16,'Papel Bob 60M C/12',14.99),(17,'Detergente Limpol Maça 500ML',2.49),(18,'Detergente Limpol Neutro 500ML',2.49),(19,'Detergente Limpol Limão 500ML',2.49),(20,'Detergente Limpol Lavanda 500ML',2.49),(21,'Arroz Santos 5KG',12.99),(22,'Arroz Santos 1KG',5.99),(23,'Arroz Santos 2KG',7.99),(24,'Amaciante Downy Lavanda 500ML',12.99);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dados'
--

--
-- Dumping routines for database 'dados'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-18 19:54:12
