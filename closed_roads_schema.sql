SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `closed_roads` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `closed_roads`;

DROP TABLE IF EXISTS `android_device`;
CREATE TABLE IF NOT EXISTS `android_device` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`manufacturer` text NOT NULL,
	`model` text NOT NULL,
	`serial` text NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `civil_protection`;
CREATE TABLE IF NOT EXISTS `civil_protection` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
	`linkid_inicio` int(11) NOT NULL,
	`linkid_fim` int(11) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `temp_civil_protection`;
CREATE TABLE IF NOT EXISTS `temp_civil_protection` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
	`linkid_inicio` int(11) DEFAULT NULL,
	`linkid_fim` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TRIGGER IF EXISTS `insert_civil_protection`;
DELIMITER $$
CREATE TRIGGER `insert_civil_protection` BEFORE UPDATE ON `temp_civil_protection` FOR EACH ROW 
	BEGIN
        IF (((NEW.linkid_inicio <=> OLD.linkid_inicio) = 0) OR ((NEW.linkid_fim <=> OLD.linkid_fim) = 0))
        THEN
            IF NEW.id NOT IN (SELECT civil_protection.id 
                              FROM civil_protection 
                              WHERE (NEW.id = civil_protection.id)) 
            THEN
				INSERT INTO civil_protection (
					id
					,timestamp
					,concelho
					,nome_via
					,localizacao
					,estado
					,justificacao
					,data_encerramento
					,data_reabertura
					,hora_encerramento
					,hora_reabertura
					,latitude_inicio
					,longitude_inicio
					,latitude_fim
					,longitude_fim
					,linkid_inicio
					,linkid_fim
				) 
                VALUES (
					NEW.id
					,NEW.timestamp
					,NEW.concelho 
					,NEW.nome_via 
					,NEW.localizacao 
					,NEW.estado
					,NEW.justificacao
					,NEW.data_encerramento
					,NEW.data_reabertura
					,NEW.hora_encerramento
					,NEW.hora_reabertura
					,NEW.latitude_inicio
					,NEW.longitude_inicio
					,NEW.latitude_fim
					,NEW.longitude_fim
					,NEW.linkid_inicio
					,NEW.linkid_fim
				);
            ELSE
            	UPDATE civil_protection SET 
                	id = NEW.id,
                    timestamp = NEW.timestamp,
                    concelho = NEW.concelho,
                    nome_via = NEW.nome_via,
                    localizacao = NEW.localizacao,
                    estado = NEW.estado,
                    justificacao = NEW.justificacao,
                    data_encerramento = NEW.data_encerramento,
                    data_reabertura = NEW.data_reabertura,
                    hora_encerramento = NEW.hora_encerramento,
                    hora_reabertura = NEW.hora_reabertura,
                    latitude_inicio = NEW.latitude_inicio,
                    longitude_inicio = NEW.longitude_inicio,
                    latitude_fim = NEW.latitude_fim,
                    longitude_fim = NEW.longitude_fim,
                    linkid_inicio = NEW.linkid_inicio,
                    linkid_fim = NEW.linkid_fim
				WHERE civil_protection.id = NEW.id;
			END IF;
        END IF;
	END
$$
DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;