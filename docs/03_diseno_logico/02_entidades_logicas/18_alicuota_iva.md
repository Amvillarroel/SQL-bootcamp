# 18. Entidad lógica — Alícuota IVA

---

# Objetivo

La entidad **Alícuota IVA** representa el catálogo de alícuotas del Impuesto al Valor Agregado (IVA) utilizadas por TechStore S.A.

Su finalidad es centralizar las distintas alícuotas aplicables a los productos comercializados, garantizando la consistencia de la información tributaria y evitando la duplicación de valores en las entidades transaccionales.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                                      | Tipo   | Obligatorio |
| ------------- | ---------------------------------------------------------------- | ------ | ----------- |
| Identificador | Identificador interno de la alícuota.                            | Simple | Sí          |
| Nombre        | Denominación de la alícuota.                                     | Simple | Sí          |
| Porcentaje    | Valor porcentual de la alícuota.                                 | Simple | Sí          |
| Descripción   | Información adicional sobre la alícuota.                         | Simple | No          |
| Activa        | Indica si la alícuota continúa disponible para nuevos productos. | Simple | Sí          |

---

# Análisis de diseño

## Identificador

Cada alícuota dispondrá de un identificador interno único generado por el sistema.

Será utilizado como referencia por la entidad **Producto**.

---

## Nombre

Representa una denominación descriptiva para la alícuota.

Algunos ejemplos son:

* IVA 0 %
* IVA 10,5 %
* IVA 21 %
* IVA 27 %

Su objetivo es facilitar la identificación por parte de los usuarios.

---

## Porcentaje

Representa el porcentaje de IVA correspondiente a la alícuota.

Este valor será utilizado por la lógica de negocio para calcular el importe del impuesto durante las operaciones de compra y venta.

---

## Descripción

Permite registrar información adicional sobre la alícuota.

Su utilización es opcional y tiene carácter exclusivamente descriptivo.

---

## Activa

Indica si la alícuota continúa disponible para asociarse a nuevos productos.

Cuando una normativa tributaria deje de utilizar una determinada alícuota, podrá marcarse como inactiva sin afectar los registros históricos.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Importe del IVA.
* Base imponible.
* Total gravado.
* Fecha de aplicación en una operación.
* Tipo de comprobante.

---

## Justificación

Estos datos corresponden a operaciones específicas de compra y venta o pueden calcularse a partir de la información almacenada.

La entidad **Alícuota IVA** debe representar únicamente el catálogo de porcentajes tributarios disponibles para el sistema.

---

# Consideraciones de normalización

La entidad **Alícuota IVA** constituye un catálogo reutilizable por la entidad **Producto**.

Cada producto hará referencia a una única alícuota vigente mediante una relación de integridad referencial.

Durante las operaciones de compra y venta, el sistema obtendrá la alícuota asociada al producto para calcular el importe del impuesto, evitando almacenar repetidamente el porcentaje en cada transacción.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre el nombre de la alícuota.
* Restricciones sobre el atributo **Porcentaje**.
* Tipos de datos apropiados para almacenar valores porcentuales.
* Restricciones para el atributo **Activa**.
* Índices para optimizar las búsquedas y las relaciones con la entidad **Producto**.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
