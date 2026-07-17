# 15. Entidad lógica — Movimiento de Stock

---

# Objetivo

La entidad **Movimiento de Stock** representa cada operación que produce una variación en las existencias de un producto dentro del inventario de TechStore S.A.

Su finalidad es registrar el historial completo de entradas y salidas de stock, permitiendo reconstruir en cualquier momento el estado del inventario y mantener la trazabilidad de todas las operaciones.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo           | Descripción                                  | Tipo        | Obligatorio |
| ------------------ | -------------------------------------------- | ----------- | ----------- |
| Identificador      | Identificador interno del movimiento.        | Simple      | Sí          |
| Producto           | Referencia al producto afectado.             | Referencial | Sí          |
| Tipo de Movimiento | Referencia al tipo de movimiento registrado. | Referencial | Sí          |
| Fecha              | Fecha y hora del movimiento.                 | Simple      | Sí          |
| Cantidad           | Cantidad de unidades involucradas.           | Simple      | Sí          |
| Observación        | Comentario opcional del movimiento.          | Simple      | No          |

---

# Análisis de diseño

## Identificador

Cada movimiento dispondrá de un identificador interno único generado por el sistema.

Permitirá identificar individualmente cada operación registrada sobre el inventario.

---

## Producto

Cada movimiento afectará a un único producto.

Un mismo producto podrá registrar una cantidad ilimitada de movimientos a lo largo de su ciclo de vida.

---

## Tipo de Movimiento

Cada movimiento deberá clasificarse mediante un registro de la entidad **Tipo de Movimiento de Stock**.

Esta clasificación permitirá identificar el origen de la variación del inventario.

Algunos ejemplos son:

* Compra
* Venta
* Ajuste de Inventario
* Devolución de Cliente
* Devolución a Proveedor
* Rotura
* Transferencia

---

## Fecha

Representa el momento exacto en que el movimiento fue registrado.

Este atributo permitirá reconstruir cronológicamente la evolución del inventario.

---

## Cantidad

Representa la cantidad de unidades involucradas en el movimiento.

El significado (entrada o salida) será determinado por el tipo de movimiento asociado y no por el signo del valor almacenado.

Por este motivo, la cantidad deberá registrarse siempre como un valor positivo.

---

## Observación

Permite registrar información complementaria sobre el movimiento cuando resulte necesario.

Su utilización es opcional.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Stock anterior.
* Stock posterior.
* Stock disponible.
* Valor del inventario.
* Responsable del movimiento.
* Documento asociado.

---

## Justificación

El stock constituye un dato derivado y puede obtenerse mediante la acumulación cronológica de los movimientos registrados.

Almacenar simultáneamente movimientos y stock calculado introduciría redundancia y aumentaría el riesgo de inconsistencias.

La identificación del documento que originó el movimiento podrá resolverse en futuras ampliaciones del sistema si el negocio lo requiere.

---

# Consideraciones de normalización

La entidad **Movimiento de Stock** registra únicamente hechos ocurridos sobre el inventario.

No almacena información derivada ni estados acumulados.

Cada movimiento referencia a un único **Producto** y a un único **Tipo de Movimiento de Stock**, garantizando la integridad referencial y permitiendo reconstruir el historial completo del inventario mediante consultas SQL.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Claves foráneas hacia **Producto** y **Tipo de Movimiento de Stock**.
* Restricciones sobre la cantidad.
* Tipos de datos para fecha y observación.
* Índices sobre producto, fecha y tipo de movimiento.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
