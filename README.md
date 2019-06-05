# Robô Status Processor

Sistema para verificação status pedidos com objetivo de alertar, através de Log em Console, sobre atraso na alteração de status com base no tempo máximo aceitável para cada status, através de um robô feito em Console Application, auto-executado a cada 20s.

Tecnologias utilizadas:

- .NET Core 2.1
- Quartz
- Dapper
- LINQ
- SQL

## Instruções de deploy - Desafio 1

- Baixar o conteúdo da pasta Desafio1;
- Configurar a **connectionString** dentro arquivo **appSettings.json** de acordo com seu banco MySQL.
- Executar o script **createDatabase.sql** contido na pasta Desafio1/SQL/ em seu banco MySQL.
- Se necessário, alterar o **DEFINER**, para as duas procedures do arquivo sql.
- Realizar build na solution contida na pasta **StatusProcessor** e rodar a aplicação.

## Instruções de deploy - Desafio 2

- Executar o script **updateDatabase.sql** contido na pasta Desafio2/SQL/ em seu banco MySQL.

> **Nota :** O script SQL foi adaptado de SQL Server para MySQL.
