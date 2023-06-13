-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemacondominios
-- ------------------------------------------------------
-- Server version	5.7.28-log
DROP DATABASE IF EXISTS sistemacondominios;
CREATE DATABASE IF NOT EXISTS sistemacondominios;
USE sistemacondominios;

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
-- Table structure for table `condominiums`
--

DROP TABLE IF EXISTS `condominiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condominiums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condominiums`
--

LOCK TABLES `condominiums` WRITE;
/*!40000 ALTER TABLE `condominiums` DISABLE KEYS */;
/*!40000 ALTER TABLE `condominiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_types`
--

DROP TABLE IF EXISTS `department_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_types`
--

LOCK TABLES `department_types` WRITE;
/*!40000 ALTER TABLE `department_types` DISABLE KEYS */;
INSERT INTO `department_types` VALUES (1,'Básico'),(2,'Inmobiliario'),(3,'Duplex'),(4,'Estudio convertible'),(5,'Penthouse');
/*!40000 ALTER TABLE `department_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `number_rooms` int(11) DEFAULT NULL,
  `square_meters` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `department_types_id` int(11) DEFAULT NULL,
  `tower_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoenhyj8ktoqqy10l5lh6ckekk` (`department_types_id`),
  KEY `FKpdxhktut4d48wrjwehlm1mpab` (`tower_id`),
  KEY `FKounkqrfjtcgha7kjt1ve42fcf` (`user_id`),
  CONSTRAINT `FKoenhyj8ktoqqy10l5lh6ckekk` FOREIGN KEY (`department_types_id`) REFERENCES `department_types` (`id`),
  CONSTRAINT `FKounkqrfjtcgha7kjt1ve42fcf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKpdxhktut4d48wrjwehlm1mpab` FOREIGN KEY (`tower_id`) REFERENCES `towers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,2,'Departamento 1',201,4,120,1,3,1,2,'2022-05-17 13:23:24'),(2,3,'Department 2',302,6,140,1,5,2,9,'2022-05-17 13:23:24'),(3,2,'Departamento 3',203,4,120,1,3,1,2,'2022-05-17 13:23:24'),(4,5,'8va maravilla',545,5,120,1,4,1,2,'2022-05-17 13:23:24'),(5,5,'La orquídea azul',546,5,120,0,1,1,2,'2022-05-17 17:33:36'),(6,5,'La orquídea azul 2',545,5,120,0,5,1,2,'2022-05-17 17:45:45'),(7,2,'Departamento 4',204,5,130,0,3,1,2,'2022-05-17 17:47:04'),(8,2,'Departamento 5',205,5,130,0,3,1,2,'2022-05-17 17:47:56'),(9,2,'Departamento 6',206,5,130,0,3,1,2,'2022-05-17 17:48:51'),(10,2,'Departamento 7',207,5,130,0,3,1,2,'2022-05-17 17:52:09'),(11,2,'La orquídea azul 3',208,5,120,0,2,1,2,'2022-05-17 17:58:47'),(12,2,'La orquídea azul 4',209,5,120,0,4,1,2,'2022-05-17 18:00:05');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidences`
--

DROP TABLE IF EXISTS `incidences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `incidence_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8p7raggesywj5ohlr3fm1qake` (`department_id`),
  KEY `FK418qpvql5d6x7r3pe2kakdwt2` (`user_id`),
  CONSTRAINT `FK418qpvql5d6x7r3pe2kakdwt2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK8p7raggesywj5ohlr3fm1qake` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidences`
--

LOCK TABLES `incidences` WRITE;
/*!40000 ALTER TABLE `incidences` DISABLE KEYS */;
INSERT INTO `incidences` VALUES (2,'ruidos molestos','Ruidos hasta las 3am','2022-06-23 19:00:00',1,3,2,'2022-06-27 20:00:11'),(3,'ruidos molestos','Ruidos hasta las 3am','2022-06-23 19:00:00',1,1,1,'2022-06-27 20:10:13'),(4,'filtraciones','Goteras en el techo','2022-06-23 19:00:00',1,5,2,'2022-06-27 20:11:16'),(5,'ruidos molestos','Ruidos hasta las 5am','2022-06-23 19:00:00',2,3,2,'2022-06-27 20:16:01'),(6,'ruidos molestos','Ruidos hasta las 5am','2022-06-23 19:00:00',2,3,2,'2022-06-27 20:24:56'),(7,'ruidos molestos','Ruidos hasta las 5am','2022-06-23 19:00:00',2,3,2,'2022-06-27 20:25:41'),(8,'ruidos molestos','Ruidos hasta las 4am','2022-06-17 23:00:00',1,10,1,'2022-06-28 16:13:04');
/*!40000 ALTER TABLE `incidences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascots`
--

DROP TABLE IF EXISTS `mascots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `race` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7dbynf95neox6dccbjdak387b` (`user_id`),
  KEY `FK6qrcrw1jolp0cvarg074r430a` (`department_id`),
  CONSTRAINT `FK6qrcrw1jolp0cvarg074r430a` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `FK7dbynf95neox6dccbjdak387b` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascots`
--

LOCK TABLES `mascots` WRITE;
/*!40000 ALTER TABLE `mascots` DISABLE KEYS */;
INSERT INTO `mascots` VALUES (1,'Rocky 2','pekines','macho',2,3,'2022-05-17 13:23:24',1),(2,'Rocky','doberman','macho',2,3,'2022-05-17 13:23:24',0),(3,'Firulais','pitbull','macho',2,2,'2022-05-17 13:23:24',0),(5,'Firulais 2','rottweiler','macho',2,5,'2022-06-25 20:24:57',1),(6,'Como tú','pitbull','macho',2,1,'2022-06-25 20:56:23',0);
/*!40000 ALTER TABLE `mascots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_receipts`
--

DROP TABLE IF EXISTS `payment_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `month` int(11) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `period_date` datetime DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_payment_date` datetime DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `type_service_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc64pq0j576sswgc1jsqq5letl` (`department_id`),
  KEY `FKo9ea4tfc8pdu2x9d39tt2b05w` (`type_service_id`),
  KEY `FK5sa73914j72vskjxn5kvjpoc9` (`user_id`),
  CONSTRAINT `FK5sa73914j72vskjxn5kvjpoc9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKc64pq0j576sswgc1jsqq5letl` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `FKo9ea4tfc8pdu2x9d39tt2b05w` FOREIGN KEY (`type_service_id`) REFERENCES `type_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_receipts`
--

LOCK TABLES `payment_receipts` WRITE;
/*!40000 ALTER TABLE `payment_receipts` DISABLE KEYS */;
INSERT INTO `payment_receipts` VALUES (1,60,'2020-02-05 19:00:00',1,'2020-01-31 19:00:00','2019-12-31 19:00:00','2022-06-28 03:06:50',2,'2022-06-28 10:14:05',1,2,1),(2,60,'2020-03-05 19:00:00',2,'2020-02-29 19:00:00','2020-02-29 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(3,60,'2020-04-05 19:00:00',3,'2020-03-31 19:00:00','2020-03-31 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(4,60,'2020-05-05 19:00:00',4,'2020-04-30 19:00:00','2020-04-30 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(5,60,'2020-06-05 19:00:00',5,'2020-05-31 19:00:00','2020-05-31 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(6,60,'2020-07-05 19:00:00',6,'2020-06-30 19:00:00','2020-06-30 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(7,60,'2020-08-05 19:00:00',7,'2020-07-31 19:00:00','2020-07-31 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(8,60,'2020-09-05 19:00:00',8,'2020-08-31 19:00:00','2020-08-31 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(9,60,'2020-10-05 19:00:00',9,'2020-09-30 19:00:00','2020-09-30 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(10,60,'2020-11-05 19:00:00',10,'2020-10-31 19:00:00','2020-10-31 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(11,60,'2020-12-05 19:00:00',11,'2020-11-30 19:00:00','2020-11-30 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(12,60,'2021-01-05 19:00:00',12,'2020-12-31 19:00:00','2020-12-31 19:00:00','2022-06-28 15:06:50',1,NULL,1,2,1),(13,60,'2019-02-05 19:00:00',1,'2019-01-31 19:00:00','2019-01-31 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(14,60,'2019-03-05 19:00:00',2,'2019-02-28 19:00:00','2019-02-28 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(15,60,'2019-04-05 19:00:00',3,'2019-03-31 19:00:00','2019-03-31 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(16,60,'2019-05-05 19:00:00',4,'2019-04-30 19:00:00','2019-04-30 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(17,60,'2019-06-05 19:00:00',5,'2019-05-31 19:00:00','2019-05-31 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(18,60,'2019-07-05 19:00:00',6,'2019-06-30 19:00:00','2019-06-30 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(19,60,'2019-08-05 19:00:00',7,'2019-07-31 19:00:00','2019-07-31 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(20,60,'2019-09-05 19:00:00',8,'2019-08-31 19:00:00','2019-08-31 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(21,60,'2019-10-05 19:00:00',9,'2019-09-30 19:00:00','2019-09-30 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(22,60,'2019-11-05 19:00:00',10,'2019-10-31 19:00:00','2019-10-31 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(23,60,'2019-12-05 19:00:00',11,'2019-11-30 19:00:00','2019-11-30 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(24,60,'2020-01-05 19:00:00',12,'2019-12-31 19:00:00','2019-12-31 19:00:00','2022-06-28 15:13:28',1,NULL,2,3,1),(25,50,'2022-02-05 19:00:00',1,'2022-01-31 19:00:00','2022-01-31 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(26,50,'2022-03-05 19:00:00',2,'2022-02-28 19:00:00','2022-02-28 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(27,50,'2022-04-05 19:00:00',3,'2022-03-31 19:00:00','2022-03-31 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(28,50,'2022-05-05 19:00:00',4,'2022-04-30 19:00:00','2022-04-30 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(29,50,'2022-06-05 19:00:00',5,'2022-05-31 19:00:00','2022-05-31 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(30,50,'2022-07-05 19:00:00',6,'2022-06-30 19:00:00','2022-06-30 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(31,50,'2022-08-05 19:00:00',7,'2022-07-31 19:00:00','2022-07-31 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(32,50,'2022-09-05 19:00:00',8,'2022-08-31 19:00:00','2022-08-31 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(33,50,'2022-10-05 19:00:00',9,'2022-09-30 19:00:00','2022-09-30 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(34,50,'2022-11-05 19:00:00',10,'2022-10-31 19:00:00','2022-10-31 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(35,50,'2022-12-05 19:00:00',11,'2022-11-30 19:00:00','2022-11-30 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1),(36,50,'2023-01-05 19:00:00',12,'2022-12-31 19:00:00','2022-12-31 19:00:00','2022-06-28 15:43:32',1,NULL,4,1,1);
/*!40000 ALTER TABLE `payment_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER'),(3,'ROLE_OWNER'),(4,'ROLE_COUNTER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towers`
--

DROP TABLE IF EXISTS `towers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `towers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towers`
--

LOCK TABLES `towers` WRITE;
/*!40000 ALTER TABLE `towers` DISABLE KEYS */;
INSERT INTO `towers` VALUES (1,'Torre 1'),(2,'Torre 2'),(3,'Torre 3'),(4,'Torre 4'),(5,'Torre 5'),(6,'Torre 6');
/*!40000 ALTER TABLE `towers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_service`
--

DROP TABLE IF EXISTS `type_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_service`
--

LOCK TABLES `type_service` WRITE;
/*!40000 ALTER TABLE `type_service` DISABLE KEYS */;
INSERT INTO `type_service` VALUES (1,'Servicio de Agua'),(2,'Seguridad y vigilancia'),(3,'Mantenimiento'),(4,'Electricidad'),(5,'Limpieza'),(6,'Administración');
/*!40000 ALTER TABLE `type_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `join_date` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK_6aphui3g30h49muho4c91n0yl` (`dni`),
  UNIQUE KEY `UK_du5v5sr43g5bfnji4vb8hg5s3` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'12345678','admin@admin.com','2022-05-17 13:23:24','Admin','$2a$10$U1nMZ7JjfGl4x0NTK3yR5uhxd0IzW7eNFsbDCshPTeHcWmhmF7.W2','987654321',0,'admin'),(2,'88554488','grupo4@gmail.com','2022-05-17 13:23:32','Grupo4','$2a$10$SwYCHAYdcrKYoNJ5mbuirOiLezoGW4oeISlFIUi0DRTN6oyBlYt9m',NULL,0,'grupo4'),(9,'85858585','usuarioupdate@correo.com','2022-05-25 20:54:32','Usuario update','$2a$10$axKzoaFVqsP.RNABwOFGme00McFiG7eKNzRfpCSpaedA5ntnRUlJi','959959959',0,'usuarioupdate'),(12,'35353535','juan@correo.com','2022-05-28 21:14:44','Paul','$2a$10$L8HPhQ2unTKZq6J3m5E92.AzntaqR76aQQlZH3kLw6rt/v7IvXROC','953953953',0,'juan'),(13,'85274444','arcangelupdate@correo.com','2022-06-27 15:15:19','Carlos','$2a$10$T0dUyzJXYX1CKJ22J1XweO.WtEu1X.WtUFRWrUHQfQW8ChXU/aQ1O','988888888',0,'Carlosupdate'),(14,'98653214','sylveste@counter.com','2022-06-27 20:39:04','Sylvester Stallone','$2a$10$41aD7zcrSojlB7aUo/dRDuLmTyFarApbcIcxFRXFWU.6iZaEAZeum','986235657',0,'Sylvester Stan');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,3),(9,3),(12,3),(13,3),(14,4);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_213nyjqas00eej8nwrl9746pg` (`dni`),
  UNIQUE KEY `UK_ploijcoawdgipdjiwslu5uej8` (`lastname`),
  UNIQUE KEY `UK_akhuttu5d8ajdf8rnmoqu1sv8` (`name`),
  UNIQUE KEY `UK_5q8hetfutjwkgxbh3q810nm4b` (`phone`),
  KEY `FKfy3qdbyjipmx7sc3tnh5jime9` (`user_id`),
  CONSTRAINT `FKfy3qdbyjipmx7sc3tnh5jime9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'84586587','Pezo','Jose','951478965',2),(2,'84586586','Kenedyn Ascencio','Lucho','951951951',2),(3,'85296374','Rivera Talia','Vitalia','996655887',2),(4,'85236974','Apellido de Visitante','Visitante','985698745',13);
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `entryDate` datetime DEFAULT NULL,
  `estimatedDate` datetime DEFAULT NULL,
  `exitDate` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `visitor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh88ac3nnsfroplfhj358blrej` (`department_id`),
  KEY `FKtfumkdqm9bk2e7m5wqx5k1xck` (`visitor_id`),
  CONSTRAINT `FKh88ac3nnsfroplfhj358blrej` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `FKtfumkdqm9bk2e7m5wqx5k1xck` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,'','2022-06-19 19:08:06','2022-06-29 16:30:00','2022-06-27 22:04:55',1,1,2),(3,'','2022-06-27 15:28:08','2022-06-29 16:30:00',NULL,0,3,1);
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-28 16:15:11
