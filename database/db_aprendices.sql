-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_aprendices
CREATE DATABASE IF NOT EXISTS `db_aprendices` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_aprendices`;

-- Volcando estructura para tabla db_aprendices.aprendiz
CREATE TABLE IF NOT EXISTS `aprendiz` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_persona` bigint NOT NULL,
  `fecha_ingreso` date NOT NULL DEFAULT (curdate()),
  `estado` enum('Activo','Retirado','Graduado') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_persona` (`id_persona`),
  CONSTRAINT `fk_aprendiz_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.aprendiz: ~5 rows (aproximadamente)
INSERT INTO `aprendiz` (`id`, `id_persona`, `fecha_ingreso`, `estado`) VALUES
	(1, 1, '2023-01-10', 'Activo'),
	(2, 2, '2023-01-10', 'Activo'),
	(3, 3, '2023-01-15', 'Activo'),
	(4, 4, '2023-02-01', 'Activo'),
	(5, 5, '2023-03-15', 'Retirado');

-- Volcando estructura para tabla db_aprendices.aprendiz_ficha
CREATE TABLE IF NOT EXISTS `aprendiz_ficha` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_ficha` bigint NOT NULL,
  `id_aprendiz` bigint NOT NULL,
  `fecha_inscripcion` date NOT NULL DEFAULT (curdate()),
  `estado` enum('Activo','Retirado','Graduado') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_aprendiz` (`id_aprendiz`,`id_ficha`),
  KEY `fk_aprendiz_ficha_ficha` (`id_ficha`),
  CONSTRAINT `fk_aprendiz_ficha_aprendiz` FOREIGN KEY (`id_aprendiz`) REFERENCES `aprendiz` (`id`),
  CONSTRAINT `fk_aprendiz_ficha_ficha` FOREIGN KEY (`id_ficha`) REFERENCES `ficha` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.aprendiz_ficha: ~6 rows (aproximadamente)
INSERT INTO `aprendiz_ficha` (`id`, `id_ficha`, `id_aprendiz`, `fecha_inscripcion`, `estado`) VALUES
	(1, 1, 1, '2023-01-10', 'Activo'),
	(2, 1, 2, '2023-01-10', 'Activo'),
	(3, 2, 3, '2023-01-15', 'Activo'),
	(4, 3, 4, '2023-02-01', 'Activo'),
	(5, 4, 1, '2023-01-10', 'Activo'),
	(6, 5, 5, '2023-03-15', 'Retirado');

-- Volcando estructura para tabla db_aprendices.ficha
CREATE TABLE IF NOT EXISTS `ficha` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `id_programa_formacion` bigint NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('Activa','Finalizada','Cancelada') NOT NULL DEFAULT 'Activa',
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  KEY `fk_ficha_programa` (`id_programa_formacion`),
  KEY `idx_ficha_numero` (`numero`),
  CONSTRAINT `fk_ficha_programa` FOREIGN KEY (`id_programa_formacion`) REFERENCES `programa_formacion` (`id`),
  CONSTRAINT `ficha_chk_1` CHECK ((`fecha_fin` > `fecha_inicio`))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.ficha: ~5 rows (aproximadamente)
INSERT INTO `ficha` (`id`, `numero`, `id_programa_formacion`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
	(1, '1234567', 1, '2023-01-15', '2023-12-15', 'Activa'),
	(2, '2345678', 2, '2023-03-01', '2024-06-30', 'Activa'),
	(3, '3456789', 3, '2023-02-10', '2023-08-10', 'Activa'),
	(4, '4567890', 1, '2023-01-15', '2023-12-15', 'Activa'),
	(5, '5678901', 4, '2023-04-05', '2023-11-20', 'Activa');

-- Volcando estructura para tabla db_aprendices.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_tipo_documento` bigint NOT NULL,
  `id_sexo` bigint NOT NULL,
  `id_tipo_sangre` bigint NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_documento` (`numero_documento`),
  KEY `fk_persona_tipo_documento` (`id_tipo_documento`),
  KEY `fk_persona_sexo` (`id_sexo`),
  KEY `fk_persona_tipo_sangre` (`id_tipo_sangre`),
  KEY `idx_persona_documento` (`numero_documento`),
  CONSTRAINT `fk_persona_sexo` FOREIGN KEY (`id_sexo`) REFERENCES `sexo` (`id`),
  CONSTRAINT `fk_persona_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id`),
  CONSTRAINT `fk_persona_tipo_sangre` FOREIGN KEY (`id_tipo_sangre`) REFERENCES `tipo_sangre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.persona: ~5 rows (aproximadamente)
INSERT INTO `persona` (`id`, `id_tipo_documento`, `id_sexo`, `id_tipo_sangre`, `numero_documento`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`) VALUES
	(1, 1, 1, 3, '1234567890', 'Juan', 'Carlos', 'Gómez', 'Pérez', '1995-05-15'),
	(2, 1, 1, 1, '9876543210', 'Pedro', NULL, 'Martínez', 'López', '1998-08-20'),
	(3, 1, 2, 5, '4567891230', 'María', 'Fernanda', 'Rodríguez', 'García', '2000-02-10'),
	(4, 2, 2, 7, '7891234560', 'Ana', 'Sofía', 'Díaz', 'Vargas', '2002-11-30'),
	(5, 1, 3, 2, '3216549870', 'Alex', NULL, 'Torres', 'Jiménez', '1997-04-25');

