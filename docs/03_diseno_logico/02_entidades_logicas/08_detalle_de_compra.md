# 08. Entidad lógica — Detalle de Compra

---

# Objetivo

La entidad **DetalleCompra** representa cada uno de los productos incluidos en una compra realizada por TechStore S.A.

Su finalidad es registrar la información específica de cada línea del documento de compra, permitiendo representar adquisiciones con cualquier cantidad de productos.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo            | Descripción                                                                  | Tipo                    | Obligatorio |
| ------------------- | ---------------------------------------------------------------------------- | ----------------------- | ----------- |
| Identificador       | Identificador interno del detalle.                                           | Simple                  | Sí          |
| Compra              | Referencia a la compra a la que pertenece la línea.                          | Referencial             | Sí          |
| Producto            | Referencia al producto adquirido.                                            | Referencial             | Sí          |
| Cantidad            | Cantidad de unidades compradas.                                              | Simple                  | Sí          |
| PrecioUnitario      | Precio de compra aplicado al producto.                                       | Simple                  | Sí          |
| Descuento           | Descuento aplicado por el proveedor sobre la línea.                          | Simple                  | No          |
| AlicuotaIVAAplicada | Referencia a la alícuota de IVA utilizada al momento de registrar la compra. | Referencial (histórico) | Sí          |

---

# Análisis de diseño

## Identificador

Cada línea del detalle dispondrá de un identificador interno generado por el sistema.

Este identificador facilitará la administración del registro y permitirá futuras relaciones con otras entidades si fueran necesarias.

---

## Compra

Cada registro del detalle pertenecerá a una única compra.

Una misma compra podrá contener múltiples registros en **DetalleCompra**, siguiendo el patrón de cabecera y detalle utilizado en todo el modelo.

---

## Producto

Cada línea hará referencia a un único producto.

La información descriptiva del artículo permanecerá almacenada exclusivamente en la entidad **Producto**.

---

## Cantidad

Representa el número de unidades adquiridas del producto.

Debe ser un valor positivo y mayor que cero.

---

## PrecioUnitario

Corresponde al costo efectivamente abonado por unidad al momento de la compra.

Este valor se almacena para preservar el historial de costos, aun cuando el precio de compra del producto cambie en operaciones futuras.

---

## Descuento

Representa el descuento aplicado por el proveedor sobre esa línea de compra.

Su utilización es opcional y dependerá de las condiciones comerciales negociadas para la operación.

---

## AlicuotaIVAAplicada

Representa la alícuota de IVA utilizada al momento de registrar la compra.

Aunque cada producto posee una alícuota vigente definida mediante la entidad **AlicuotaIVA**, este dato se conserva en el detalle para preservar el historial tributario de la operación.

De esta manera, una modificación posterior de la alícuota vigente del producto no altera la información registrada en comprobantes históricos.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Nombre del producto.
* Marca.
* Categoría.
* Proveedor.
* Fecha de compra.
* Total de la compra.
* Stock disponible.
* Precio vigente del producto.

---

## Justificación

Todos estos datos pertenecen a otras entidades o pueden obtenerse mediante relaciones entre tablas.

El almacenamiento redundante incrementaría el riesgo de inconsistencias y violaría los principios de normalización.

Las únicas excepciones corresponden al **PrecioUnitario** y a la **AlicuotaIVAAplicada**, ya que ambos representan información histórica propia de la operación y deben conservarse aunque los valores vigentes cambien con el tiempo.

---

# Consideraciones de normalización

La entidad **DetalleCompra** representa exclusivamente cada línea individual de una compra.

Cada registro almacena únicamente la información necesaria para describir un producto adquirido dentro de una transacción específica.

La relación con **Compra** permite agrupar múltiples líneas bajo un mismo documento, mientras que la relación con **Producto** evita duplicar información descriptiva del catálogo.

Los atributos **PrecioUnitario** y **AlicuotaIVAAplicada** constituyen datos históricos de la operación y se almacenan deliberadamente para preservar la trazabilidad contable y tributaria.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria de la entidad.
* Restricción para impedir cantidades menores o iguales a cero.
* Dominio permitido para el descuento.
* Tipos de datos apropiados para cantidades e importes.
* Índices sobre las referencias a **Compra**, **Producto** y **AlicuotaIVA**.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
