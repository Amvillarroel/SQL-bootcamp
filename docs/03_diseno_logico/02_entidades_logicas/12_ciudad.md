# 12. Entidad lógica — Ciudad

---

# Objetivo

La entidad **Ciudad** representa las localidades geográficas utilizadas por TechStore S.A. para registrar domicilios y ubicaciones dentro del sistema.

Su finalidad es centralizar la información de las ciudades, evitando la duplicación de nombres y garantizando la consistencia de los datos geográficos utilizados por distintas entidades del modelo.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                                      | Tipo        | Obligatorio |
| ------------- | ---------------------------------------------------------------- | ----------- | ----------- |
| Identificador | Identificador interno de la ciudad.                              | Simple      | Sí          |
| Nombre        | Nombre de la ciudad.                                             | Simple      | Sí          |
| Provincia     | Referencia a la provincia a la que pertenece.                    | Referencial | Sí          |
| Activa        | Indica si la ciudad continúa disponible para nuevas operaciones. | Simple      | Sí          |

---

# Análisis de diseño

## Identificador

Cada ciudad dispondrá de un identificador interno único generado por el sistema.

Este identificador será utilizado como referencia por las entidades que requieran almacenar información geográfica.

---

## Nombre

Representa el nombre oficial de la ciudad.

El mismo nombre podría existir en distintas provincias, por lo que la identificación completa de una ciudad estará determinada por su relación con la entidad **Provincia**.

---

## Provincia

Cada ciudad pertenecerá a una única provincia.

La administración de las provincias se realizará mediante la entidad **Provincia**, evitando duplicar información geográfica y manteniendo una estructura jerárquica normalizada.

---

## Activa

Indica si la ciudad continúa disponible para ser utilizada en nuevos registros.

Su utilización permite conservar información histórica sin necesidad de eliminar registros que ya se encuentren relacionados con clientes, proveedores o sucursales.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Cantidad de habitantes.
* Código postal.
* Región.
* País.
* Cantidad de clientes.
* Cantidad de proveedores.
* Cantidad de sucursales.

---

## Justificación

Estos datos corresponden a otras entidades, pueden obtenerse mediante consultas o exceden el alcance funcional del presente proyecto.

La entidad **Ciudad** debe limitarse a representar la unidad geográfica utilizada por el negocio.

---

# Consideraciones de normalización

La entidad **Ciudad** constituye un catálogo geográfico reutilizable por múltiples entidades del modelo.

Su utilización evita almacenar repetidamente nombres de ciudades en **Cliente**, **Proveedor** y **Sucursal**, reduciendo inconsistencias y facilitando la actualización de la información geográfica.

La relación con **Provincia** permite construir una estructura territorial completamente normalizada y preparada para futuras ampliaciones.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre la combinación **Provincia + Nombre**.
* Tipos de datos apropiados para los atributos descriptivos.
* Restricciones para el atributo **Activa**.
* Índices sobre la referencia a **Provincia**.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
