# Database First University Project

Target: to display every table of a database

Frontend: Flutter

Backend: .NET

Database: Oracle
- To connect to Oracle from .NET use a connection string :
  
![conn_string](https://github.com/user-attachments/assets/a10f936a-d7cc-4a7c-a9f8-b916c86fc8d7)
![set_conn_string_in_db_context](https://github.com/user-attachments/assets/ddadac5b-5428-4ebe-ad03-f8165562a1c8)


  
- Use the next command to generate the entities based on existing database schema (don't forget to firstly create the database in oracle), using the EntityFrameworkCore :

`Scaffold-DbContext "User Id=system;Password=231;Data Source=//localhost:1521/xe" -Provider Oracle.EntityFrameworkCore -OutputDir Models -Context ApplicationDbContext`

This is how the generated files should look like : 

![image](https://github.com/user-attachments/assets/4b6f6e2a-7d57-4a7e-be64-f2526c24f21c)

DB diagram:
![db-diagram](https://github.com/user-attachments/assets/17833fcc-e954-4efc-a96b-303f6ed95641)

.NET ORM Context:
- use the tables as objects, access the DbSets:
![image](https://github.com/user-attachments/assets/13ac0c37-5664-4898-924c-2bb8f249eeda)


