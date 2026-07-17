# 10. Entidad lógica — Sector

---

# Objetivo

La entidad **Sector** representa las distintas áreas funcionales que componen la estructura organizacional de TechStore S.A.

Su finalidad es centralizar la administración de los sectores de la empresa, permitiendo clasificar a los empleados y evitando la duplicación de información descriptiva.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                | Tipo   | Obligatorio |
| ------------- | ------------------------------------------ | ------ | ----------- |
| Identificador | Identificador interno del sector.          | Simple | Sí          |
| Nombre        | Nombre del sector.                         | Simple | Sí          |
| Descripción   | Descripción opcional del sector.           | Simple | No          |
| Activo        | Indica si el sector continúa utilizándose. | Simple | Sí          |

---

# Análisis de diseño

## Identificador

Cada sector dispondrá de un identificador interno único generado por el sistema.

Este identificador será utilizado como referencia desde la entidad **Empleado** y por cualquier otra entidad que requiera identificar un área organizacional.

---

## Nombre

Representa el nombre del sector.

Algunos ejemplos son:

* Administración
* Ventas
* Compras
* Depósito
* Recursos Humanos
* Sistemas

El nombre deberá ser único dentro de la organización.

---

## Descripción

Permite registrar información complementaria sobre el sector.

Su utilización es opcional y tiene carácter exclusivamente descriptivo.

---

## Activo

Indica si el sector continúa formando parte de la estructura organizacional.

La utilización de este atributo evita eliminar registros que puedan encontrarse asociados a empleados u otras entidades del sistema.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Cantidad de empleados.
* Responsable del sector.
* Presupuesto.
* Cantidad de ventas.
* Ubicación física.

---

## Justificación

Toda esta información pertenece a otras entidades o puede obtenerse mediante consultas sobre los datos existentes.

La entidad **Sector** debe limitarse a representar la clasificación organizacional de la empresa, respetando el principio de responsabilidad única.

---

# Consideraciones de normalización

La entidad **Sector** constituye una entidad de catálogo reutilizable por múltiples procesos del sistema.

Su incorporación evita almacenar repetidamente el nombre del sector en la entidad **Empleado**, reduciendo redundancias y garantizando la consistencia de la información.

Cada empleado hará referencia a un único sector mediante una relación de integridad referencial.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre el nombre del sector.
* Tipos de datos apropiados para los atributos descriptivos.
* Restricciones para el atributo **Activo**.
* Índices para optimizar las búsquedas y las relaciones con la entidad **Empleado**.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
