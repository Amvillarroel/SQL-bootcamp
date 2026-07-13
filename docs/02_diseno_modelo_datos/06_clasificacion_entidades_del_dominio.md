# Clasificación de Entidades del Dominio

**Proyecto:** SQL Bootcamp
**Módulo:** 2 - Diseñar el Modelo de Datos (MER)
**Fase:** 2.2 - Diseño del Modelo Entidad-Relación (MER)
**Documento:** 06_Clasificacion_Entidades.md
**Estado:** APROBADO v1.0

---

# 1. Objetivo

Antes de diseñar un Modelo Entidad-Relación (MER), resulta conveniente identificar el papel que desempeña cada entidad dentro del dominio del negocio.

La clasificación de entidades permite comprender cómo se estructura la información, facilita el diseño del modelo de datos y reduce la probabilidad de cometer errores de modelado.

Este documento presenta la metodología de clasificación adoptada para el proyecto y su aplicación sobre el dominio funcional de TechStore S.A.

---

# 2. ¿Por qué clasificar las entidades?

No todas las entidades cumplen la misma función dentro de un sistema.

Algunas representan información relativamente estable, otras registran eventos que ocurren en el tiempo y otras existen únicamente para resolver relaciones entre entidades.

Clasificar las entidades antes de comenzar el MER permite:

* Comprender mejor el dominio del negocio.
* Facilitar la identificación de relaciones.
* Detectar posibles inconsistencias del modelo.
* Construir un MER de manera ordenada.
* Mantener una separación clara entre información permanente y eventos del negocio.

---

# 3. Tipos de entidades

## 3.1 Entidades Maestras (Master Data)

Representan los principales actores u objetos del negocio.

Sus registros suelen permanecer durante largos períodos y son utilizados por múltiples procesos.

Características:

* Baja frecuencia de cambios.
* Alto nivel de reutilización.
* Constituyen la base del modelo de datos.

Ejemplos:

* Cliente
* Producto
* Proveedor
* Empleado
* Sucursal

---

## 3.2 Entidades Transaccionales (Transactional Data)

Representan hechos o eventos ocurridos durante la operación del negocio.

Cada registro corresponde a una transacción que debe conservarse por motivos operativos, históricos o de auditoría.

Características:

* Alto volumen de registros.
* Crecimiento continuo.
* Representan eventos.

Ejemplos:

* Venta
* Compra
* Movimiento de Stock

---

## 3.3 Entidades de Detalle

Representan el contenido de una transacción.

Permiten descomponer una operación compleja en múltiples elementos individuales.

Características:

* Dependen de una entidad transaccional.
* Normalmente resuelven relaciones de muchos a muchos.
* Almacenan información específica de cada línea de una operación.

Ejemplos:

* Detalle de Venta
* Detalle de Compra

---

## 3.4 Entidades de Catálogo

Representan conjuntos de valores relativamente estables utilizados para organizar o clasificar la información.

Características:

* Escaso crecimiento.
* Alta reutilización.
* Favorecen la normalización del modelo.

Ejemplos:

* Categoría
* Sector
* Provincia
* Ciudad
* Forma de Pago

---

## 3.5 Entidades Asociativas

Representan relaciones entre entidades cuando estas poseen atributos propios o cuando es necesario resolver relaciones de muchos a muchos.

No todos los modelos requieren entidades asociativas independientes.

Su incorporación dependerá del análisis realizado durante el diseño del MER.

---

# 4. Clasificación de las entidades de TechStore S.A.

| Código  | Entidad             | Clasificación |
| ------- | ------------------- | ------------- |
| ENT-001 | Cliente                     | Maestra       |
| ENT-002 | Producto                    | Maestra       |
| ENT-003 | Categoría                   | Catálogo      |
| ENT-004 | Proveedor                   | Maestra       |
| ENT-005 | Compra                      | Transaccional |
| ENT-006 | Venta                       | Transaccional |
| ENT-007 | Detalle de Venta            | Detalle       |
| ENT-008 | Detalle de Compra           | Detalle       |
| ENT-009 | Empleado                    | Maestra       |
| ENT-010 | Sector                      | Catálogo      |
| ENT-011 | Sucursal                    | Maestra       |
| ENT-012 | Ciudad                      | Catálogo      |
| ENT-013 | Provincia                   | Catálogo      |
| ENT-014 | Forma de Pago               | Catálogo      |
| ENT-015 | Movimiento de Stock         | Transaccional |
| ENT-016 | Marca                       | Catálogo      |
| ENT-017 | Tipo Movimiento de Stock    | Catálogo      |

---

# 5. Observaciones

La clasificación presentada constituye una herramienta de análisis y no implica decisiones de implementación física.

Durante el diseño del MER podrán incorporarse nuevas entidades o modificarse la clasificación de alguna existente si el análisis del dominio así lo requiere.

---

# 6. Conclusión

La clasificación de entidades representa el puente entre el análisis funcional y el diseño lógico del modelo de datos.

Comprender el papel que desempeña cada entidad permite construir modelos más consistentes, facilitar la identificación de relaciones y mejorar la calidad del diseño.

Por este motivo, la clasificación de entidades constituye la primera actividad formal de la Fase 2.2 del SQL Bootcamp y será utilizada como referencia para el desarrollo del Modelo Entidad-Relación.
