/*
=========================================================
TABLA: Provincia
Descripción:
Almacena las provincias o estados administrativos
utilizados por el sistema para la localización de
clientes, proveedores, sucursales y empleados.
=========================================================
*/

CREATE TABLE Provincia
(
    ProvinciaId INT AUTO_INCREMENT,

    Nombre VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Provincia
        PRIMARY KEY (ProvinciaId),

    CONSTRAINT UQ_Provincia_Nombre
        UNIQUE (Nombre)
);