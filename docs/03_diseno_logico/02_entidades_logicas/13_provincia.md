# 13. Entidad lógica — Provincia

---

# Objetivo

La entidad **Provincia** representa las divisiones políticas de primer nivel utilizadas por TechStore S.A. para organizar la información geográfica del sistema.

Su finalidad es centralizar el catálogo de provincias y servir como base para la clasificación de ciudades, garantizando la consistencia de toda la información territorial utilizada por la organización.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                                         | Tipo   | Obligatorio |
| ------------- | ------------------------------------------------------------------- | ------ | ----------- |
| Identificador | Identificador interno de la provincia.                              | Simple | Sí          |
| Nombre        | Nombre oficial de la provincia.                                     | Simple | Sí          |
| Activa        | Indica si la provincia continúa disponible para nuevas operaciones. | Simple | Sí          |

---

# Análisis de diseño

## Identificador

Cada provincia dispondrá de un identificador interno único generado por el sistema.

Este identificador será utilizado como referencia por la entidad **Ciudad**.

---

## Nombre

Representa el nombre oficial de la provincia.

Cada provincia deberá registrarse una única vez dentro del catálogo.

---

## Activa

Permite indicar si la provincia continúa disponible para nuevas registraciones dentro del sistema.

Su utilización evita eliminar registros históricos cuando existan ciudades, clientes, proveedores o sucursales asociados.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* País.
* Código ISO.
* Región.
* Capital.
* Cantidad de ciudades.
* Cantidad de sucursales.
* Cantidad de clientes.
* Cantidad de proveedores.

---

## Justificación

Estos datos pueden obtenerse mediante relaciones con otras entidades o corresponden a información que excede el alcance funcional del presente proyecto.

La entidad **Provincia** debe representar únicamente el catálogo de provincias utilizado por el sistema.

---

# Consideraciones de normalización

La entidad **Provincia** constituye el nivel superior de la estructura geográfica del modelo.

Su utilización evita repetir nombres de provincias en múltiples entidades y permite que la información territorial permanezca centralizada.

Las entidades **Ciudad**, **Cliente**, **Proveedor** y **Sucursal** obtendrán indirectamente la información provincial mediante las relaciones definidas en el modelo, eliminando redundancias y favoreciendo la consistencia de los datos.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre el nombre de la provincia.
* Tipos de datos apropiados para los atributos descriptivos.
* Restricciones para el atributo **Activa**.
* Índices para optimizar las búsquedas y las relaciones con la entidad **Ciudad**.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
