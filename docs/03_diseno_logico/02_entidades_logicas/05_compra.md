# 05. Entidad lógica — Compra

---

# Objetivo

La entidad **Compra** representa cada operación de adquisición de mercaderías realizada por TechStore S.A. a un proveedor.

Su finalidad es registrar la información general de cada compra, actuando como la cabecera del documento comercial. Los productos adquiridos, cantidades y precios individuales serán almacenados en la entidad **DetalleCompra**.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo          | Descripción                                       | Tipo        | Obligatorio |
| ----------------- | ------------------------------------------------- | ----------- | ----------- |
| Identificador     | Identificador interno de la compra.               | Simple      | Sí          |
| NumeroComprobante | Número del comprobante emitido por el proveedor.  | Simple      | Sí          |
| FechaCompra       | Fecha en que se registra la compra.               | Simple      | Sí          |
| Proveedor         | Referencia al proveedor que realizó la venta.     | Referencial | Sí          |
| Empleado          | Referencia al empleado que registró la operación. | Referencial | Sí          |
| FormaPago         | Referencia a la forma de pago utilizada.          | Referencial | Sí          |
| Estado            | Estado actual de la compra.                       | Simple      | Sí          |
| Observaciones     | Comentarios generales asociados a la operación.   | Simple      | No          |

---

# Análisis de diseño

## Identificador

Cada compra dispondrá de un identificador interno generado por el sistema.

Este identificador será utilizado para relacionar la cabecera con los registros de **DetalleCompra**.

---

## Número de comprobante

Corresponde al número del documento comercial emitido por el proveedor.

Su finalidad es facilitar la identificación administrativa y la conciliación con la documentación física o electrónica.

---

## Fecha de compra

Representa el momento en que la operación queda registrada dentro del sistema.

Este atributo forma parte de la información histórica de la transacción.

---

## Proveedor

Cada compra estará asociada a un único proveedor.

La información descriptiva del proveedor permanecerá almacenada exclusivamente en la entidad **Proveedor**.

---

## Empleado

Identifica al empleado responsable de registrar la operación.

Su incorporación permite mantener trazabilidad administrativa sobre las compras realizadas.

---

## Forma de pago

Indica el medio de pago acordado para la operación.

Los valores permitidos serán administrados mediante la entidad de catálogo **FormaPago**.

---

## Estado

Permite conocer la situación actual de la compra dentro del proceso administrativo.

Su dominio será definido durante la etapa de restricciones.

---

## Observaciones

Permite registrar información adicional que no forme parte de los atributos estructurados de la entidad.

Su utilización es opcional.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Producto.
* Cantidad comprada.
* Precio unitario.
* Subtotal por producto.
* Total de unidades.
* Total de la compra.
* Impuestos calculados.
* Stock generado.

---

## Justificación

Todos estos datos corresponden al detalle de la operación o son valores derivados de la misma.

Los productos, cantidades y precios individuales serán administrados mediante la entidad **DetalleCompra**.

Los importes totales podrán calcularse a partir de la información almacenada en dicha entidad, evitando redundancia y preservando la consistencia del modelo.

---

# Consideraciones de normalización

La entidad **Compra** representa exclusivamente la cabecera de una operación comercial.

Cada registro almacena información común a toda la transacción, mientras que los productos adquiridos se representan mediante múltiples registros en **DetalleCompra**.

Esta separación elimina grupos repetitivos, facilita la normalización y permite representar compras con cualquier cantidad de productos.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria de la entidad.
* Restricción de unicidad del número de comprobante según el proveedor.
* Dominio permitido para el estado de la compra.
* Tipos de datos de cada atributo.
* Índices para búsquedas por proveedor y fecha.
* Reglas de integridad referencial con **Proveedor**, **Empleado**, **FormaPago** y **DetalleCompra**.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
