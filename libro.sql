-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: libros
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `biografia` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Gabriel Garcia Marquez','Aracataca, Magdalena, 6 de marzo de 1927-Ciudad de México, 17 de abril de 2014'),(2,'Mario Vargas Llosa','Arequipa, 28 de marzo de 1936'),(3,'Jorge Zalamea','Bogotá, 8 de marzo de 1905 - 10 de mayo de 1969'),(4,'Martin Luis Guzman','Chihuahua, 6 de octubre de 1887 - Ciudad de México, 22 de diciembre de 1976'),(5,'Carlos Fuentes','Ciudad de Panamá, 11 de noviembre de 1928-Ciudad de México, 15 de mayo de 2012'),(6,'Mario Puzo','Manhattan, Nueva York, 15 de octubre de 1920-West Bay Shore, Nueva York, 2 de julio de 1999'),(7,'Emely Bronte','Thornton, 30 de julio de 1818 - Haworth, 19 de diciembre de 1848'),(8,'Isabel Allende','Lima, Perú, 2 de agosto de 1942'),(9,'Victor Hugo','Besanzón, 26 de febrero de 1802-París, 22 de mayo de 1885');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Renacimiento'),(2,'Editorial Losada'),(3,'Editorial Porrua'),(4,'Seix Barral'),(5,'Putnam'),(6,'Debolsillo');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriallibro`
--

DROP TABLE IF EXISTS `editoriallibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoriallibro` (
  `libro` int(11) NOT NULL,
  `editorial` int(11) NOT NULL,
  PRIMARY KEY (`libro`,`editorial`),
  KEY `editorial` (`editorial`),
  CONSTRAINT `editoriallibro_ibfk_1` FOREIGN KEY (`libro`) REFERENCES `libro` (`id`) ON DELETE CASCADE,
  CONSTRAINT `editoriallibro_ibfk_2` FOREIGN KEY (`editorial`) REFERENCES `editorial` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriallibro`
--

LOCK TABLES `editoriallibro` WRITE;
/*!40000 ALTER TABLE `editoriallibro` DISABLE KEYS */;
INSERT INTO `editoriallibro` VALUES (1,6),(2,1),(3,2),(4,3),(5,4),(6,4),(7,5),(8,4),(9,4),(10,4);
/*!40000 ALTER TABLE `editoriallibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Ficción'),(2,'Novela'),(3,'Ficción Literaria'),(4,'Drama');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generolibro`
--

DROP TABLE IF EXISTS `generolibro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generolibro` (
  `libro` int(11) NOT NULL,
  `genero` int(11) NOT NULL,
  PRIMARY KEY (`libro`,`genero`),
  KEY `genero` (`genero`),
  CONSTRAINT `generolibro_ibfk_1` FOREIGN KEY (`libro`) REFERENCES `libro` (`id`) ON DELETE CASCADE,
  CONSTRAINT `generolibro_ibfk_2` FOREIGN KEY (`genero`) REFERENCES `genero` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generolibro`
--

LOCK TABLES `generolibro` WRITE;
/*!40000 ALTER TABLE `generolibro` DISABLE KEYS */;
INSERT INTO `generolibro` VALUES (1,1),(2,2),(2,3),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4);
/*!40000 ALTER TABLE `generolibro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `pais` int(11) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `numeroPaginas` int(11) DEFAULT NULL,
  `fechaPublicacion` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pais` (`pais`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`pais`) REFERENCES `pais` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Doce cuentos peregrinos',1,'9788497592444','Relatos magistrales de amor, muerte, soledad y esperanza en America Latina',232,1992),(2,'La ciudad y los perros',2,'978-8437608727','Una novela que explora la violencia, la corrupcion y la busqueda de la identidad en un colegio militar en Perú.',448,1963),(3,'El Cristo de espaldas',1,'978-950-03-2643-4','Novela del autor argentino José Bianco que trata sobre un hombre que busca el sentido de la vida a través de su propia existencia y de la religión.',224,1954),(4,'La sombra del caudillo',3,'978-968-16-0585-0','Un relato de la Revolución Mexicana y sus implicaciones políticas, escrito por Martín Luis Guzmán.',272,1929),(5,'La casa verde',2,'978-84-204-0378-7','Novela de Mario Vargas Llosa que narra la vida en una casa de prostitución en el Perú, entrelazando varias historias.',416,1966),(6,'Terra Nostra',3,'978-84-339-4402-7','Una obra monumental de Carlos Fuentes que explora la historia y la identidad de México.',592,1975),(7,'El padrino',4,'978-84-261-2000-2','La novela de Mario Puzo que narra la vida de la familia Corleone y su lucha por el poder en el mundo de la mafia.',416,1969),(8,'Cumbres borrascosas',5,'978-84-204-1157-7','Una historia de amor y venganza en un entorno rural inglés, escrita por Emily Brontë.',320,1947),(9,'La casa de los espíritus',6,'978-84-376-0494-7','Una novela de Isabel Allende que narra la historia de varias generaciones de una familia chilena, combinando elementos de realismo mágico.',448,1982),(10,'Los miserables',7,'978-84-206-1246-0','Una obra maestra de Victor Hugo que trata sobre la redención y la lucha por la justicia en la Francia del siglo XIX.',1463,1962);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libroautor`
--

DROP TABLE IF EXISTS `libroautor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libroautor` (
  `libro` int(11) NOT NULL,
  `autor` int(11) NOT NULL,
  PRIMARY KEY (`libro`,`autor`),
  KEY `autor` (`autor`),
  CONSTRAINT `libroautor_ibfk_1` FOREIGN KEY (`libro`) REFERENCES `libro` (`id`) ON DELETE CASCADE,
  CONSTRAINT `libroautor_ibfk_2` FOREIGN KEY (`autor`) REFERENCES `autor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libroautor`
--

LOCK TABLES `libroautor` WRITE;
/*!40000 ALTER TABLE `libroautor` DISABLE KEYS */;
INSERT INTO `libroautor` VALUES (1,1),(2,2),(3,3),(4,4),(5,2),(6,5),(7,6),(8,7),(9,8),(10,9);
/*!40000 ALTER TABLE `libroautor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Colombia'),(2,'Perú'),(3,'Mexico'),(4,'Estados Unidos'),(5,'Inglaterra'),(6,'Chile'),(7,'Francia');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'libros'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-08 19:45:03
