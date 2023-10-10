-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_twitterbot
CREATE DATABASE IF NOT EXISTS `db_twitterbot` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_twitterbot`;

-- Dumping structure for table db_twitterbot.tbl_earthquake
CREATE TABLE IF NOT EXISTS `tbl_earthquake` (
  `id_earthquake` varchar(100) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `coordinates` varchar(100) NOT NULL,
  `lintang` varchar(100) NOT NULL,
  `bujur` varchar(100) NOT NULL,
  `magnitude` varchar(100) NOT NULL,
  `kedalaman` varchar(100) NOT NULL,
  `wilayah` text DEFAULT NULL,
  `potensi` text DEFAULT NULL,
  `dirasakan` varchar(50) DEFAULT NULL,
  `shakemap` varchar(50) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_earthquake`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_twitterbot.tbl_earthquake: ~1 rows (approximately)
INSERT INTO `tbl_earthquake` (`id_earthquake`, `tanggal`, `jam`, `coordinates`, `lintang`, `bujur`, `magnitude`, `kedalaman`, `wilayah`, `potensi`, `dirasakan`, `shakemap`, `create_date`) VALUES
	('11OKT2023032024WIB', '11 Okt 2023', '03:20:24 WIB', '-6.71,129.89', '6.71 LS', '129.89 BT', '5.0', '181 km', '210 km BaratLaut TANIMBAR', 'Tidak berpotensi tsunami', '-', '20231011032323.mmi.jpg', '2023-10-10 22:41:10');

-- Dumping structure for table db_twitterbot.tbl_earthquaketweet
CREATE TABLE IF NOT EXISTS `tbl_earthquaketweet` (
  `id_earthquake` varchar(100) NOT NULL,
  `earthquaketweet` text NOT NULL,
  `earthquakeimg` varchar(100) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_earthquake`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_twitterbot.tbl_earthquaketweet: ~1 rows (approximately)
INSERT INTO `tbl_earthquaketweet` (`id_earthquake`, `earthquaketweet`, `earthquakeimg`, `create_date`) VALUES
	('11OKT2023032024WIB', 'Gempa Bumi terjadi pada 11 Okt 2023 03:20:24 WIB, di kordinat 6.71 LS (Lintang Selatan), 129.89 BT (Bujur Timur). Memiliki kekuatan magnitudo 5.0 dengan kedalaman 181 KM. Untuk Lokasi 210 km BaratLaut TANIMBAR. Sumber BMKG.', '20231011032323.mmi.jpg', '2023-10-10 22:41:10');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
