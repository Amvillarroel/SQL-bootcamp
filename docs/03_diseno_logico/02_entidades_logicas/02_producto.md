# 02. Entidad lógica — Producto

---

# Objetivo

La entidad **Producto** representa cada uno de los artículos comercializados por TechStore S.A.

Su finalidad es almacenar exclusivamente la información descriptiva y permanente de los productos, independientemente de las operaciones comerciales, compras, ventas o movimientos de inventario en los que participen.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo       | Descripción                                                                  | Tipo        | Obligatorio |
| -------------- | ---------------------------------------------------------------------------- | ----------- | ----------- |
| Identificador  | Identificador interno del producto.                                          | Simple      | Sí          |
| CodigoProducto | Código interno utilizado por la empresa para identificar el producto.        | Simple      | Sí          |
| Nombre         | Nombre comercial del producto.                                               | Simple      | Sí          |
| Descripcion    | Descripción detallada del artículo.                                          | Simple      | No          |
| Categoria      | Categoría a la que pertenece el producto. Referencia a la entidad Categoría. | Referencial | Sí          |
| Marca          | Marca comercial del producto. Referencia a la entidad Marca.                 | Referencial | Sí          |
| UnidadMedida   | Unidad en la que se administra el producto (unidad, caja, paquete, etc.).    | Simple      | Sí          |
| Estado         | Indica si el producto se encuentra disponible para su comercialización.      | Simple      | Sí          |
| FechaAlta      | Fecha de incorporación del producto al catálogo.                             | Simple      | Sí          |

---

# Análisis de diseño

## Identificador

Todo producto deberá poseer un identificador interno generado por el sistema.

Este atributo permitirá establecer relaciones con el resto de las entidades del modelo sin depender de códigos comerciales.

---

## Código del producto

El código constituye el identificador utilizado por la empresa para reconocer el producto dentro de sus procesos administrativos.

Aunque normalmente será único, las restricciones correspondientes serán definidas en etapas posteriores.

---

## Nombre

Representa la denominación comercial del producto.

Es uno de los principales atributos descriptivos de la entidad.

---

## Descripción

Permite ampliar la información comercial del producto.

No resulta indispensable para identificarlo, por lo que se considera un atributo opcional.

---

## Categoría

Cada producto pertenece a una única categoría, de acuerdo con las decisiones adoptadas durante el MER.

Este atributo representa una referencia lógica hacia la entidad **Categoría**.

---

## Marca

Cada producto pertenece a una única marca comercial.

La marca constituye información maestra reutilizable y se representa mediante una referencia a la entidad correspondiente.

---

## Unidad de medida

Define la unidad básica utilizada para administrar el producto.

Su existencia facilita el manejo uniforme de cantidades durante las operaciones de compra, venta y stock.

---

## Estado

Permite indicar si el producto continúa formando parte del catálogo activo de la empresa.

La desactivación evita eliminar información histórica relacionada con operaciones comerciales ya realizadas.

---

## Fecha de alta

Registra el momento en que el producto fue incorporado al catálogo.

Se trata de un atributo propio de la entidad y no de información derivada de procesos transaccionales.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Precio de compra.
* Precio de venta.
* Stock actual.
* Stock mínimo.
* Stock máximo.
* Cantidad vendida.
* Cantidad comprada.
* Última compra.
* Última venta.
* Proveedor principal.

---

## Justificación

Estos datos representan información transaccional, histórica o derivada de otras entidades del modelo.

Su almacenamiento dentro de **Producto** generaría redundancia, aumentaría el acoplamiento entre entidades y podría provocar inconsistencias durante las actualizaciones.

Cada uno de estos conceptos será administrado por las entidades especializadas correspondientes.

---

# Consideraciones de normalización

La entidad **Producto** mantiene el principio de responsabilidad única al almacenar únicamente información descriptiva del artículo comercial.

Las relaciones con Categoría y Marca se resuelven mediante referencias a entidades independientes, evitando duplicación de información.

La relación con los proveedores no se almacena directamente en esta entidad, sino mediante la entidad asociativa **ProductoProveedor**, de acuerdo con las decisiones adoptadas en el MER.

La información de precios, existencias y movimientos comerciales permanece desacoplada de la entidad Producto, preservando la integridad y favoreciendo la normalización del modelo.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria de la entidad.
* Restricción de unicidad del código de producto.
* Dominio permitido para el estado del producto.
* Restricciones asociadas a la categoría y la marca.
* Tipos de datos de cada atributo.
* Índices para optimizar búsquedas por código y nombre.
* Reglas de integridad referencial con Categoría y Marca.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
