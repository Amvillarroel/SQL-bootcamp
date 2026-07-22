/*
=========================================================
Proyecto : TechStore S.A.
Archivo  : 01_CreateDatabase.sql
Autor    : Bootcamp SQL
Motor    : SQLite
=========================================================

Objetivo:
Inicializar la configuración de la base de datos antes
de crear las tablas del sistema.

En SQLite la base de datos corresponde al archivo
techstore.db, por lo que no existe una sentencia
CREATE DATABASE como en otros motores SQL.
*/

-- Habilita el control de claves foráneas.
PRAGMA foreign_keys = ON;

-- Verifica que la configuración haya sido aplicada.
PRAGMA foreign_keys;