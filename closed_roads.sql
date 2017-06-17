SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `closed_roads` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `closed_roads`;

CREATE TABLE `android_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` text NOT NULL,
  `model` text NOT NULL,
  `serial` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `localizacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concelho` text COLLATE utf8_unicode_ci NOT NULL,
  `nome_via` text COLLATE utf8_unicode_ci NOT NULL,
  `localizacao` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` text COLLATE utf8_unicode_ci NOT NULL,
  `justificacao` text COLLATE utf8_unicode_ci NOT NULL,
  `data_encerramento` text COLLATE utf8_unicode_ci NOT NULL,
  `data_reabertura` text COLLATE utf8_unicode_ci NOT NULL,
  `hora_encerramento` time NOT NULL,
  `hora_reabertura` time NOT NULL,
  `latitude_inicio` double NOT NULL,
  `longitude_inicio` double NOT NULL,
  `latitude_fim` double NOT NULL,
  `longitude_fim` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
