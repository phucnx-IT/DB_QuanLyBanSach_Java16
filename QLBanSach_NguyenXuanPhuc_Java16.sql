-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: QLBanSach
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chu_de`
--

DROP TABLE IF EXISTS `chu_de`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chu_de` (
  `ma_chu_de` varchar(100) NOT NULL,
  `ten_chu_de` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_chu_de`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chu_de`
--

LOCK TABLES `chu_de` WRITE;
/*!40000 ALTER TABLE `chu_de` DISABLE KEYS */;
/*!40000 ALTER TABLE `chu_de` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `don_hang` (
  `ma_don_hang` varchar(100) NOT NULL,
  `da_thanh_toan` bit(1) NOT NULL,
  `ngay_dat` date NOT NULL,
  `ngay_giao` date NOT NULL,
  `tinh_trang_GH` varchar(255) NOT NULL,
  `ma_KH` varchar(100) NOT NULL,
  PRIMARY KEY (`ma_don_hang`),
  KEY `fk_donhang_khachhang` (`ma_KH`),
  CONSTRAINT `fk_donhang_khachhang` FOREIGN KEY (`ma_KH`) REFERENCES `khach_hang` (`ma_KH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang`
--

LOCK TABLES `don_hang` WRITE;
/*!40000 ALTER TABLE `don_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gom`
--

DROP TABLE IF EXISTS `gom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gom` (
  `so_luong` int NOT NULL,
  `don_gia` float NOT NULL,
  `ma_don_hang` varchar(100) NOT NULL,
  `ma_sach` varchar(100) NOT NULL,
  PRIMARY KEY (`ma_don_hang`,`ma_sach`),
  KEY `fk_gom_sach` (`ma_sach`),
  CONSTRAINT `fk_gom_donhang` FOREIGN KEY (`ma_don_hang`) REFERENCES `don_hang` (`ma_don_hang`),
  CONSTRAINT `fk_gom_sach` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gom`
--

LOCK TABLES `gom` WRITE;
/*!40000 ALTER TABLE `gom` DISABLE KEYS */;
/*!40000 ALTER TABLE `gom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `khach_hang` (
  `ma_KH` varchar(100) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `tai_khoan` varchar(100) NOT NULL,
  `mat_khau` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `dien_thoai` varchar(12) NOT NULL,
  `gioi_tinh` varchar(10) NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  PRIMARY KEY (`ma_KH`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nha_xuat_ban`
--

DROP TABLE IF EXISTS `nha_xuat_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nha_xuat_ban` (
  `ma_NSX` varchar(100) NOT NULL,
  `ten_NXB` varchar(255) NOT NULL,
  `dien_thoai` varchar(12) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_NSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_xuat_ban`
--

LOCK TABLES `nha_xuat_ban` WRITE;
/*!40000 ALTER TABLE `nha_xuat_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `nha_xuat_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sach` (
  `ma_sach` varchar(100) NOT NULL,
  `ten_sach` varchar(255) NOT NULL,
  `gia_ban` float NOT NULL,
  `mo_ta` varchar(255) NOT NULL,
  `anh_bia` varchar(255) NOT NULL,
  `ngay_cap_nhat` date NOT NULL,
  `so_luong_ton` int NOT NULL,
  `ma_chu_de` varchar(100) NOT NULL,
  `ma_NSX` varchar(100) NOT NULL,
  PRIMARY KEY (`ma_sach`),
  KEY `fk_sach_chude` (`ma_chu_de`),
  KEY `fk_sach_nhaxuatban` (`ma_NSX`),
  CONSTRAINT `fk_sach_chude` FOREIGN KEY (`ma_chu_de`) REFERENCES `chu_de` (`ma_chu_de`),
  CONSTRAINT `fk_sach_nhaxuatban` FOREIGN KEY (`ma_NSX`) REFERENCES `nha_xuat_ban` (`ma_NSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tac_gia`
--

DROP TABLE IF EXISTS `tac_gia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tac_gia` (
  `ma_tac_gia` varchar(100) NOT NULL,
  `ten_tac_gia` varchar(255) NOT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `dien_thoai` varchar(12) DEFAULT NULL,
  `tieu_su` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_tac_gia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tac_gia`
--

LOCK TABLES `tac_gia` WRITE;
/*!40000 ALTER TABLE `tac_gia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tac_gia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tham_gia`
--

DROP TABLE IF EXISTS `tham_gia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tham_gia` (
  `vai_tro` varchar(255) DEFAULT NULL,
  `vi_tri` varchar(255) DEFAULT NULL,
  `ma_sach` varchar(100) NOT NULL,
  `ma_tac_gia` varchar(100) NOT NULL,
  PRIMARY KEY (`ma_sach`,`ma_tac_gia`),
  KEY `fk_thamgia_tacgia` (`ma_tac_gia`),
  CONSTRAINT `fk_thamgia_sach` FOREIGN KEY (`ma_sach`) REFERENCES `sach` (`ma_sach`),
  CONSTRAINT `fk_thamgia_tacgia` FOREIGN KEY (`ma_tac_gia`) REFERENCES `tac_gia` (`ma_tac_gia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tham_gia`
--

LOCK TABLES `tham_gia` WRITE;
/*!40000 ALTER TABLE `tham_gia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tham_gia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-26 17:40:57
