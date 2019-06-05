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

USE `varejo`;

--Devemos adicionar a coluna IdStatus para a tabela ItemPedido, assim cada item do pedido terá seu próprio status:
ALTER TABLE `itempedido`
ADD `IdStatus` int(11) NOT NULL;


--Criar uma PROCEDURE para popular os novos IdStatus da tabela ItemPedido com os IdStatus respectivos da tabela Pedidos:
UPDATE itempedido i
INNER JOIN pedido p ON i.IdPedido = p.IdPedido
SET i.IdStatus =  p.IdStatus;


--Devemos remover então a coluna IdStatus da tabela Pedido:
ALTER TABLE  `pedido`
DROP COLUMN `IdStatus`;


--Devemos incluir a coluna IdProduto na tabela HistoricoStatus também, assim cada produto do pedido terá sua própria movimentação/histórico:
ALTER TABLE `historicostatus`
ADD `IdProduto` int(11) NOT NULL;


--Devemos definir a coluna IdProduto também como PRIMARY KEY também nesta tabela:
ALTER TABLE `historicostatus`
ADD PRIMARY KEY (`IdProduto`);
  
  
--Ao invés de adicionarmos como FOREIGN KEY na tabela Pedido, devemos adicionar na tabela ItemPedido:
ALTER TABLE `itempedido`
  ADD CONSTRAINT `FK_StatusPedido_ItemPedido` FOREIGN KEY (`IdStatus`) REFERENCES `statuspedido` (`IdStatus`);
COMMIT;


--Por fim devemos atualizar a PROCEDURE ConsultarItensPedido, para que o Status exibido seja para cada item:
DROP PROCEDURE IF EXISTS ConsultarItensPedido;

DELIMITER $$
CREATE PROCEDURE `ConsultarItensPedido` (IN `IdPedido` INT)  BEGIN
	SELECT	p.IdPedido, p.ValorPedido, p.DataPrevisaoEntrega, sp1.Nome AS StatusPedido, 
			pr.IdProduto, pr.Nome, pr.PrecoVenda FROM Pedido p
		INNER JOIN StatusPedido sp1 ON itp.IdStatus=sp1.IdStatus
		INNER JOIN ItemPedido itp ON itp.IdPedido=p.IdPedido
		INNER JOIN Produtos pr ON itp.IdProduto=pr.IdProduto
	WHERE p.IdPedido= IdPedido;
END$$
DELIMITER;

COMMIT;