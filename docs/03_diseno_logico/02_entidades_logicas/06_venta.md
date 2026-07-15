# 06. Entidad lógica — Venta

---

# Objetivo

La entidad **Venta** representa cada operación de comercialización realizada por TechStore S.A. a uno de sus clientes.

Su finalidad es registrar la información general de cada venta, actuando como la cabecera del documento comercial. Los productos vendidos, cantidades y precios unitarios serán almacenados en la entidad **DetalleVenta**.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo          | Descripción                                       | Tipo        | Obligatorio |
| ----------------- | ------------------------------------------------- | ----------- | ----------- |
| Identificador     | Identificador interno de la venta.                | Simple      | Sí          |
| NumeroComprobante | Número del comprobante emitido al cliente.        | Simple      | Sí          |
| FechaVenta        | Fecha en que se registra la venta.                | Simple      | Sí          |
| Cliente           | Referencia al cliente que realiza la compra.      | Referencial | Sí          |
| Empleado          | Referencia al empleado que registró la operación. | Referencial | Sí          |
| FormaPago         | Referencia a la forma de pago utilizada.          | Referencial | Sí          |
| Estado            | Estado actual de la venta.                        | Simple      | Sí          |
| Observaciones     | Comentarios generales asociados a la operación.   | Simple      | No          |

---

# Análisis de diseño

## Identificador

Cada venta dispondrá de un identificador interno generado por el sistema.

Este identificador permitirá relacionar la cabecera con los registros correspondientes de **DetalleVenta**.

---

## Número de comprobante

Corresponde al número del documento comercial emitido al cliente.

Su finalidad es facilitar la identificación administrativa, el seguimiento de la operación y la conciliación con la documentación física o electrónica.

---

## Fecha de venta

Representa el momento en que la operación queda registrada en el sistema.

Este atributo forma parte de la información histórica de la transacción.

---

## Cliente

Cada venta estará asociada a un único cliente.

Toda la información descriptiva del cliente permanecerá almacenada exclusivamente en la entidad **Cliente**.

---

## Empleado

Identifica al empleado responsable de registrar la venta.

Este atributo permite mantener la trazabilidad administrativa y facilita el análisis posterior de la actividad comercial.

---

## Forma de pago

Indica el medio de pago acordado para la operación.

Los valores permitidos serán administrados mediante la entidad de catálogo **FormaPago**.

---

## Estado

Permite conocer la situación actual de la venta dentro del proceso comercial.

Su dominio será definido durante la etapa de restricciones.

---

## Observaciones

Permite registrar información adicional relacionada con la operación que no se encuentre representada mediante atributos específicos.

Su utilización es opcional.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Producto.
* Cantidad vendida.
* Precio unitario.
* Subtotal por producto.
* Total de la venta.
* Descuentos calculados.
* Impuestos calculados.
* Stock descontado.

---

## Justificación

Todos estos datos corresponden al detalle de la operación o representan valores derivados.

Los productos, cantidades y precios serán administrados mediante la entidad **DetalleVenta**.

Los importes totales podrán obtenerse a partir de la información almacenada en dicha entidad, evitando redundancia y preservando la consistencia del modelo.

---

# Consideraciones de normalización

La entidad **Venta** representa exclusivamente la cabecera de una operación comercial.

Cada registro almacena la información común a toda la transacción, mientras que los artículos vendidos se representan mediante múltiples registros en **DetalleVenta**.

Esta separación evita grupos repetitivos, mantiene el cumplimiento de las formas normales y permite representar ventas con cualquier cantidad de productos.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria de la entidad.
* Restricción de unicidad del número de comprobante.
* Dominio permitido para el estado de la venta.
* Tipos de datos de cada atributo.
* Índices para búsquedas por cliente y fecha.
* Reglas de integridad referencial con **Cliente**, **Empleado**, **FormaPago** y **DetalleVenta**.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
