# Description

Scheduler made with .NET Core to check orders status for prevent delivery delays, based on the maximum acceptable time for each status.

Features:

- Factory Pattern
- Quartz (scheduler)
- Dapper ORM With MySQL

## Installation:

1. Clone the Repo and acess the folder named **Desafio1**;
2. Configure your **connectionString** in **appSettings.json** according to your MySQL instance.
3. Execute the script named **createDatabase.sql** , inside the folder SQL.

## Running

Go to folder **StatusProcessor** and run:

 ```bash
$ dotnet run
```
