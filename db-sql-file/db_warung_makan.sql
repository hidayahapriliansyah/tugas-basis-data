-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_warung_makan
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category_menu`
--

DROP TABLE IF EXISTS `category_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_menu` (
  `id` varchar(15) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_menu`
--

LOCK TABLES `category_menu` WRITE;
/*!40000 ALTER TABLE `category_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `created_custom_menu`
--

DROP TABLE IF EXISTS `created_custom_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `created_custom_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `konsumen_username` varchar(8) NOT NULL,
  `custom_menu_group_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_created_custom_menu_x_konsumen` (`konsumen_username`),
  KEY `fk_created_custom_menu_x_custom_menu_group` (`custom_menu_group_id`),
  CONSTRAINT `fk_created_custom_menu_x_custom_menu_group` FOREIGN KEY (`custom_menu_group_id`) REFERENCES `custom_menu_group` (`id`),
  CONSTRAINT `fk_created_custom_menu_x_konsumen` FOREIGN KEY (`konsumen_username`) REFERENCES `konsumen` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `created_custom_menu`
--

LOCK TABLES `created_custom_menu` WRITE;
/*!40000 ALTER TABLE `created_custom_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `created_custom_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_menu_group`
--

DROP TABLE IF EXISTS `custom_menu_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_menu_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `description` text DEFAULT NULL,
  `banyak_material` int(10) unsigned DEFAULT 0,
  `restoran_username` varchar(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_custom_menu_group` (`restoran_username`),
  CONSTRAINT `fk_custom_menu_group` FOREIGN KEY (`restoran_username`) REFERENCES `restoran` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_menu_group`
--

LOCK TABLES `custom_menu_group` WRITE;
/*!40000 ALTER TABLE `custom_menu_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_menu_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_menu_material`
--

DROP TABLE IF EXISTS `custom_menu_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_menu_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `stock_available` int(11) NOT NULL,
  `detail` text DEFAULT NULL,
  `restoran_username` varchar(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_custom_menu_material_restoran` (`restoran_username`),
  CONSTRAINT `fk_custom_menu_material_restoran` FOREIGN KEY (`restoran_username`) REFERENCES `restoran` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_menu_material`
--

LOCK TABLES `custom_menu_material` WRITE;
/*!40000 ALTER TABLE `custom_menu_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_menu_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_menu_material_group`
--

DROP TABLE IF EXISTS `custom_menu_material_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_menu_material_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_menu_group_id` int(10) unsigned NOT NULL,
  `custom_menu_material_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_custom_menu_material_group_x_custom_menu_group` (`custom_menu_group_id`),
  KEY `fk_custom_menu_material_group_x_custom_menu_material` (`custom_menu_material_id`),
  CONSTRAINT `fk_custom_menu_material_group_x_custom_menu_group` FOREIGN KEY (`custom_menu_group_id`) REFERENCES `custom_menu_group` (`id`),
  CONSTRAINT `fk_custom_menu_material_group_x_custom_menu_material` FOREIGN KEY (`custom_menu_material_id`) REFERENCES `custom_menu_material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_menu_material_group`
--

LOCK TABLES `custom_menu_material_group` WRITE;
/*!40000 ALTER TABLE `custom_menu_material_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_menu_material_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_botram`
--

DROP TABLE IF EXISTS `group_botram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_botram` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `jumlah_peserta` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `restoran_username` varchar(8) NOT NULL,
  `konsumen_username` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grup_botram_restoran` (`restoran_username`),
  KEY `fk_grup_botram_konsumen` (`konsumen_username`),
  CONSTRAINT `fk_grup_botram_konsumen` FOREIGN KEY (`konsumen_username`) REFERENCES `konsumen` (`username`),
  CONSTRAINT `fk_grup_botram_restoran` FOREIGN KEY (`restoran_username`) REFERENCES `restoran` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_botram`
--

LOCK TABLES `group_botram` WRITE;
/*!40000 ALTER TABLE `group_botram` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_botram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_botram_admin`
--

DROP TABLE IF EXISTS `group_botram_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_botram_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `konsumen_username` varchar(8) NOT NULL,
  `group_botram_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `konsumen_username_x_group_botram_unique` (`konsumen_username`,`group_botram_id`),
  KEY `fk_group_botram_admin_x_group_botram` (`group_botram_id`),
  CONSTRAINT `fk_group_botram_admin_x_group_botram` FOREIGN KEY (`group_botram_id`) REFERENCES `group_botram` (`id`),
  CONSTRAINT `fk_group_botram_admin_x_konsumen` FOREIGN KEY (`konsumen_username`) REFERENCES `konsumen` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_botram_admin`
--

LOCK TABLES `group_botram_admin` WRITE;
/*!40000 ALTER TABLE `group_botram_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_botram_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konsumen`
--

DROP TABLE IF EXISTS `konsumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konsumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(8) NOT NULL,
  `password` varchar(2550) NOT NULL,
  `email` varchar(25) NOT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token_verifying` varchar(255) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konsumen`
--

LOCK TABLES `konsumen` WRITE;
/*!40000 ALTER TABLE `konsumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `konsumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_pedas`
--

DROP TABLE IF EXISTS `level_pedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_pedas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level_pedas_max` int(10) unsigned NOT NULL,
  `harga_per_level` int(10) unsigned DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `restoran_username` varchar(8) NOT NULL,
  `category_menu_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_level_pedas_restoran` (`restoran_username`),
  KEY `fk_level_pedas_category_menu` (`category_menu_id`),
  CONSTRAINT `fk_level_pedas_category_menu` FOREIGN KEY (`category_menu_id`) REFERENCES `category_menu` (`id`),
  CONSTRAINT `fk_level_pedas_restoran` FOREIGN KEY (`restoran_username`) REFERENCES `restoran` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_pedas`
--

LOCK TABLES `level_pedas` WRITE;
/*!40000 ALTER TABLE `level_pedas` DISABLE KEYS */;
/*!40000 ALTER TABLE `level_pedas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_pedas_pesanan_menu`
--

DROP TABLE IF EXISTS `level_pedas_pesanan_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_pedas_pesanan_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat_kepedasan` int(11) NOT NULL,
  `biaya_tambahan` int(11) DEFAULT 0,
  `level_pedas_id` int(10) unsigned NOT NULL,
  `pesanan_menu_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_level_pedas_pesanan_menu_to_level_pedas` (`level_pedas_id`),
  KEY `fk_level_pedas_pesanan_menu_to_pesanan_menu` (`pesanan_menu_id`),
  CONSTRAINT `fk_level_pedas_pesanan_menu_to_level_pedas` FOREIGN KEY (`level_pedas_id`) REFERENCES `level_pedas` (`id`),
  CONSTRAINT `fk_level_pedas_pesanan_menu_to_pesanan_menu` FOREIGN KEY (`pesanan_menu_id`) REFERENCES `pesanan_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_pedas_pesanan_menu`
--

LOCK TABLES `level_pedas_pesanan_menu` WRITE;
/*!40000 ALTER TABLE `level_pedas_pesanan_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `level_pedas_pesanan_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code_pesanan` varchar(20) DEFAULT NULL,
  `nama` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `stock_available` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `foto1` varchar(255) NOT NULL,
  `foto2` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `restoran_username` varchar(8) NOT NULL,
  `category_menu_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_restoran_unique` (`code_pesanan`,`restoran_username`),
  KEY `fk_menu_restoran` (`restoran_username`),
  KEY `fk_menu_category` (`category_menu_id`),
  CONSTRAINT `fk_menu_category` FOREIGN KEY (`category_menu_id`) REFERENCES `category_menu` (`id`),
  CONSTRAINT `fk_menu_restoran` FOREIGN KEY (`restoran_username`) REFERENCES `restoran` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_group_botram`
--

DROP TABLE IF EXISTS `participant_group_botram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant_group_botram` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_approved` int(11) DEFAULT 0,
  `konsumen_username` varchar(8) NOT NULL,
  `group_botram_id` int(10) unsigned NOT NULL,
  `approved_by_admin_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `konsumen_join_group_botram` (`konsumen_username`,`group_botram_id`),
  KEY `fk_participant_group_botram_x_group_botram` (`group_botram_id`),
  KEY `fk_participant_group_botram_x_group_botram_id` (`approved_by_admin_id`),
  CONSTRAINT `fk_participant_group_botram_x_group_botram` FOREIGN KEY (`group_botram_id`) REFERENCES `group_botram` (`id`),
  CONSTRAINT `fk_participant_group_botram_x_group_botram_id` FOREIGN KEY (`approved_by_admin_id`) REFERENCES `group_botram` (`id`),
  CONSTRAINT `fk_participant_group_botram_x_konsumen` FOREIGN KEY (`konsumen_username`) REFERENCES `konsumen` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_group_botram`
--

LOCK TABLES `participant_group_botram` WRITE;
/*!40000 ALTER TABLE `participant_group_botram` DISABLE KEYS */;
/*!40000 ALTER TABLE `participant_group_botram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan`
--

DROP TABLE IF EXISTS `pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `total_pesanan` int(10) unsigned NOT NULL,
  `ppn_total` int(10) unsigned NOT NULL,
  `all_total` int(10) unsigned NOT NULL,
  `status` enum('nonactive','active','accepted','processed','done') DEFAULT 'nonactive',
  `is_paid` tinyint(1) DEFAULT 0,
  `restoran_username` varchar(8) NOT NULL,
  `konsumen_username` varchar(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_unique` (`kode`),
  KEY `fk_pesanan_botram_restoran` (`restoran_username`),
  KEY `fk_pesanan_botram_konsumen` (`konsumen_username`),
  CONSTRAINT `fk_pesanan_botram_konsumen` FOREIGN KEY (`konsumen_username`) REFERENCES `konsumen` (`username`),
  CONSTRAINT `fk_pesanan_botram_restoran` FOREIGN KEY (`restoran_username`) REFERENCES `restoran` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan`
--

LOCK TABLES `pesanan` WRITE;
/*!40000 ALTER TABLE `pesanan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan_custom_menu`
--

DROP TABLE IF EXISTS `pesanan_custom_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan_custom_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `is_accepted` tinyint(1) DEFAULT 1,
  `created_custom_menu_id` int(10) unsigned NOT NULL,
  `pesanan_kode` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pesanan_custom_menu_x_created_custom_menu` (`created_custom_menu_id`),
  KEY `fk_pesanan_custom_menu_x_pesanan_kode` (`pesanan_kode`),
  CONSTRAINT `fk_pesanan_custom_menu_x_created_custom_menu` FOREIGN KEY (`created_custom_menu_id`) REFERENCES `created_custom_menu` (`id`),
  CONSTRAINT `fk_pesanan_custom_menu_x_pesanan_kode` FOREIGN KEY (`pesanan_kode`) REFERENCES `pesanan` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan_custom_menu`
--

LOCK TABLES `pesanan_custom_menu` WRITE;
/*!40000 ALTER TABLE `pesanan_custom_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan_custom_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan_custom_menu_group_botram`
--

DROP TABLE IF EXISTS `pesanan_custom_menu_group_botram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan_custom_menu_group_botram` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_paid` tinyint(1) DEFAULT 0,
  `paid_confirmed_by_admin_id` int(10) unsigned NOT NULL,
  `is_accepted` tinyint(1) DEFAULT 1,
  `pesanan_custom_menu_id` int(10) unsigned NOT NULL,
  `group_botram_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pesanan_custom_menu_group_botram_x_pesanan_custom_menu` (`pesanan_custom_menu_id`),
  KEY `fk_pesanan_custom_menu_group_botram_x_group_botram` (`group_botram_id`),
  CONSTRAINT `fk_pesanan_custom_menu_group_botram_x_group_botram` FOREIGN KEY (`group_botram_id`) REFERENCES `group_botram` (`id`),
  CONSTRAINT `fk_pesanan_custom_menu_group_botram_x_pesanan_custom_menu` FOREIGN KEY (`pesanan_custom_menu_id`) REFERENCES `pesanan_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan_custom_menu_group_botram`
--

LOCK TABLES `pesanan_custom_menu_group_botram` WRITE;
/*!40000 ALTER TABLE `pesanan_custom_menu_group_botram` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan_custom_menu_group_botram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan_group_botram`
--

DROP TABLE IF EXISTS `pesanan_group_botram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan_group_botram` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_botram_id` int(10) unsigned NOT NULL,
  `pesanan_kode` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_botram_x_pesanan_unique` (`group_botram_id`,`pesanan_kode`),
  KEY `fk_pesanan_group_botram_x_pesanan` (`pesanan_kode`),
  CONSTRAINT `fk_pesanan_group_botram_x_group_botram` FOREIGN KEY (`group_botram_id`) REFERENCES `group_botram` (`id`),
  CONSTRAINT `fk_pesanan_group_botram_x_pesanan` FOREIGN KEY (`pesanan_kode`) REFERENCES `pesanan` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan_group_botram`
--

LOCK TABLES `pesanan_group_botram` WRITE;
/*!40000 ALTER TABLE `pesanan_group_botram` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan_group_botram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan_menu`
--

DROP TABLE IF EXISTS `pesanan_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL,
  `is_accepted` tinyint(1) DEFAULT 1,
  `menu_id` int(10) unsigned NOT NULL,
  `pesanan_kode` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pesanan_menu_menu` (`menu_id`),
  KEY `fk_pesanan_menu_pesanan` (`pesanan_kode`),
  CONSTRAINT `fk_pesanan_menu_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `fk_pesanan_menu_pesanan` FOREIGN KEY (`pesanan_kode`) REFERENCES `pesanan` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan_menu`
--

LOCK TABLES `pesanan_menu` WRITE;
/*!40000 ALTER TABLE `pesanan_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan_menu_group_botram`
--

DROP TABLE IF EXISTS `pesanan_menu_group_botram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan_menu_group_botram` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_paid` tinyint(1) DEFAULT 0,
  `paid_confirmed_by_admin_id` int(10) unsigned NOT NULL,
  `is_accepted` tinyint(1) DEFAULT 1,
  `pesanan_menu_id` int(10) unsigned NOT NULL,
  `group_botram_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pesanan_menu_group_botram_x_pesanan_menu` (`pesanan_menu_id`),
  KEY `fk_pesanan_menu_group_botram_x_group_botram` (`group_botram_id`),
  CONSTRAINT `fk_pesanan_menu_group_botram_x_group_botram` FOREIGN KEY (`group_botram_id`) REFERENCES `group_botram` (`id`),
  CONSTRAINT `fk_pesanan_menu_group_botram_x_pesanan_menu` FOREIGN KEY (`pesanan_menu_id`) REFERENCES `pesanan_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan_menu_group_botram`
--

LOCK TABLES `pesanan_menu_group_botram` WRITE;
/*!40000 ALTER TABLE `pesanan_menu_group_botram` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan_menu_group_botram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picked_custom_menu_material`
--

DROP TABLE IF EXISTS `picked_custom_menu_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picked_custom_menu_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `created_custom_menu_id` int(10) unsigned NOT NULL,
  `custom_menu_material_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `created_custom_menu_x_custom_menu_material_unique` (`created_custom_menu_id`,`custom_menu_material_id`),
  KEY `fk_picked_custom_menu_material_x_custom_menu_material` (`custom_menu_material_id`),
  CONSTRAINT `fk_picked_custom_menu_material_x_created_custom_menu` FOREIGN KEY (`created_custom_menu_id`) REFERENCES `created_custom_menu` (`id`),
  CONSTRAINT `fk_picked_custom_menu_material_x_custom_menu_material` FOREIGN KEY (`custom_menu_material_id`) REFERENCES `custom_menu_material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picked_custom_menu_material`
--

LOCK TABLES `picked_custom_menu_material` WRITE;
/*!40000 ALTER TABLE `picked_custom_menu_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `picked_custom_menu_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppn_active`
--

DROP TABLE IF EXISTS `ppn_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppn_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` enum('persentase','perorder') NOT NULL,
  `value` varchar(5) DEFAULT '0',
  `restoran_username` varchar(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_ppn_active_restoran` (`restoran_username`),
  CONSTRAINT `fk_ppn_active_restoran` FOREIGN KEY (`restoran_username`) REFERENCES `restoran` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppn_active`
--

LOCK TABLES `ppn_active` WRITE;
/*!40000 ALTER TABLE `ppn_active` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppn_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restoran`
--

DROP TABLE IF EXISTS `restoran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restoran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(8) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `email` varchar(25) NOT NULL,
  `process_on_postpaid` tinyint(1) DEFAULT 0,
  `foto_profil` varchar(255) DEFAULT NULL,
  `location_map` text DEFAULT NULL,
  `foto_sampul` varchar(255) DEFAULT NULL,
  `pemilik` varchar(25) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token_verifying` varchar(255) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`),
  UNIQUE KEY `email_unique` (`email`),
  UNIQUE KEY `no_hp_unique` (`no_hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restoran`
--

LOCK TABLES `restoran` WRITE;
/*!40000 ALTER TABLE `restoran` DISABLE KEYS */;
/*!40000 ALTER TABLE `restoran` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04 14:09:09
