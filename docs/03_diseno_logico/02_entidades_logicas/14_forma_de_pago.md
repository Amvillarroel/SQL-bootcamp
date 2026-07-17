# 14. Entidad lógica — Forma de Pago

---

# Objetivo

La entidad **Forma de Pago** representa los distintos medios mediante los cuales TechStore S.A. registra el pago de compras y ventas.

Su finalidad es centralizar el catálogo de formas de pago utilizadas por la organización, evitando la duplicación de valores y garantizando la consistencia de las operaciones comerciales.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                                             | Tipo   | Obligatorio |
| ------------- | ----------------------------------------------------------------------- | ------ | ----------- |
| Identificador | Identificador interno de la forma de pago.                              | Simple | Sí          |
| Nombre        | Nombre de la forma de pago.                                             | Simple | Sí          |
| Descripción   | Descripción opcional del medio de pago.                                 | Simple | No          |
| Activa        | Indica si la forma de pago continúa disponible para nuevas operaciones. | Simple | Sí          |

---

# Análisis de diseño

## Identificador

Cada forma de pago dispondrá de un identificador interno único generado por el sistema.

Este identificador será utilizado como referencia por las entidades transaccionales que registren operaciones comerciales.

---

## Nombre

Representa el nombre de la forma de pago.

Algunos ejemplos son:

* Efectivo
* Tarjeta de Débito
* Tarjeta de Crédito
* Transferencia Bancaria
* Cheque
* Cuenta Corriente

El nombre deberá ser único dentro del catálogo.

---

## Descripción

Permite registrar información adicional sobre la forma de pago.

Su utilización es opcional y tiene carácter exclusivamente descriptivo.

---

## Activa

Indica si la forma de pago continúa disponible para nuevas operaciones.

La utilización de este atributo evita eliminar registros históricos que ya hayan sido utilizados en compras o ventas.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Cantidad de cuotas.
* Interés financiero.
* Banco emisor.
* Número de cheque.
* Fecha de vencimiento.
* Comisión.
* Importe máximo permitido.

---

## Justificación

Estos datos corresponden a operaciones particulares o a futuros módulos financieros.

La entidad **Forma de Pago** debe limitarse a representar el catálogo de medios de pago disponibles para el sistema.

Las características específicas de cada operación deberán almacenarse, si fuera necesario, en entidades transaccionales especializadas.

---

# Consideraciones de normalización

La entidad **Forma de Pago** constituye un catálogo reutilizable por múltiples procesos del sistema.

Su utilización evita almacenar repetidamente nombres de medios de pago en las entidades transaccionales, garantizando la consistencia de la información y facilitando futuras modificaciones del catálogo.

Cada compra o venta hará referencia a una única forma de pago mediante una relación de integridad referencial.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre el nombre de la forma de pago.
* Tipos de datos apropiados para los atributos descriptivos.
* Restricciones para el atributo **Activa**.
* Índices para optimizar las búsquedas y las relaciones con las entidades transaccionales.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