-- Volcando estructura para tabla db_aprendices.programa_formacion
CREATE TABLE IF NOT EXISTS `programa_formacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `id_tipo_programa` bigint NOT NULL,
  `duracion_horas` int NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_programa_tipo` (`id_tipo_programa`),
  KEY `idx_programa_codigo` (`codigo`),
  CONSTRAINT `fk_programa_tipo` FOREIGN KEY (`id_tipo_programa`) REFERENCES `tipo_programa` (`id`),
  CONSTRAINT `programa_formacion_chk_1` CHECK ((`duracion_horas` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.programa_formacion: ~5 rows (aproximadamente)
INSERT INTO `programa_formacion` (`id`, `nombre`, `codigo`, `id_tipo_programa`, `duracion_horas`, `estado`) VALUES
	(1, 'Técnico en Programación de Software', '228106', 1, 2200, 1),
	(2, 'Tecnólogo en Análisis y Desarrollo de Sistemas', '233102', 2, 3600, 1),
	(3, 'Complementario en Inglés Técnico', '950001', 3, 480, 1),
	(4, 'Técnico en Electricidad Industrial', '226723', 1, 2000, 1),
	(5, 'Complementario en Habilidades Blandas', '950002', 3, 120, 1);

-- Volcando estructura para tabla db_aprendices.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.sexo: ~3 rows (aproximadamente)
INSERT INTO `sexo` (`id`, `nombre`) VALUES
	(2, 'Femenino'),
	(1, 'Masculino'),
	(3, 'Otro');

-- Volcando estructura para tabla db_aprendices.tipo_documento
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.tipo_documento: ~4 rows (aproximadamente)
INSERT INTO `tipo_documento` (`id`, `nombre`) VALUES
	(1, 'Cédula de Ciudadanía'),
	(3, 'Cédula de Extranjería'),
	(4, 'Pasaporte'),
	(2, 'Tarjeta de Identidad');

-- Volcando estructura para tabla db_aprendices.tipo_programa
CREATE TABLE IF NOT EXISTS `tipo_programa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `nivel` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  CONSTRAINT `tipo_programa_chk_1` CHECK ((`nivel` between 0 and 3))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.tipo_programa: ~4 rows (aproximadamente)
INSERT INTO `tipo_programa` (`id`, `nombre`, `nivel`) VALUES
	(1, 'Técnico', 1),
	(2, 'Tecnólogo', 2),
	(3, 'Complementario', 0),
	(4, 'Especialización', 3);

-- Volcando estructura para tabla db_aprendices.tipo_sangre
CREATE TABLE IF NOT EXISTS `tipo_sangre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `grupo` varchar(2) NOT NULL,
  `factor` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo` (`grupo`,`factor`),
  CONSTRAINT `tipo_sangre_chk_1` CHECK ((`grupo` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'AB',_utf8mb4'O'))),
  CONSTRAINT `tipo_sangre_chk_2` CHECK ((`factor` in (_utf8mb4'+',_utf8mb4'-')))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_aprendices.tipo_sangre: ~8 rows (aproximadamente)
INSERT INTO `tipo_sangre` (`id`, `grupo`, `factor`) VALUES
	(2, 'A', '-'),
	(1, 'A', '+'),
	(6, 'AB', '-'),
	(5, 'AB', '+'),
	(4, 'B', '-'),
	(3, 'B', '+'),
	(8, 'O', '-'),
	(7, 'O', '+');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
