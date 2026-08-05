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

/*
=========================================================
TABLA: Cliente
Descripción:
Almacena la información de los clientes de la empresa.

Un cliente puede ser una persona física o una persona
jurídica.
=========================================================
*/

CREATE TABLE Cliente
(
    ClienteId INT AUTO_INCREMENT,

    CiudadId INT NOT NULL,

    TipoCliente ENUM('FISICA', 'JURIDICA') NOT NULL,

    Nombre VARCHAR(100) NOT NULL,

    Apellido VARCHAR(100),

    RazonSocial VARCHAR(150),

    Documento VARCHAR(20),

    CUIT VARCHAR(20),

    Email VARCHAR(150),

    Telefono VARCHAR(30),

    Direccion VARCHAR(200),

    Activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT PK_Cliente
        PRIMARY KEY (ClienteId),

    CONSTRAINT FK_Cliente_Ciudad
        FOREIGN KEY (CiudadId)
        REFERENCES Ciudad (CiudadId),

    CONSTRAINT UQ_Cliente_Documento
        UNIQUE (Documento),

    CONSTRAINT UQ_Cliente_CUIT
        UNIQUE (CUIT)
);

/*
=========================================================
TABLA: Proveedor
Descripción:
Almacena la información de los proveedores de la empresa.

Cada proveedor corresponde a una empresa o razón social.
=========================================================
*/

CREATE TABLE Proveedor
(
    ProveedorId INT AUTO_INCREMENT,

    CiudadId INT NOT NULL,

    RazonSocial VARCHAR(150) NOT NULL,

    NombreFantasia VARCHAR(150),

    CUIT VARCHAR(20) NOT NULL,

    Email VARCHAR(150),

    Telefono VARCHAR(30),

    Direccion VARCHAR(200),

    Activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT PK_Proveedor
        PRIMARY KEY (ProveedorId),

    CONSTRAINT FK_Proveedor_Ciudad
        FOREIGN KEY (CiudadId)
        REFERENCES Ciudad (CiudadId),

    CONSTRAINT UQ_Proveedor_RazonSocial
        UNIQUE (RazonSocial),

    CONSTRAINT UQ_Proveedor_CUIT
        UNIQUE (CUIT)
);

/*
=========================================================
TABLA: Producto
Descripción:
Almacena los productos comercializados por la empresa.

Cada producto pertenece a una categoría, una marca y una
alícuota de IVA.
=========================================================
*/

CREATE TABLE Producto
(
    ProductoId INT AUTO_INCREMENT,

    CategoriaId INT NOT NULL,

    MarcaId INT NOT NULL,

    AlicuotaIVAId INT NOT NULL,

    Nombre VARCHAR(150) NOT NULL,

    Descripcion VARCHAR(500),

    CodigoBarras VARCHAR(50),

    PrecioCosto DECIMAL(12,2) NOT NULL,

    PrecioVenta DECIMAL(12,2) NOT NULL,

    StockMinimo INT NOT NULL DEFAULT 0,

    Activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT PK_Producto
        PRIMARY KEY (ProductoId),

    CONSTRAINT FK_Producto_Categoria
        FOREIGN KEY (CategoriaId)
        REFERENCES Categoria (CategoriaId),

    CONSTRAINT FK_Producto_Marca
        FOREIGN KEY (MarcaId)
        REFERENCES Marca (MarcaId),

    CONSTRAINT FK_Producto_AlicuotaIVA
        FOREIGN KEY (AlicuotaIVAId)
        REFERENCES AlicuotaIVA (AlicuotaIVAId),

    CONSTRAINT UQ_Producto_CodigoBarras
        UNIQUE (CodigoBarras)
);

/*
=========================================================
TABLA: Compra
Descripción:
Almacena el encabezado de las compras realizadas a los
proveedores.

Los productos adquiridos se registran en la tabla
DetalleCompra.
=========================================================
*/

CREATE TABLE Compra
(
    CompraId INT AUTO_INCREMENT,

    ProveedorId INT NOT NULL,

    EmpleadoId INT NOT NULL,

    FormaPagoId INT NOT NULL,

    Fecha DATETIME NOT NULL,

    NumeroComprobante VARCHAR(30) NOT NULL,

    Observaciones VARCHAR(500),

    CONSTRAINT PK_Compra
        PRIMARY KEY (CompraId),

    CONSTRAINT FK_Compra_Proveedor
        FOREIGN KEY (ProveedorId)
        REFERENCES Proveedor (ProveedorId),

    CONSTRAINT FK_Compra_Empleado
        FOREIGN KEY (EmpleadoId)
        REFERENCES Empleado (EmpleadoId),

    CONSTRAINT FK_Compra_FormaPago
        FOREIGN KEY (FormaPagoId)
        REFERENCES FormaPago (FormaPagoId),

    CONSTRAINT UQ_Compra_NumeroComprobante
        UNIQUE (NumeroComprobante)
);

