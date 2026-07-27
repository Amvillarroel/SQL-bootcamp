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

/*
=========================================================
TABLA: Ciudad
Descripción:
Almacena las ciudades utilizadas por el sistema para la
localización de clientes, proveedores, sucursales y
empleados.

Cada ciudad pertenece a una única provincia.
=========================================================
*/

CREATE TABLE Ciudad
(
    CiudadId INT AUTO_INCREMENT,

    ProvinciaId INT NOT NULL,

    Nombre VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Ciudad
        PRIMARY KEY (CiudadId),

    CONSTRAINT FK_Ciudad_Provincia
        FOREIGN KEY (ProvinciaId)
        REFERENCES Provincia (ProvinciaId),

    CONSTRAINT UQ_Ciudad_Provincia_Nombre
        UNIQUE (ProvinciaId, Nombre)
);

/*
=========================================================
TABLA: Sector
Descripción:
Almacena los sectores o áreas organizacionales de la
empresa.

Cada empleado pertenece a un único sector.
=========================================================
*/

CREATE TABLE Sector
(
    SectorId INT AUTO_INCREMENT,

    Nombre VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Sector
        PRIMARY KEY (SectorId),

    CONSTRAINT UQ_Sector_Nombre
        UNIQUE (Nombre)
);

/*
=========================================================
TABLA: Marca
Descripción:
Almacena las marcas comerciales de los productos
comercializados por la empresa.

Cada producto pertenece a una única marca.
=========================================================
*/

CREATE TABLE Marca
(
    MarcaId INT AUTO_INCREMENT,

    Nombre VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Marca
        PRIMARY KEY (MarcaId),

    CONSTRAINT UQ_Marca_Nombre
        UNIQUE (Nombre)
);


/*
=========================================================
TABLA: Categoria
Descripción:
Almacena las categorías comerciales utilizadas para
clasificar los productos.

Cada producto pertenece a una única categoría.
=========================================================
*/

CREATE TABLE Categoria
(
    CategoriaId INT AUTO_INCREMENT,

    Nombre VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Categoria
        PRIMARY KEY (CategoriaId),

    CONSTRAINT UQ_Categoria_Nombre
        UNIQUE (Nombre)
);

/*
=========================================================
TABLA: FormaPago
Descripción:
Almacena las distintas formas de pago utilizadas por la
empresa en operaciones de compra y venta.

Cada operación utiliza una única forma de pago.
=========================================================
*/

CREATE TABLE FormaPago
(
    FormaPagoId INT AUTO_INCREMENT,

    Nombre VARCHAR(100) NOT NULL,

    CONSTRAINT PK_FormaPago
        PRIMARY KEY (FormaPagoId),

    CONSTRAINT UQ_FormaPago_Nombre
        UNIQUE (Nombre)
);


/*
=========================================================
TABLA: TipoMovimientoStock
Descripción:
Almacena los distintos tipos de movimientos que pueden
afectar el stock de los productos.

Cada movimiento de stock pertenece a un único tipo de
movimiento previamente definido.
=========================================================
*/

CREATE TABLE TipoMovimientoStock
(
    TipoMovimientoStockId INT AUTO_INCREMENT,

    Nombre VARCHAR(100) NOT NULL,

    CONSTRAINT PK_TipoMovimientoStock
        PRIMARY KEY (TipoMovimientoStockId),

    CONSTRAINT UQ_TipoMovimientoStock_Nombre
        UNIQUE (Nombre)
);

/*
=========================================================
TABLA: AlicuotaIVA
Descripción:
Almacena las distintas alícuotas de IVA aplicables a los
productos comercializados por la empresa.

Cada producto utiliza una única alícuota de IVA.
=========================================================
*/

CREATE TABLE AlicuotaIVA
(
    AlicuotaIVAId INT AUTO_INCREMENT,

    Nombre VARCHAR(50) NOT NULL,

    Porcentaje DECIMAL(5,2) NOT NULL,

    CONSTRAINT PK_AlicuotaIVA
        PRIMARY KEY (AlicuotaIVAId),

    CONSTRAINT UQ_AlicuotaIVA_Nombre
        UNIQUE (Nombre),

    CONSTRAINT UQ_AlicuotaIVA_Porcentaje
        UNIQUE (Porcentaje)
);

/*
=========================================================
TABLA: Sucursal
Descripción:
Almacena las sucursales de la empresa.

Cada sucursal pertenece a una única ciudad.
=========================================================
*/

CREATE TABLE Sucursal
(
    SucursalId INT AUTO_INCREMENT,

    CiudadId INT NOT NULL,

    Nombre VARCHAR(100) NOT NULL,

    Direccion VARCHAR(200) NOT NULL,

    Telefono VARCHAR(30),

    CONSTRAINT PK_Sucursal
        PRIMARY KEY (SucursalId),

    CONSTRAINT FK_Sucursal_Ciudad
        FOREIGN KEY (CiudadId)
        REFERENCES Ciudad (CiudadId),

    CONSTRAINT UQ_Sucursal_Nombre
        UNIQUE (Nombre)
);

/*
=========================================================
TABLA: Empleado
Descripción:
Almacena los empleados de la empresa.

Cada empleado pertenece a una sucursal y a un sector.
=========================================================
*/

CREATE TABLE Empleado
(
    EmpleadoId INT AUTO_INCREMENT,

    SucursalId INT NOT NULL,

    SectorId INT NOT NULL,

    Nombre VARCHAR(100) NOT NULL,

    Apellido VARCHAR(100) NOT NULL,

    Documento VARCHAR(20) NOT NULL,

    Email VARCHAR(150),

    Telefono VARCHAR(30),

    Activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT PK_Empleado
        PRIMARY KEY (EmpleadoId),

    CONSTRAINT FK_Empleado_Sucursal
        FOREIGN KEY (SucursalId)
        REFERENCES Sucursal (SucursalId),

    CONSTRAINT FK_Empleado_Sector
        FOREIGN KEY (SectorId)
        REFERENCES Sector (SectorId),

    CONSTRAINT UQ_Empleado_Documento
        UNIQUE (Documento)
);