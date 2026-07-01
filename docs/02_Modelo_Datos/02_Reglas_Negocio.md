# Reglas de Negocio

**Proyecto:** SQL Bootcamp
**Módulo:** 2 - Diseñar el Modelo de Datos (MER)
**Fase:** 2.1 - Análisis Funcional
**Documento:** 02_Reglas_Negocio.md
**Estado:** Functional Baseline v1.0

---

# 1. Objetivo

El presente documento define las reglas de negocio que rigen el funcionamiento de TechStore S.A.

Estas reglas representan las condiciones funcionales que deberán respetarse durante el diseño del Modelo Entidad-Relación (MER) y la implementación posterior de la base de datos.

Cada regla posee un identificador único para facilitar su trazabilidad a lo largo del proyecto.

---

# 2. Convención

Cada regla se identifica mediante el prefijo **RN** (Regla de Negocio), seguido de un número correlativo de tres dígitos.

Ejemplo:

* RN-001
* RN-002
* RN-003

---

# 3. Reglas de Negocio

## Área: Clientes

### RN-001

Un cliente puede registrarse en el sistema aunque todavía no haya realizado ninguna compra.

**Justificación:** La empresa registra potenciales clientes para futuras acciones comerciales.

---

### RN-002

Cada cliente debe poseer un único identificador dentro del sistema.

**Justificación:** Evita duplicidad de información y permite identificar correctamente todas las operaciones asociadas.

---

### RN-003

Un cliente podrá realizar múltiples compras a lo largo del tiempo.

**Justificación:** Representa la relación histórica entre clientes y ventas.

---

### RN-004

Un cliente podrá quedar inactivo sin perder su historial de operaciones.

**Justificación:** La información histórica nunca debe eliminarse por razones comerciales o administrativas.

---

## Área: Productos

### RN-005

Cada producto pertenece a una única categoría.

**Justificación:** Facilita la organización del catálogo y la generación de reportes.

---

### RN-006

Un producto puede venderse muchas veces.

**Justificación:** El historial de ventas debe conservar todas las operaciones realizadas.

---

### RN-007

Un producto podrá permanecer activo aunque no posea stock disponible.

**Justificación:** La falta de stock no implica que el producto deje de comercializarse.

---

### RN-008

Un producto podrá ser discontinuado sin eliminar su historial.

**Justificación:** Las ventas históricas deben conservar su integridad.

---

## Área: Proveedores

### RN-009

Un proveedor puede suministrar múltiples productos.

**Justificación:** Un mismo proveedor comercializa distintos artículos.

---

### RN-010

Un proveedor podrá permanecer registrado aunque deje de operar con la empresa.

**Justificación:** Es necesario conservar el historial de compras realizadas.

---

## Área: Empleados

### RN-011

Todo empleado pertenece a una única sucursal.

**Justificación:** Cada empleado desarrolla sus tareas dentro de una sede determinada.

---

### RN-012

Todo empleado pertenece a un único sector.

**Justificación:** Define su función principal dentro de la organización.

---

### RN-013

Un empleado podrá cambiar de sucursal durante su permanencia en la empresa.

**Justificación:** La organización puede reasignar personal según necesidades operativas.

---

### RN-014

Un empleado podrá permanecer activo aunque no haya intervenido en ninguna venta.

**Justificación:** Existen funciones que no participan directamente en la operatoria comercial.

---

## Área: Ventas

### RN-015

Toda venta debe estar asociada a un único cliente.

**Justificación:** La empresa identifica el comprador de cada operación.

---

### RN-016

Toda venta debe ser registrada por un único empleado.

**Justificación:** Permite conocer el responsable de la operación.

---

### RN-017

Una venta puede contener uno o varios productos.

**Justificación:** Una operación comercial puede incluir múltiples artículos.

---

### RN-018

Un producto puede formar parte de muchas ventas.

**Justificación:** El mismo artículo puede comercializarse repetidamente.

---

### RN-019

Una venta podrá registrarse como anulada sin eliminarse del sistema.

**Justificación:** Debe conservarse el historial completo de operaciones.

---

## Área: Compras

### RN-020

Toda compra deberá asociarse a un único proveedor.

**Justificación:** Cada operación posee un único proveedor responsable.

---

### RN-021

Una compra podrá contener múltiples productos.

**Justificación:** Un mismo pedido puede incluir diversos artículos.

---

### RN-022

Un producto podrá adquirirse en múltiples compras.

**Justificación:** La empresa repone mercadería periódicamente.

---

### RN-023

Una orden de compra podrá recibirse parcialmente.

**Justificación:** Los proveedores pueden entregar la mercadería en distintas fechas.

---

## Área: Inventario

### RN-024

Todo movimiento de stock deberá quedar registrado.

**Justificación:** Garantiza la trazabilidad del inventario.

---

### RN-025

Los movimientos de stock podrán originarse por compras, ventas o ajustes administrativos.

**Justificación:** Existen distintos procesos que modifican las existencias.

---

### RN-026

El historial de movimientos nunca deberá eliminarse.

**Justificación:** La auditoría requiere conservar todas las operaciones.

---

## Área: Organización

### RN-027

Cada sucursal pertenece a una única ciudad.

**Justificación:** Define su ubicación geográfica.

---

### RN-028

Cada ciudad pertenece a una única provincia.

**Justificación:** Mantiene la organización territorial.

---

### RN-029

Una sucursal podrá permanecer operativa aunque no registre ventas durante un período.

**Justificación:** La ausencia de ventas no implica el cierre de la sucursal.

---

## Área: Integridad

### RN-030

La información histórica nunca será eliminada por procesos operativos normales.

**Justificación:** El sistema deberá preservar la trazabilidad de todas las operaciones realizadas.

---

# 4. Observaciones

Las presentes reglas representan la primera versión del análisis funcional.

Durante el diseño del Modelo Entidad-Relación podrán incorporarse nuevas reglas o ampliarse las existentes cuando el análisis del negocio así lo requiera.

Toda modificación deberá quedar documentada para mantener la trazabilidad del proyecto.

---

# 5. Estado del documento

Versión: 1.0

Estado: **APROBADO**

Este documento permanecerá en estado BORRADOR hasta finalizar el análisis funcional y será utilizado como insumo principal para el diseño del Modelo Entidad-Relación (MER).
