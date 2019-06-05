# Robô Status Processor

## Instruções de deploy

- Alterar a **connectionString** dentro arquivo **appSettings.json** de acordo com suas configurações.
- Executar o script **varejo.sql** contido na pasta SQL em banco MySQL.
- Se necessário, alterar o DEFINER, para as duas procedures do arquivo sql:
- > CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarHistoricoPedido` (IN `IdPedido` INT)  BEGIN
- > CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarItensPedido` (IN `IdPedido` INT)  BEGIN
- Realizar build na solution contida na pasta **StatusProcessor** e rodar a aplicação.

> **Nota :** O script SQL foi adaptado de SQL Server para MySQL.
