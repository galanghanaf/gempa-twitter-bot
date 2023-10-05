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

-- Dumping data for table db_twitterbot.tbl_earthquake: ~2 rows (approximately)
INSERT INTO `tbl_earthquake` (`id_earthquake`, `tanggal`, `jam`, `coordinates`, `lintang`, `bujur`, `magnitude`, `kedalaman`, `wilayah`, `potensi`, `dirasakan`, `shakemap`, `create_date`) VALUES
	('04OKT2023185422WIB', '04 Okt 2023', '18:54:22 WIB', '-9.10,124.93', '9.10 LS', '124.93 BT', '3.0', '13 km', 'Pusat gempa berada di darat 6 Km Timur Laut Belu', 'Gempa ini dirasakan untuk diteruskan pada masyarakat', 'II-III Belu', '20231004185422.mmi.jpg', '2023-10-05 00:43:55'),
	('05OKT2023030703WIB', '05 Okt 2023', '03:07:03 WIB', '-0.80,135.85', '0.80 LS', '135.85 BT', '4.1', '14 km', 'Pusat gempa berada didarat 15 km Tenggara Supiori', 'Gempa ini dirasakan untuk diteruskan pada masyarakat', 'II - III Kab. Supiori', '20231005030703.mmi.jpg', '2023-10-05 00:43:55');

-- Dumping structure for table db_twitterbot.tbl_earthquaketweet
CREATE TABLE IF NOT EXISTS `tbl_earthquaketweet` (
  `id_earthquake` varchar(100) NOT NULL,
  `earthquaketweet` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_earthquake`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_twitterbot.tbl_earthquaketweet: ~2 rows (approximately)
INSERT INTO `tbl_earthquaketweet` (`id_earthquake`, `earthquaketweet`, `create_date`) VALUES
	('04OKT2023185422WIB', 'Gempa Bumi terjadi pada 04 Okt 2023 18:54:22 WIB, di kordinat 9.10 LS (Lintang Selatan), 124.93 BT (Bujur Timur), dengan kedalaman 13 KM. Pusat gempa berada di darat 6 Km Timur Laut Belu. Sumber BMKG.', '2023-10-05 00:44:44'),
	('05OKT2023030703WIB', 'Gempa Bumi terjadi pada 05 Okt 2023 03:07:03 WIB, di kordinat 0.80 LS (Lintang Selatan), 135.85 BT (Bujur Timur). Memiliki kekuatan magnitudo 4.1 dengan kedalaman 14 KM. Pusat gempa berada didarat 15 km Tenggara Supiori. Sumber BMKG.', '2023-10-05 00:44:44');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
