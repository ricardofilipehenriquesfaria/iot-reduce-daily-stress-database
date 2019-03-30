-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 30-Mar-2019 às 23:25
-- Versão do servidor: 5.7.22-0ubuntu0.17.10.1-log
-- PHP Version: 7.1.17-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roads_data`
--
CREATE DATABASE IF NOT EXISTS `roads_data` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `roads_data`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bounding_boxes`
--

DROP TABLE IF EXISTS `bounding_boxes`;
CREATE TABLE IF NOT EXISTS `bounding_boxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_funchal_roads` int(11) NOT NULL,
  `southLatitude` double NOT NULL,
  `northLatitude` double NOT NULL,
  `westLongitude` double NOT NULL,
  `eastLongitude` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `funchal_roads_constraint` (`id_funchal_roads`)
) ENGINE=InnoDB AUTO_INCREMENT=1672 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `bounding_boxes`:
--   `id_funchal_roads`
--       `funchal_roads` -> `id`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `funchal_roads`
--

DROP TABLE IF EXISTS `funchal_roads`;
CREATE TABLE IF NOT EXISTS `funchal_roads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toponimo` text CHARACTER SET latin1 NOT NULL,
  `categoria` text CHARACTER SET latin1 NOT NULL,
  `tipo_uso` text CHARACTER SET latin1 NOT NULL,
  `extensao_via` double NOT NULL,
  `largura_via` double NOT NULL,
  `tipo_pavimento` text CHARACTER SET latin1 NOT NULL,
  `estado_conservacao` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2344 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `funchal_roads`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `polygonpoints`
--

DROP TABLE IF EXISTS `polygonpoints`;
CREATE TABLE IF NOT EXISTS `polygonpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_funchal_roads` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `funchal_roads_polygon_constraint` (`id_funchal_roads`)
) ENGINE=InnoDB AUTO_INCREMENT=9723 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS FOR TABLE `polygonpoints`:
--   `id_funchal_roads`
--       `funchal_roads` -> `id`
--

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `bounding_boxes`
--
ALTER TABLE `bounding_boxes`
  ADD CONSTRAINT `funchal_roads_constraint` FOREIGN KEY (`id_funchal_roads`) REFERENCES `funchal_roads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `polygonpoints`
--
ALTER TABLE `polygonpoints`
  ADD CONSTRAINT `funchal_roads_polygon_constraint` FOREIGN KEY (`id_funchal_roads`) REFERENCES `funchal_roads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
