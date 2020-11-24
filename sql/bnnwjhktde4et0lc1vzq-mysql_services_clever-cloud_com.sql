-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bnnwjhktde4et0lc1vzq-mysql.services.clever-cloud.com:3306
-- Generation Time: Nov 13, 2020 at 04:53 PM
-- Server version: 8.0.15-5
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bnnwjhktde4et0lc1vzq`
--
CREATE DATABASE IF NOT EXISTS `bnnwjhktde4et0lc1vzq` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bnnwjhktde4et0lc1vzq`;

-- --------------------------------------------------------

--
-- Table structure for table `Perfil`
--

CREATE TABLE `Perfil` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `CORREO` varchar(100) NOT NULL,
  `TEORIA` varchar(500) NOT NULL,
  `PREGUNTAS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Preguntas`
--

CREATE TABLE `Preguntas` (
  `ID_PREGUNTAS` int(11) NOT NULL,
  `PREGUNTA` varchar(200) NOT NULL,
  `TIPO_PREG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Premios`
--

CREATE TABLE `Premios` (
  `ID_PERFIL` int(11) NOT NULL,
  `Logros` varchar(100) NOT NULL,
  `Puntuaciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Respuestas`
--

CREATE TABLE `Respuestas` (
  `ID_Respuestas` int(11) NOT NULL,
  `RESPUESTA` varchar(100) NOT NULL,
  `VALOR` tinyint(1) NOT NULL,
  `NUM_PREGUNTA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Perfil`
--
ALTER TABLE `Perfil`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Preguntas`
--
ALTER TABLE `Preguntas`
  ADD PRIMARY KEY (`ID_PREGUNTAS`);

--
-- Indexes for table `Premios`
--
ALTER TABLE `Premios`
  ADD PRIMARY KEY (`ID_PERFIL`);

--
-- Indexes for table `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD PRIMARY KEY (`ID_Respuestas`),
  ADD KEY `NUM_PREGUNTA` (`NUM_PREGUNTA`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Perfil`
--
ALTER TABLE `Perfil`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Preguntas`
--
ALTER TABLE `Preguntas`
  MODIFY `ID_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Premios`
--
ALTER TABLE `Premios`
  MODIFY `ID_PERFIL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Respuestas`
--
ALTER TABLE `Respuestas`
  MODIFY `ID_Respuestas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Preguntas`
--
ALTER TABLE `Preguntas`
  ADD CONSTRAINT `Preguntas_ibfk_1` FOREIGN KEY (`ID_PREGUNTAS`) REFERENCES `Perfil` (`ID`);

--
-- Constraints for table `Premios`
--
ALTER TABLE `Premios`
  ADD CONSTRAINT `Premios_ibfk_1` FOREIGN KEY (`ID_PERFIL`) REFERENCES `Perfil` (`ID`);

--
-- Constraints for table `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD CONSTRAINT `Respuestas_ibfk_1` FOREIGN KEY (`NUM_PREGUNTA`) REFERENCES `Preguntas` (`ID_PREGUNTAS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
