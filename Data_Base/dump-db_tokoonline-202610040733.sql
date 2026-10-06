-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tokoonline
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Elektronik'),(2,'Fashion Pria'),(3,'Fashion Wanita'),(4,'Buku'),(5,'Peralatan Rumah');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelanggan` (
  `id_pelanggan` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_hp` varchar(100) NOT NULL,
  `alamat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kota` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1,'Budi Santoso','budi.santoso@email.com','081234567001','Jl. Merdeka No. 10','Jakarta'),(2,'Siti Aminah','siti.aminah@email.com','081234567002','Jl. Sudirman No. 45','Surabaya'),(3,'Andi Wijaya','andi.w@email.com','081234567003','Jl. Diponegoro No. 8','Bandung'),(4,'Rina Marlina','rina.m@email.com','081234567004','Jl. Pahlawan No. 22','Sidoarjo'),(5,'Joko Anwar','joko.a@email.com','081234567005','Jl. Gatot Subroto No. 9','Semarang'),(6,'Dewi Lestari','dewi.l@email.com','081234567006','Jl. Thamrin No. 11','Medan'),(7,'Agus Pratama','agus.p@email.com','081234567007','Jl. Gajah Mada No. 3','Denpasar'),(8,'Maya Sari','maya.s@email.com','081234567008','Jl. Malioboro No. 12','Yogyakarta'),(9,'Hendra Gunawan','hendra.g@email.com','081234567009','Jl. Veteran No. 5','Malang'),(10,'Fitriani','fitriani@email.com','081234567010','Jl. Ahmad Yani No. 15','Makassar'),(11,'Dedi Syahputra','dedi.s@email.com','081234567011','Jl. Imam Bonjol No. 7','Padang'),(12,'Nina Kartika','nina.k@email.com','081234567012','Jl. Pemuda No. 2','Cirebon'),(13,'Reza Rahadian','reza.r@email.com','081234567013','Jl. Surya Kencana No. 9','Bogor'),(14,'Sri Wahyuni','sri.w@email.com','081234567014','Jl. Braga No. 14','Bandung'),(15,'Tommy Sugiarto','tommy.s@email.com','081234567015','Jl. Slamet Riyadi No. 6','Surakarta'),(16,'Dian Sastrowardoyo','dian.s@email.com','081234567016','Jl. Asia Afrika No. 1','Jakarta'),(17,'Eko Yuli Irawan','eko.y@email.com','081234567017','Jl. Basuki Rahmat No. 20','Balikpapan'),(18,'Linda Weni','linda.w@email.com','081234567018','Jl. Urip Sumoharjo No. 4','Pontianak'),(19,'Antonius','antonius@email.com','081234567019','Jl. Pattimura No. 10','Ambon'),(20,'Maria Natalia','maria.n@email.com','081234567020','Jl. Sam Ratulangi No. 5','Manado');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjualan`
--

DROP TABLE IF EXISTS `penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penjualan` (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int DEFAULT NULL,
  `id_produk` int DEFAULT NULL,
  `jumlah` int NOT NULL,
  `total_harga` varchar(100) NOT NULL,
  PRIMARY KEY (`id_penjualan`),
  KEY `penjualan_pelanggan_FK` (`id_pelanggan`),
  KEY `penjualan_produk_FK` (`id_produk`),
  CONSTRAINT `penjualan_pelanggan_FK` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  CONSTRAINT `penjualan_produk_FK` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjualan`
--

LOCK TABLES `penjualan` WRITE;
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
INSERT INTO `penjualan` VALUES (1,1,1,2,'Rp10.000.000'),(2,2,2,4,'Rp4.276.000'),(3,3,3,2,'Rp598.000'),(4,4,4,1,'Rp120.000'),(5,5,5,1,'Rp249.000'),(6,6,6,1,'Rp236.500'),(7,7,7,1,'Rp2.400.000'),(8,8,8,1,'Rp200.000'),(9,9,9,1,'Rp100.000'),(10,10,10,1,'Rp98.000'),(11,11,11,1,'Rp100.000'),(12,12,12,1,'Rp98.000'),(13,13,13,1,'Rp99.000'),(14,14,14,1,'Rp1.500.000'),(15,15,15,1,'Rp600.000'),(16,16,1,1,'Rp5.000.000'),(17,17,2,1,'Rp1.069.000'),(18,18,3,1,'Rp299.000'),(19,19,5,1,'Rp249.000'),(20,20,7,1,'Rp2.400.000');
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produk` (
  `id_produk` int NOT NULL AUTO_INCREMENT,
  `id_kategori` int DEFAULT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` varchar(100) NOT NULL,
  `stok` int NOT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `produk_kategori_FK` (`id_kategori`),
  CONSTRAINT `produk_kategori_FK` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (1,1,'Sony WH-1000XM6','Rp5.000.000',90),(2,1,'JBL Tune 520BT','Rp1.069.000',90),(3,1,'Anker Soundcore R50i NC','Rp299.000',100),(4,2,'Kaos Pria / T-Shirt (Orora)','Rp120.000',80),(5,2,'Polo Shirt (XLUNO Falco Polo)','Rp249.000',100),(6,2,'Kemeja Flanel (Peternation Wool Flanel)','Rp236.500',100),(7,3,'Sweatshirt Flowermardi Needlework','Rp2.400.000',98),(8,3,'Everyday Shirt','Rp200.000',100),(9,3,'Koleksi Blouse dan Outer','Rp200.000',70),(10,4,'Atomic Habits','Rp100.000',223),(11,4,'Filosofi Teras','Rp98.000',234),(12,4,'Laut Bercerita','Rp99.000',123),(13,5,'Vacuum Cleaner','Rp1.500.000',54),(14,5,'Kompor Gas 2 Tungku Rinnai (RI-712GA) ','Rp750.000',78),(15,5,'Rice Cooker Cosmos','Rp600.000',84);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_tokoonline'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-04  7:33:37
