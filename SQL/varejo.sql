-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2019 at 01:21 PM
-- Server version: 5.7.24-log
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `varejo`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarHistoricoPedido` (IN `IdPedido` INT)  BEGIN
   SELECT * FROM HistoricoStatus hs
   INNER JOIN StatusPedido sp2 ON hs.IdStatus = sp2.IdStatus	
   WHERE hs.IdPedido = IdPedido
   ORDER BY hs.DataStatus ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarItensPedido` (IN `IdPedido` INT)  BEGIN
	SELECT	p.IdPedido, p.ValorPedido, p.DataPrevisaoEntrega, sp1.Nome AS StatusPedido, 
			pr.IdProduto, pr.Nome, pr.PrecoVenda FROM Pedido p
		INNER JOIN StatusPedido sp1 ON p.IdStatus=sp1.IdStatus
		INNER JOIN ItemPedido itp ON itp.IdPedido=p.IdPedido
		INNER JOIN Produtos pr ON itp.IdProduto=pr.IdProduto
	WHERE p.IdPedido= IdPedido ;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `historicostatus`
--

CREATE TABLE `historicostatus` (
  `IdPedido` int(11) NOT NULL,
  `IdStatus` int(11) NOT NULL,
  `DataStatus` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `historicostatus`
--

INSERT INTO `historicostatus` (`IdPedido`, `IdStatus`, `DataStatus`) VALUES
(1, 1, '2019-06-01 09:53:05'),
(1, 2, '2019-06-01 09:53:56'),
(1, 3, '2019-06-01 10:14:00'),
(1, 5, '2019-06-01 11:51:00'),
(1, 6, '2019-06-02 14:53:56'),
(1, 7, '2019-06-03 16:25:00'),
(2, 1, '2019-06-01 09:53:05'),
(2, 2, '2019-06-01 09:53:56'),
(2, 3, '2019-06-01 10:14:00'),
(2, 5, '2019-06-01 11:51:00'),
(2, 6, '2019-06-02 14:53:56'),
(3, 1, '2019-06-01 09:53:05'),
(3, 2, '2019-06-01 09:53:56'),
(4, 1, '2019-06-01 09:53:05'),
(4, 2, '2019-06-01 09:53:56'),
(4, 4, '2019-06-01 10:14:00'),
(6, 1, '2019-06-01 09:53:05'),
(6, 2, '2019-06-01 09:53:56'),
(6, 3, '2019-06-01 10:14:00'),
(6, 5, '2019-06-01 11:51:00'),
(6, 6, '2019-06-02 14:53:56'),
(6, 7, '2019-06-03 16:25:00'),
(7, 1, '2019-06-01 09:53:05'),
(7, 2, '2019-06-01 09:53:56'),
(7, 3, '2019-06-01 10:14:00'),
(7, 5, '2019-06-01 11:51:00'),
(7, 6, '2019-06-02 14:53:56'),
(7, 7, '2019-06-03 16:25:00'),
(8, 1, '2019-06-01 09:53:05'),
(8, 2, '2019-06-01 09:53:56'),
(8, 4, '2019-06-01 10:14:00'),
(9, 1, '2019-06-01 09:53:05'),
(9, 2, '2019-06-01 09:53:56'),
(9, 3, '2019-06-01 10:14:00'),
(9, 5, '2019-06-01 11:51:00'),
(9, 6, '2019-06-02 14:53:56'),
(9, 7, '2019-06-03 16:25:00'),
(10, 1, '2019-06-01 09:53:05'),
(10, 2, '2019-06-01 09:53:56'),
(10, 3, '2019-06-01 10:14:00'),
(10, 5, '2019-06-01 11:51:00'),
(10, 6, '2019-06-02 14:53:56'),
(10, 7, '2019-06-03 16:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `itempedido`
--

CREATE TABLE `itempedido` (
  `IdPedido` int(11) NOT NULL,
  `IdProduto` int(11) NOT NULL,
  `PrecoVenda` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itempedido`
--

INSERT INTO `itempedido` (`IdPedido`, `IdProduto`, `PrecoVenda`) VALUES
(1, 1, 1000),
(2, 2, 2000),
(3, 3, 5000),
(4, 1, 1000),
(4, 3, 5000),
(6, 2, 2000),
(7, 1, 1000),
(8, 1, 1000),
(8, 2, 2000),
(9, 3, 5000),
(10, 3, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL,
  `IdStatus` int(11) NOT NULL,
  `ValorPedido` double NOT NULL,
  `DataPrevisaoEntrega` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`IdPedido`, `IdStatus`, `ValorPedido`, `DataPrevisaoEntrega`) VALUES
(1, 7, 1000, '2019-06-03 00:00:00'),
(2, 6, 2000, '2019-06-04 00:00:00'),
(3, 2, 5000, '2019-06-08 00:00:00'),
(4, 4, 5000, '2019-06-06 00:00:00'),
(6, 7, 2000, '2019-06-15 00:00:00'),
(7, 7, 1000, '2019-06-10 00:00:00'),
(8, 4, 1000, '2019-06-10 00:00:00'),
(9, 7, 5000, '2019-06-09 00:00:00'),
(10, 7, 5000, '2019-06-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `IdProduto` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `PrecoVenda` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produtos`
--

INSERT INTO `produtos` (`IdProduto`, `Nome`, `PrecoVenda`) VALUES
(1, 'Celular', 1000),
(2, 'TV', 2000),
(3, 'Notebook', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `statuspedido`
--

CREATE TABLE `statuspedido` (
  `IdStatus` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Ordem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuspedido`
--

INSERT INTO `statuspedido` (`IdStatus`, `Nome`, `Ordem`) VALUES
(1, 'Pedido Criado', 1),
(2, 'Análise de Crédito', 2),
(3, 'Pagamento Aprovado', 3),
(4, 'Pagamento Recusado', 3),
(5, 'Separação de Estoque', 4),
(6, 'Em Rota de Entrega', 5),
(7, 'Entregue', 6),
(8, 'Cancelado', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `historicostatus`
--
ALTER TABLE `historicostatus`
  ADD PRIMARY KEY (`IdPedido`,`IdStatus`),
  ADD KEY `FK_StatusPedido_HistoricoStatus` (`IdStatus`);

--
-- Indexes for table `itempedido`
--
ALTER TABLE `itempedido`
  ADD PRIMARY KEY (`IdPedido`,`IdProduto`),
  ADD KEY `FK_Produto_ItemPedido` (`IdProduto`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `FK_StatusPedido_Pedido` (`IdStatus`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`IdProduto`);

--
-- Indexes for table `statuspedido`
--
ALTER TABLE `statuspedido`
  ADD PRIMARY KEY (`IdStatus`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `historicostatus`
--
ALTER TABLE `historicostatus`
  ADD CONSTRAINT `FK_Pedido_HistoricoStatus` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`),
  ADD CONSTRAINT `FK_StatusPedido_HistoricoStatus` FOREIGN KEY (`IdStatus`) REFERENCES `statuspedido` (`IdStatus`);

--
-- Constraints for table `itempedido`
--
ALTER TABLE `itempedido`
  ADD CONSTRAINT `FK_Pedido_ItemPedido` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`),
  ADD CONSTRAINT `FK_Produto_ItemPedido` FOREIGN KEY (`IdProduto`) REFERENCES `produtos` (`IdProduto`);

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_StatusPedido_Pedido` FOREIGN KEY (`IdStatus`) REFERENCES `statuspedido` (`IdStatus`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