/*
=========================================================
TABLA: Venta
Descripción:
Almacena el encabezado de las ventas realizadas a los
clientes.

Los productos vendidos se registran en la tabla
DetalleVenta.
=========================================================
*/

CREATE TABLE Venta
(
    VentaId INT AUTO_INCREMENT,

    ClienteId INT NOT NULL,

    EmpleadoId INT NOT NULL,

    FormaPagoId INT NOT NULL,

    Fecha DATETIME NOT NULL,

    NumeroComprobante VARCHAR(30) NOT NULL,

    Observaciones VARCHAR(500),

    CONSTRAINT PK_Venta
        PRIMARY KEY (VentaId),

    CONSTRAINT FK_Venta_Cliente
        FOREIGN KEY (ClienteId)
        REFERENCES Cliente (ClienteId),

    CONSTRAINT FK_Venta_Empleado
        FOREIGN KEY (EmpleadoId)
        REFERENCES Empleado (EmpleadoId),

    CONSTRAINT FK_Venta_FormaPago
        FOREIGN KEY (FormaPagoId)
        REFERENCES FormaPago (FormaPagoId),

    CONSTRAINT UQ_Venta_NumeroComprobante
        UNIQUE (NumeroComprobante)
);

/*
=========================================================
TABLA: DetalleCompra
Descripción:
Almacena los productos incluidos en cada compra.

Cada registro representa una línea del comprobante.
=========================================================
*/

CREATE TABLE DetalleCompra
(
    DetalleCompraId INT AUTO_INCREMENT,

    CompraId INT NOT NULL,

    ProductoId INT NOT NULL,

    Cantidad DECIMAL(10,2) NOT NULL,

    PrecioUnitario DECIMAL(12,2) NOT NULL,

    CONSTRAINT PK_DetalleCompra
        PRIMARY KEY (DetalleCompraId),

    CONSTRAINT FK_DetalleCompra_Compra
        FOREIGN KEY (CompraId)
        REFERENCES Compra (CompraId),

    CONSTRAINT FK_DetalleCompra_Producto
        FOREIGN KEY (ProductoId)
        REFERENCES Producto (ProductoId)
);

/*
=========================================================
TABLA: DetalleVenta
Descripción:
Almacena los productos incluidos en cada venta.

Cada registro representa una línea del comprobante.
=========================================================
*/

CREATE TABLE DetalleVenta
(
    DetalleVentaId INT AUTO_INCREMENT,

    VentaId INT NOT NULL,

    ProductoId INT NOT NULL,

    Cantidad DECIMAL(10,2) NOT NULL,

    PrecioUnitario DECIMAL(12,2) NOT NULL,

    CONSTRAINT PK_DetalleVenta
        PRIMARY KEY (DetalleVentaId),

    CONSTRAINT FK_DetalleVenta_Venta
        FOREIGN KEY (VentaId)
        REFERENCES Venta (VentaId),

    CONSTRAINT FK_DetalleVenta_Producto
        FOREIGN KEY (ProductoId)
        REFERENCES Producto (ProductoId),

    CONSTRAINT UQ_DetalleVenta_Venta_Producto
        UNIQUE (VentaId, ProductoId)
);

/*
=========================================================
TABLA: MovimientoStock
Descripción:
Registra todos los movimientos de inventario realizados
sobre los productos.

Cada movimiento representa una entrada o una salida de
stock y puede originarse por una compra, una venta o un
ajuste manual.
=========================================================
*/

CREATE TABLE MovimientoStock
(
    MovimientoStockId INT AUTO_INCREMENT,

    ProductoId INT NOT NULL,

    TipoMovimientoStockId INT NOT NULL,

    EmpleadoId INT NOT NULL,

    CompraId INT,

    VentaId INT,

    Fecha DATETIME NOT NULL,

    Cantidad DECIMAL(10,2) NOT NULL,

    Observaciones VARCHAR(500),

    CONSTRAINT PK_MovimientoStock
        PRIMARY KEY (MovimientoStockId),

    CONSTRAINT FK_MovimientoStock_Producto
        FOREIGN KEY (ProductoId)
        REFERENCES Producto (ProductoId),

    CONSTRAINT FK_MovimientoStock_TipoMovimiento
        FOREIGN KEY (TipoMovimientoStockId)
        REFERENCES TipoMovimientoStock (TipoMovimientoStockId),

    CONSTRAINT FK_MovimientoStock_Empleado
        FOREIGN KEY (EmpleadoId)
        REFERENCES Empleado (EmpleadoId),

    CONSTRAINT FK_MovimientoStock_Compra
        FOREIGN KEY (CompraId)
        REFERENCES Compra (CompraId),

    CONSTRAINT FK_MovimientoStock_Venta
        FOREIGN KEY (VentaId)
        REFERENCES Venta (VentaId),

    CONSTRAINT CHK_MovimientoStock_Cantidad
        CHECK (Cantidad > 0)
);