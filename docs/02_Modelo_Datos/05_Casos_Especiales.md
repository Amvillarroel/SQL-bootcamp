# Casos Especiales

**Proyecto:** SQL Bootcamp
**Módulo:** 2 - Diseñar el Modelo de Datos (MER)
**Fase:** 2.1 - Análisis Funcional
**Documento:** 05_Casos_Especiales.md
**Estado:** BORRADOR v1.0

---

# 1. Objetivo

El presente documento identifica situaciones particulares que deberán existir dentro de los datos del sistema.

Su finalidad es garantizar que la base de datos permita resolver consultas SQL de complejidad creciente utilizando escenarios similares a los encontrados en un entorno empresarial real.

Estos casos especiales no representan errores del modelo de datos, sino condiciones de negocio que pueden producirse durante la operatoria normal de la empresa o que fueron incorporadas deliberadamente con fines didácticos.

---

# 2. Alcance

Incluye:

* Situaciones comerciales.
* Situaciones administrativas.
* Situaciones de inventario.
* Casos necesarios para el desarrollo de desafíos SQL.

No incluye:

* Implementación técnica.
* Consultas SQL.
* Estrategias de carga de datos.

---

# 3. Casos Especiales

## Área: Clientes

### CE-001

Existirán clientes registrados que nunca hayan realizado compras.

**Finalidad**

Permitir consultas de clientes sin operaciones comerciales.

---

### CE-002

Existirán clientes inactivos con historial de compras.

**Finalidad**

Permitir consultas históricas sin perder integridad referencial.

---

### CE-003

Existirán clientes con una única compra y clientes con un volumen elevado de operaciones.

**Finalidad**

Facilitar análisis estadísticos y rankings.

---

## Área: Productos

### CE-004

Existirán productos que nunca hayan sido vendidos.

**Finalidad**

Permitir identificar productos sin rotación.

---

### CE-005

Existirán productos sin stock disponible.

**Finalidad**

Permitir consultas relacionadas con abastecimiento.

---

### CE-006

Existirán productos discontinuados con historial de ventas.

**Finalidad**

Permitir mantener información histórica.

---

### CE-007

Existirán productos con alta rotación y productos con muy baja rotación.

**Finalidad**

Permitir análisis de desempeño comercial.

---

## Área: Proveedores

### CE-008

Existirán proveedores inactivos con historial de compras.

**Finalidad**

Conservar la trazabilidad de las operaciones.

---

### CE-009

Existirán proveedores que suministren un único producto y otros que suministren múltiples productos.

**Finalidad**

Permitir consultas sobre relaciones comerciales.

---

## Área: Empleados

### CE-010

Existirán empleados que nunca hayan registrado ventas.

**Finalidad**

Permitir consultas mediante LEFT JOIN y análisis por desempeño.

---

### CE-011

Existirán empleados con diferentes niveles de actividad comercial.

**Finalidad**

Permitir elaborar rankings y estadísticas.

---

### CE-012

Existirán empleados que hayan cambiado de sucursal durante su permanencia en la empresa.

**Finalidad**

Permitir modelar situaciones de evolución organizacional.

---

## Área: Ventas

### CE-013

Existirán ventas anuladas.

**Finalidad**

Permitir consultas diferenciando operaciones válidas y anuladas.

---

### CE-014

Existirán ventas con descuentos aplicados.

**Finalidad**

Permitir análisis de políticas comerciales.

---

### CE-015

Existirán ventas distribuidas a lo largo de varios años.

**Finalidad**

Permitir consultas temporales y comparativas.

---

### CE-016

Existirán períodos con alta y baja actividad comercial.

**Finalidad**

Permitir análisis estacionales.

---

## Área: Compras

### CE-017

Existirán compras parcialmente recibidas.

**Finalidad**

Representar situaciones habituales del abastecimiento.

---

### CE-018

Existirán productos adquiridos en múltiples oportunidades.

**Finalidad**

Permitir análisis históricos de compras.

---

## Área: Inventario

### CE-019

Existirán movimientos de inventario originados por compras, ventas y ajustes administrativos.

**Finalidad**

Permitir analizar el historial completo del stock.

---

### CE-020

Existirán productos cuyo stock haya requerido ajustes por diferencias de inventario.

**Finalidad**

Representar situaciones habituales de control físico.

---

## Área: Organización

### CE-021

Existirán sucursales con distintos niveles de actividad comercial.

**Finalidad**

Permitir comparaciones entre establecimientos.

---

### CE-022

Existirán ciudades con distinta cantidad de clientes, proveedores y sucursales.

**Finalidad**

Permitir consultas geográficas y estadísticas.

---

# 4. Consideraciones para la generación de datos

Los datos del sistema deberán generarse respetando los casos especiales definidos en este documento.

La generación de información no será completamente aleatoria.

Se buscará mantener coherencia funcional y una distribución realista de los datos para representar escenarios habituales de una empresa mediana.

---

# 5. Observaciones

Los casos especiales definidos constituyen un requisito funcional del Bootcamp.

Su incorporación permitirá desarrollar desafíos SQL que abarquen desde consultas básicas hasta análisis avanzados, utilizando siempre la misma base de datos.

Durante el desarrollo del proyecto podrán incorporarse nuevos casos especiales cuando se detecte que favorecen el aprendizaje sin afectar la coherencia del modelo de negocio.

---

# 6. Estado del documento

Versión: 1.0

Estado: **BORRADOR**

Este documento permanecerá en estado BORRADOR hasta la aprobación definitiva del análisis funcional.
