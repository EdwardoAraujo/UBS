-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 07/08/2024 às 14:27
-- Versão do servidor: 8.3.0
-- Versão do PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `meu-sistema`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$86bGGDyM07ktH89ZIRxknuIzerturtc3kCxLNGON4DpazZmn9uJjC');

-- --------------------------------------------------------

--
-- Estrutura para tabela `consultas`
--

DROP TABLE IF EXISTS `consultas`;
CREATE TABLE IF NOT EXISTS `consultas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_paciente` varchar(100) NOT NULL,
  `idade` int NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `sus` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `ubs_id` int NOT NULL,
  `doutor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ubs_id` (`ubs_id`),
  KEY `doutor_id` (`doutor_id`),
  KEY `nome_paciente` (`nome_paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disponibilidades`
--

DROP TABLE IF EXISTS `disponibilidades`;
CREATE TABLE IF NOT EXISTS `disponibilidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ubs_id` int DEFAULT NULL,
  `doutor_id` int DEFAULT NULL,
  `quantidade_vagas` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ubs_id` (`ubs_id`),
  KEY `doutor_id` (`doutor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `disponibilidades`
--

INSERT INTO `disponibilidades` (`id`, `ubs_id`, `doutor_id`, `quantidade_vagas`, `data`, `hora`) VALUES
(1, 1, 1, 10, '2024-10-10', '07:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `doutores`
--

DROP TABLE IF EXISTS `doutores`;
CREATE TABLE IF NOT EXISTS `doutores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `especialidade_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `especialidade_id` (`especialidade_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `doutores`
--

INSERT INTO `doutores` (`id`, `nome`, `especialidade_id`) VALUES
(1, 'Aquino Regu', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE IF NOT EXISTS `especialidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `especialidades`
--

INSERT INTO `especialidades` (`id`, `nome`) VALUES
(1, 'clinico geral');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `idade` int NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `sus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ubs`
--

DROP TABLE IF EXISTS `ubs`;
CREATE TABLE IF NOT EXISTS `ubs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `ubs`
--

INSERT INTO `ubs` (`id`, `nome`, `endereco`) VALUES
(1, 'rosa moita', 'nova esperança');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
