-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: bddqcm2annee
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiants` (
  `idEtudiant` int NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL,
  `motDePasse` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `new_column` int DEFAULT NULL,
  PRIMARY KEY (`idEtudiant`),
  UNIQUE KEY `idEtudiant` (`idEtudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
INSERT INTO `etudiants` VALUES (1,'ben','1234','Alison','Benjamin','alison.benjamin@hotmail.fr',NULL),(5,'tof','1234','Gand','Christophe','gand.christophe@free.fr',NULL),(6,'lulu','1234','Gand','Lucile','gand.lucile@bbox.fr',NULL),(7,'kevan','123','wu','kevan','kevan122.wu@gmail',NULL),(8,'dadou','7b52009b64fd0a2a49e6d8a939753077792b0554','coucou','David','wsh122.wsh@gmail.com',NULL),(9,'dadou','7b52009b64fd0a2a49e6d8a939753077792b0554','coucou','David','wsh122.wsh@gmail.com',NULL);
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qcmfait`
--

DROP TABLE IF EXISTS `qcmfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qcmfait` (
  `idEtudiant` int NOT NULL,
  `idQuestionnaire` int NOT NULL,
  `dateFait` varchar(10) NOT NULL,
  `point` int NOT NULL,
  PRIMARY KEY (`idEtudiant`,`idQuestionnaire`),
  KEY `idQuestionnaire` (`idQuestionnaire`),
  CONSTRAINT `qcmfait_ibfk_1` FOREIGN KEY (`idQuestionnaire`) REFERENCES `questionnaire` (`idQuestionnaire`),
  CONSTRAINT `qcmfait_ibfk_2` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`idEtudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qcmfait`
--

LOCK TABLES `qcmfait` WRITE;
/*!40000 ALTER TABLE `qcmfait` DISABLE KEYS */;
INSERT INTO `qcmfait` VALUES (1,1,'06-01-2018',0),(1,2,'07-01-2018',0),(5,1,'07-04-2017',0),(5,2,'07-01-2018',0),(5,3,'2017-03-29',0);
/*!40000 ALTER TABLE `qcmfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `idQuestion` int NOT NULL AUTO_INCREMENT,
  `libelleQuestion` varchar(100) NOT NULL,
  `type` int NOT NULL,
  `nbReponse` int NOT NULL,
  `nbBonneReponse` int NOT NULL,
  PRIMARY KEY (`idQuestion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Complétez le titre du film \"L\'étrange histoire de ...\"',1,4,1),(2,'En quelle année est né Woody Alen ?',1,4,1),(3,'Quel est le premier film de Léonardo Di Caprio ?',1,4,1),(4,'Qui jouaient dans le film \"Rock N Roll\" ?',1,4,3),(5,'Qui est l’entraîneur d\'Arsenal ?',1,4,1),(6,'En quelle année Nantes a été champion de Fance ?',1,6,4),(7,'Qui est le meilleur buteur de ligue 1 pour l\'année 2015-2016 ?',1,3,1),(8,'Quelle est la hauteur de la tour Eiffel ?',1,3,1),(9,'Qui a écrit l\'étranger ?',1,3,1),(10,'Quelle est la capitale de la Roumanie ?',1,3,1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire`
--

DROP TABLE IF EXISTS `questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire` (
  `idQuestionnaire` int NOT NULL,
  `libelleQuestionnaire` varchar(100) NOT NULL,
  PRIMARY KEY (`idQuestionnaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire`
--

LOCK TABLES `questionnaire` WRITE;
/*!40000 ALTER TABLE `questionnaire` DISABLE KEYS */;
INSERT INTO `questionnaire` VALUES (1,'Cinéma'),(2,'Foot'),(3,'Culture générale');
/*!40000 ALTER TABLE `questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionquestionnaire`
--

DROP TABLE IF EXISTS `questionquestionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionquestionnaire` (
  `idQuestionnaire` int NOT NULL,
  `idQuestion` int NOT NULL,
  PRIMARY KEY (`idQuestionnaire`,`idQuestion`),
  KEY `idQuestion` (`idQuestion`),
  CONSTRAINT `questionquestionnaire_ibfk_1` FOREIGN KEY (`idQuestionnaire`) REFERENCES `questionnaire` (`idQuestionnaire`),
  CONSTRAINT `questionquestionnaire_ibfk_2` FOREIGN KEY (`idQuestion`) REFERENCES `question` (`idQuestion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionquestionnaire`
--

LOCK TABLES `questionquestionnaire` WRITE;
/*!40000 ALTER TABLE `questionquestionnaire` DISABLE KEYS */;
INSERT INTO `questionquestionnaire` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(3,8),(3,9),(3,10);
/*!40000 ALTER TABLE `questionquestionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionreponse`
--

DROP TABLE IF EXISTS `questionreponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionreponse` (
  `idQuestion` int NOT NULL,
  `idReponse` int NOT NULL,
  `ordre` int NOT NULL,
  `bonne` int NOT NULL,
  PRIMARY KEY (`idQuestion`,`idReponse`),
  KEY `idReponse` (`idReponse`),
  CONSTRAINT `questionreponse_ibfk_1` FOREIGN KEY (`idQuestion`) REFERENCES `question` (`idQuestion`),
  CONSTRAINT `questionreponse_ibfk_2` FOREIGN KEY (`idReponse`) REFERENCES `reponse` (`idReponse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionreponse`
--

LOCK TABLES `questionreponse` WRITE;
/*!40000 ALTER TABLE `questionreponse` DISABLE KEYS */;
INSERT INTO `questionreponse` VALUES (1,1,1,0),(1,2,2,1),(1,3,3,0),(1,4,4,0),(2,5,1,0),(2,6,2,1),(2,7,3,0),(2,8,4,0),(3,9,1,0),(3,10,2,1),(3,11,3,0),(4,12,1,1),(4,13,2,0),(4,14,3,1),(4,15,4,1),(5,16,1,0),(5,17,2,0),(5,18,3,1),(5,19,4,0),(6,20,1,0),(6,21,2,1),(6,22,3,1),(6,23,4,1),(6,24,5,0),(6,25,6,1),(7,26,1,1),(7,27,2,0),(7,28,3,0),(8,29,1,0),(8,30,2,1),(8,31,3,0),(9,32,1,0),(9,33,2,0),(9,34,3,1),(10,35,1,1),(10,36,2,0),(10,37,3,0);
/*!40000 ALTER TABLE `questionreponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reponse` (
  `idReponse` int NOT NULL AUTO_INCREMENT,
  `valeur` text NOT NULL,
  `cheminImage` varchar(1000) NOT NULL,
  PRIMARY KEY (`idReponse`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reponse`
--

LOCK TABLES `reponse` WRITE;
/*!40000 ALTER TABLE `reponse` DISABLE KEYS */;
INSERT INTO `reponse` VALUES (1,'Benji',''),(2,'Benjamin Button',''),(3,'Benjamin Gates',''),(4,'Benjamin Constant',''),(5,'1930',''),(6,'1935',''),(7,'1940',''),(8,'1945',''),(9,'Piranha 2',''),(10,'Critters 3',''),(11,'Amityville II',''),(12,'Guillaume Canet',''),(13,'Clovis Cornillac',''),(14,'Marion Cotillard',''),(15,'Gilles Lelouche',''),(16,'Raymond Domenech',''),(17,'Elie Baup',''),(18,'Arsène Wenger',''),(19,'José Mourinho',''),(20,'1964',''),(21,'1965',''),(22,'1980',''),(23,'1983',''),(24,'1986',''),(25,'1995',''),(26,'Edinson Cavani',''),(27,'Alexandre Lacazette',''),(28,'Bafetimbi Gomis',''),(29,'320',''),(30,'324',''),(31,'328',''),(32,'Victor Hugo',''),(33,'Boris Vian',''),(34,'Albert Camus',''),(35,'Bucarest',''),(36,'Budapest',''),(37,'Sofia','');
/*!40000 ALTER TABLE `reponse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-17 16:58:12
