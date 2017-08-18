SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `roads_data` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `roads_data`;

DROP TABLE IF EXISTS `funchal_roads`;
CREATE TABLE IF NOT EXISTS `funchal_roads` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`toponimo` text NOT NULL,
	`categoria` text NOT NULL,
	`tipo_uso` text NOT NULL,
	`extensao_via` double NOT NULL,
	`largura_via` double NOT NULL,
	`tipo_pavimento` text NOT NULL,
	`estado_conservacao` text NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `bounding_boxes`;
CREATE TABLE `bounding_boxes` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`id_funchal_roads` int(11) NOT NULL,
	`southLatitude` double NOT NULL,
	`northLatitude` double NOT NULL,
	`westLongitude` double NOT NULL,
	`eastLongitude` double NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `polygonpoints`;
CREATE TABLE `polygonpoints` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`id_funchal_roads` int(11) NOT NULL,
	`latitude` double NOT NULL,
	`longitude` double NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;