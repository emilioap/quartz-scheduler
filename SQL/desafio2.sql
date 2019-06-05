--Devemos adicionar a coluna IdStatus para a tabela ItemPedido, assim cada item do pedido terá seu próprio status:

CREATE TABLE `itempedido` (
  `IdPedido` int(11) NOT NULL,
  `IdProduto` int(11) NOT NULL,
  `IdStatus` int(11) NOT NULL,
  `PrecoVenda` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Devemos remove-la (IdStatus) então da tabela Pedido:

CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL,
  `ValorPedido` double NOT NULL,
  `DataPrevisaoEntrega` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--Teremos que adicionar a coluna IdProduto na tabela HistoricoStatus também, assim cada produto do pedido terá sua própria movimentação/histórico:

CREATE TABLE `historicostatus` (
  `IdPedido` int(11) NOT NULL,
  `IdStatus` int(11) NOT NULL,
  `IdProduto` int(11) NOT NULL,
  `DataStatus` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--Devemos incluí-lo também como PRIMARY KEY também nesta tabela:

ALTER TABLE `historicostatus`
  ADD PRIMARY KEY (`IdPedido`,`IdStatus`,`IdProduto`),
  ADD KEY `FK_StatusPedido_HistoricoStatus` (`IdStatus`);
  
--Ao invés de adicionarmos como FOREIGN KEY na tabela Pedido, devemos adicionar na tabela ItemPedido:

ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_StatusPedido_itempedido` FOREIGN KEY (`IdStatus`) REFERENCES `statuspedido` (`IdStatus`);
COMMIT;


--Por fim devemos atualizar a PROCEDURE ConsultarItensPedido, para que o Status exibido seja para cada item:

CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarItensPedido` (IN `IdPedido` INT)  BEGIN
	SELECT	p.IdPedido, p.ValorPedido, p.DataPrevisaoEntrega, sp1.Nome AS StatusPedido, 
			pr.IdProduto, pr.Nome, pr.PrecoVenda FROM Pedido p
		INNER JOIN StatusPedido sp1 ON itp.IdStatus=sp1.IdStatus
		INNER JOIN ItemPedido itp ON itp.IdPedido=p.IdPedido
		INNER JOIN Produtos pr ON itp.IdProduto=pr.IdProduto
	WHERE p.IdPedido= IdPedido ;
END$$