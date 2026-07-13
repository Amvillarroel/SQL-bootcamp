# Diccionario de Entidades

**Proyecto:** SQL Bootcamp
**Módulo:** 2 - Diseñar el Modelo de Datos (MER)
**Fase:** 2.1 - Análisis Funcional
**Documento:** 03_Diccionario_Entidades.md
**Estado:** Functional Baseline v1.0

---

# 1. Objetivo

El presente documento identifica las entidades que intervienen en la operación de TechStore S.A.

Las entidades representan los principales conceptos del negocio que deberán ser considerados durante el diseño del Modelo Entidad-Relación (MER).

Este documento no define atributos, claves, relaciones ni estructuras físicas de almacenamiento.

---

# 2. Alcance

Incluye:

* Identificación de entidades.
* Descripción funcional.
* Área responsable.
* Justificación de su existencia.

No incluye:

* Tablas.
* Columnas.
* Relaciones.
* Cardinalidades.
* Restricciones.

---

# 3. Diccionario de Entidades

## ENT-001 — Cliente

**Área:** Comercial

**Descripción**

Representa a las personas o empresas que adquieren productos comercializados por TechStore S.A.

**Justificación**

Es el actor principal del proceso de ventas y permite asociar todas las operaciones comerciales realizadas.

---

## ENT-002 — Producto

**Área:** Inventario

**Descripción**

Representa cada artículo disponible para su comercialización.

**Justificación**

Constituye el núcleo del catálogo de productos administrado por la empresa.

---

## ENT-003 — Categoría

**Área:** Inventario

**Descripción**

Agrupa productos con características similares.

**Justificación**

Facilita la organización del catálogo y la elaboración de informes.

---

## ENT-004 — Proveedor

**Área:** Compras

**Descripción**

Representa a las empresas que abastecen de mercadería a TechStore S.A.

**Justificación**

Permite gestionar las operaciones de compra y abastecimiento.

---

## ENT-005 — Compra

**Área:** Compras

**Descripción**

Representa cada operación mediante la cual la empresa adquiere mercadería.

**Justificación**

Permite registrar el historial de abastecimiento y controlar ingresos de productos.

---

## ENT-006 — Venta

**Área:** Comercial

**Descripción**

Representa cada operación comercial realizada por la empresa.

**Justificación**

Es la entidad principal para registrar las transacciones de venta.

---

## ENT-007 — Detalle de Venta

**Área:** Comercial

**Descripción**

Representa los productos incluidos en una venta.

**Justificación**

Permite registrar cantidades, precios y demás datos correspondientes a cada producto vendido.

---

## ENT-008 — Detalle de Compra

**Área:** Compras

**Descripción**

Representa los productos incluidos en una compra.

**Justificación**

Permite registrar el detalle de cada operación de abastecimiento.

---

## ENT-009 — Empleado

**Área:** Recursos Humanos

**Descripción**

Representa al personal de la empresa.

**Justificación**

Permite identificar los responsables de las distintas operaciones del negocio.

---

## ENT-010 — Sector

**Área:** Recursos Humanos

**Descripción**

Representa las distintas áreas funcionales dentro de la organización.

**Justificación**

Facilita la clasificación administrativa del personal.

---

## ENT-011 — Sucursal

**Área:** Administración

**Descripción**

Representa cada establecimiento físico desde donde opera la empresa.

**Justificación**

Permite distribuir la operatoria comercial y administrativa.

---

## ENT-012 — Ciudad

**Área:** Administración

**Descripción**

Representa las localidades donde operan sucursales, clientes o proveedores.

**Justificación**

Normaliza la información geográfica.

---

## ENT-013 — Provincia

**Área:** Administración

**Descripción**

Representa las provincias del país.

**Justificación**

Complementa la estructura geográfica utilizada por el sistema.

---

## ENT-014 — Forma de Pago

**Área:** Comercial

**Descripción**

Representa los distintos medios mediante los cuales un cliente puede cancelar una compra.

**Justificación**

Permite clasificar las operaciones comerciales según el medio de pago utilizado.

---

## ENT-015 — Movimiento de Stock

**Área:** Inventario

**Descripción**

Representa toda modificación producida sobre las existencias de un producto.

**Justificación**

Permite mantener la trazabilidad completa del inventario.

---

# 4. Observaciones

Las entidades identificadas en este documento representan la primera aproximación al dominio del negocio.

Durante el diseño del Modelo Entidad-Relación podrán incorporarse nuevas entidades, dividirse algunas existentes o redefinirse sus responsabilidades cuando el análisis técnico así lo requiera.

Toda modificación deberá quedar documentada para preservar la trazabilidad del proyecto.

---

# 5. Estado del documento

Versión: 1.0

Estado: **APROBADO**

Este documento permanecerá en estado BORRADOR hasta concluir la Fase 2.1 del análisis funcional y servirá como insumo para la construcción del Modelo Entidad-Relación (MER).
