# Descripción de la Empresa

**Proyecto:** SQL Bootcamp
**Módulo:** 2 - Diseñar el Modelo de Datos (MER)
**Fase:** 2.1 - Análisis Funcional
**Documento:** 01_Descripcion_Empresa.md
**Estado:** Functional Baseline v1.0

---

# 1. Objetivo del documento

El presente documento tiene como finalidad describir el contexto empresarial sobre el cual se diseñará la base de datos utilizada durante todo el SQL Bootcamp.

Su propósito es establecer el marco funcional del negocio, definiendo la actividad de la empresa, su estructura organizacional, los procesos principales y el alcance del sistema ERP que será modelado.

Este documento constituye el punto de partida para el diseño del Modelo Entidad-Relación (MER) y servirá como referencia para el resto de la documentación técnica del proyecto.

---

# 2. Alcance

Este documento describe la empresa desde una perspectiva funcional.

Incluye:

* Actividad principal.
* Modelo de negocio.
* Estructura organizacional.
* Alcance geográfico.
* Procesos generales.
* Objetivos del sistema.

No incluye:

* Diseño de tablas.
* Relaciones entre entidades.
* Reglas de negocio específicas.
* Modelo de datos.
* Decisiones de implementación.

Estos aspectos serán desarrollados en los documentos posteriores del Módulo 2.

---

# 3. Presentación de la empresa

## Nombre comercial

**TechStore S.A.**

---

## Actividad

TechStore S.A. es una empresa dedicada a la comercialización mayorista y minorista de productos tecnológicos.

Su catálogo incluye equipos informáticos, componentes electrónicos, dispositivos de red, periféricos, equipamiento gamer, soluciones de almacenamiento, impresión, audio y accesorios.

La empresa realiza operaciones tanto con clientes particulares como con empresas, organismos públicos y revendedores.

---

## Modelo de negocio

La empresa posee un modelo de comercialización mixto.

### B2C (Business to Consumer)

Venta directa al consumidor final mediante sucursales físicas.

### B2B (Business to Business)

Venta a empresas, distribuidores, organismos públicos y clientes corporativos.

Este enfoque permitirá modelar distintos tipos de clientes y diferentes comportamientos comerciales dentro de la misma base de datos.

---

# 4. Alcance geográfico

TechStore opera dentro del territorio nacional mediante una red de sucursales distribuidas estratégicamente.

Cada sucursal administra su propio personal y participa en la operatoria comercial de la empresa.

La administración central consolida toda la información proveniente de las distintas sucursales.

---

# 5. Estructura organizacional

La organización se encuentra dividida en áreas funcionales.

## Comercial

Responsable de la atención de clientes y generación de ventas.

Funciones principales:

* Atención comercial.
* Presupuestos.
* Ventas.
* Facturación.

---

## Compras

Responsable del abastecimiento de mercadería.

Funciones principales:

* Gestión de proveedores.
* Solicitud de cotizaciones.
* Órdenes de compra.
* Recepción de productos.

---

## Inventario

Responsable del control físico y lógico del stock.

Funciones principales:

* Administración del inventario.
* Control de existencias.
* Ajustes de stock.
* Movimientos internos.

---

## Recursos Humanos

Responsable de la administración del personal.

Funciones principales:

* Gestión de empleados.
* Asignación de sectores.
* Asignación de sucursales.
* Administración de cargos.

---

## Administración

Responsable de las tareas administrativas generales.

Funciones principales:

* Gestión de clientes.
* Gestión de proveedores.
* Información geográfica.
* Parámetros generales del sistema.

---

# 6. Operación general

El funcionamiento diario de la empresa puede resumirse en cuatro procesos principales.

## Proceso de ventas

El cliente realiza una compra.

Un empleado registra la operación.

La venta puede contener uno o varios productos.

Al confirmarse la operación, el stock disponible disminuye automáticamente.

---

## Proceso de compras

El área de Compras genera órdenes de compra hacia los proveedores.

Una vez recibida la mercadería, el inventario incrementa las existencias correspondientes.

---

## Gestión de inventario

El área de Inventario administra el stock de todos los productos.

Los movimientos pueden originarse por:

* Compras.
* Ventas.
* Ajustes.
* Transferencias.
* Correcciones administrativas.

---

## Administración de personal

Cada empleado pertenece a una sucursal y desarrolla sus tareas dentro de un sector específico.

La empresa conserva el historial administrativo necesario para identificar quién intervino en cada operación registrada.

---

# 7. Objetivos del sistema ERP

El sistema que será modelado deberá permitir administrar la información correspondiente a:

* Clientes.
* Proveedores.
* Productos.
* Categorías.
* Compras.
* Ventas.
* Inventario.
* Empleados.
* Sectores.
* Sucursales.
* Información geográfica.

El objetivo principal consiste en centralizar toda la información operativa de la empresa, garantizando la integridad de los datos y facilitando su explotación mediante consultas SQL.

---

# 8. Criterios de diseño

Durante el desarrollo del proyecto se adoptarán los siguientes principios:

* El modelo representará una empresa realista.
* Las decisiones de diseño priorizarán la claridad y la correcta normalización de los datos.
* La base deberá permitir consultas de complejidad creciente sin requerir modificaciones estructurales.
* El modelo estará orientado al aprendizaje de SQL y no a replicar un ERP comercial específico.
* La documentación será considerada parte integrante del proyecto.

---

# 9. Objetivos del Bootcamp

La base de datos diseñada en este proyecto será utilizada para desarrollar progresivamente competencias en SQL.

Sobre este mismo modelo se abordarán consultas básicas, consultas avanzadas, funciones de agregación, relaciones entre tablas, subconsultas, expresiones comunes de tabla (CTE), funciones de ventana, optimización y análisis de rendimiento.

El propósito es que el estudiante trabaje siempre sobre un mismo contexto empresarial, permitiendo que el conocimiento evolucione de manera incremental sin necesidad de cambiar de dominio de negocio.

---

# 10. Estado del documento

Versión: 1.0

Estado: **APROBADO**

Este documento permanecerá en estado BORRADOR hasta finalizar el análisis funcional del sistema. Posteriormente será revisado, aprobado y utilizado como base para el diseño del Modelo Entidad-Relación (MER).
