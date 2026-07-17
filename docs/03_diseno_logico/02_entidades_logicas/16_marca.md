# 16. Entidad lógica — Marca

---

# Objetivo

La entidad **Marca** representa las distintas marcas comerciales asociadas a los productos comercializados por TechStore S.A.

Su finalidad es centralizar el catálogo de marcas utilizadas por la organización, evitando la duplicación de nombres y garantizando la consistencia de la información comercial del sistema.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                                   | Tipo   | Obligatorio |
| ------------- | ------------------------------------------------------------- | ------ | ----------- |
| Identificador | Identificador interno de la marca.                            | Simple | Sí          |
| Nombre        | Nombre comercial de la marca.                                 | Simple | Sí          |
| Descripción   | Información adicional sobre la marca.                         | Simple | No          |
| Activa        | Indica si la marca continúa disponible para nuevos productos. | Simple | Sí          |

---

# Análisis de diseño

## Identificador

Cada marca dispondrá de un identificador interno único generado por el sistema.

Será utilizado como referencia por la entidad **Producto**.

---

## Nombre

Representa el nombre comercial de la marca.

Algunos ejemplos son:

* Samsung
* Lenovo
* HP
* Logitech
* Kingston
* Intel

Cada marca deberá registrarse una única vez dentro del catálogo.

---

## Descripción

Permite registrar información complementaria sobre la marca.

Su utilización es opcional y tiene carácter exclusivamente descriptivo.

---

## Activa

Indica si la marca continúa disponible para asociarse a nuevos productos.

Cuando una marca deje de comercializarse, podrá marcarse como inactiva sin afectar el historial de los productos ya registrados.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* País de origen.
* Sitio web.
* Representante comercial.
* Cantidad de productos.
* Cantidad de ventas.
* Participación en el mercado.

---

## Justificación

Estos datos corresponden a otros procesos del negocio, pueden obtenerse mediante consultas o exceden el alcance funcional del presente proyecto.

La entidad **Marca** debe representar únicamente el catálogo de marcas comerciales utilizado por el sistema.

---

# Consideraciones de normalización

La entidad **Marca** constituye un catálogo reutilizable por la entidad **Producto**.

Su utilización evita almacenar repetidamente nombres de marcas en los registros de productos, reduciendo redundancias y garantizando la consistencia de la información comercial.

Cada producto hará referencia a una única marca mediante una relación de integridad referencial.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre el nombre de la marca.
* Tipos de datos apropiados para los atributos descriptivos.
* Restricciones para el atributo **Activa**.
* Índices para optimizar las búsquedas y las relaciones con la entidad **Producto**.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
