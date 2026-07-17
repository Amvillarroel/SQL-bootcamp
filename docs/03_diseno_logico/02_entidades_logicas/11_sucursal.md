# 11. Entidad lógica — Sucursal

---

# Objetivo

La entidad **Sucursal** representa cada uno de los establecimientos físicos desde los cuales TechStore S.A. desarrolla sus operaciones comerciales.

Su finalidad es centralizar la información permanente de cada sucursal, permitiendo identificar el lugar donde se realizan las operaciones del negocio y facilitando la organización administrativa de la empresa.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                            | Tipo        | Obligatorio |
| ------------- | ------------------------------------------------------ | ----------- | ----------- |
| Identificador | Identificador interno de la sucursal.                  | Simple      | Sí          |
| Nombre        | Nombre de la sucursal.                                 | Simple      | Sí          |
| Dirección     | Domicilio de la sucursal.                              | Simple      | Sí          |
| Ciudad        | Referencia a la ciudad donde se encuentra la sucursal. | Referencial | Sí          |
| Activa        | Indica si la sucursal continúa operando.               | Simple      | Sí          |

---

# Análisis de diseño

## Identificador

Cada sucursal dispondrá de un identificador interno único generado por el sistema.

Será utilizado como referencia por distintas entidades del modelo.

---

## Nombre

Representa el nombre comercial o identificador utilizado para distinguir la sucursal.

Algunos ejemplos podrían ser:

* Casa Central
* Sucursal Norte
* Sucursal Córdoba

El nombre deberá ser único dentro de la organización.

---

## Dirección

Representa el domicilio físico donde opera la sucursal.

Este dato permitirá identificar correctamente cada establecimiento.

---

## Ciudad

Cada sucursal estará ubicada en una única ciudad.

La información geográfica será administrada por la entidad **Ciudad**, evitando duplicación de datos y facilitando futuras consultas geográficas.

---

## Activa

Indica si la sucursal continúa operando.

Cuando una sucursal deje de funcionar, podrá marcarse como inactiva sin eliminar los registros históricos relacionados.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Cantidad de empleados.
* Cantidad de ventas.
* Responsable de la sucursal.
* Stock total.
* Facturación acumulada.

---

## Justificación

Todos estos datos pertenecen a otras entidades o pueden obtenerse mediante consultas sobre la información transaccional.

La entidad **Sucursal** debe limitarse a representar las características permanentes de cada establecimiento.

---

# Consideraciones de normalización

La entidad **Sucursal** representa exclusivamente la información permanente de cada establecimiento comercial.

La ubicación geográfica se delega a la entidad **Ciudad**, evitando almacenar repetidamente nombres de localidades y favoreciendo la consistencia del modelo.

Las estadísticas operativas relacionadas con cada sucursal deberán obtenerse mediante consultas sobre las entidades transaccionales, evitando almacenar información derivada.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre el nombre de la sucursal.
* Tipos de datos para los atributos descriptivos.
* Restricciones para el atributo **Activa**.
* Índices sobre la referencia a **Ciudad**.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
