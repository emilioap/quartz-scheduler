# Robô Status Processor

## Instruções de deploy

- Configurar a **connectionString** dentro arquivo **appSettings.json** de acordo com seu banco MySQL.
- Executar o script **varejo.sql** contido na pasta SQL em seu banco MySQL.
- Se necessário, alterar o **DEFINER**, para as duas procedures do arquivo sql.
- Realizar build na solution contida na pasta **StatusProcessor** e rodar a aplicação.

> **Nota :** O script SQL foi adaptado de SQL Server para MySQL.
