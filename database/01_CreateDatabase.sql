```sql
/*
=========================================================
Proyecto : TechStore S.A.
Archivo  : 01_CreateDatabase.sql
Autor    : Bootcamp SQL
Motor    : MySQL
=========================================================

Objetivo:
Crear la base de datos del proyecto y seleccionar el
esquema que será utilizado durante el desarrollo del
Bootcamp.
*/

-- Elimina la base de datos si ya existe.
DROP DATABASE IF EXISTS TechStore;

-- Crea la base de datos.
CREATE DATABASE TechStore
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Selecciona la base de datos para trabajar.
USE TechStore;
```
