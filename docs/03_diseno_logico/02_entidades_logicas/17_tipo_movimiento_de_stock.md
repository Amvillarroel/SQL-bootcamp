# 17. Entidad lógica — Tipo de Movimiento de Stock

---

# Objetivo

La entidad **Tipo de Movimiento de Stock** representa el catálogo de operaciones que pueden producir una variación en el inventario de TechStore S.A.

Su finalidad es clasificar cada movimiento registrado sobre el stock, permitiendo identificar su origen y mantener la consistencia de la información almacenada.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo          | Descripción                                                                  | Tipo   | Obligatorio |
| ----------------- | ---------------------------------------------------------------------------- | ------ | ----------- |
| Identificador     | Identificador interno del tipo de movimiento.                                | Simple | Sí          |
| Nombre            | Nombre del tipo de movimiento.                                               | Simple | Sí          |
| Descripción       | Información adicional sobre el tipo de movimiento.                           | Simple | No          |
| Tipo de Variación | Indica si el movimiento representa una entrada o una salida de stock.        | Simple | Sí          |
| Activo            | Indica si el tipo de movimiento continúa disponible para nuevas operaciones. | Simple | Sí          |

---

# Análisis de diseño

## Identificador

Cada tipo de movimiento dispondrá de un identificador interno único generado por el sistema.

Será utilizado como referencia por la entidad **Movimiento de Stock**.

---

## Nombre

Representa el nombre del movimiento.

Algunos ejemplos son:

* Compra
* Venta
* Ajuste de Inventario
* Devolución de Cliente
* Devolución a Proveedor
* Rotura
* Transferencia

Cada tipo de movimiento deberá registrarse una única vez dentro del catálogo.

---

## Descripción

Permite registrar información complementaria sobre el tipo de movimiento.

Su utilización es opcional y tiene carácter exclusivamente descriptivo.

---

## Tipo de Variación

Indica el efecto que el movimiento produce sobre el inventario.

Los valores permitidos serán:

* Entrada
* Salida

Esta clasificación permitirá determinar el comportamiento del movimiento sin necesidad de interpretar el nombre del tipo registrado.

---

## Activo

Indica si el tipo de movimiento continúa disponible para nuevas operaciones.

La desactivación de un tipo no afectará los movimientos históricos ya registrados.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Cantidad de movimientos.
* Responsable del movimiento.
* Documento asociado.
* Impacto económico.
* Prioridad.
* Fecha de creación.

---

## Justificación

Estos datos corresponden a entidades transaccionales, pueden obtenerse mediante consultas o exceden el alcance funcional del presente proyecto.

La entidad **Tipo de Movimiento de Stock** debe representar únicamente el catálogo de clasificaciones utilizado por el sistema.

---

# Consideraciones de normalización

La entidad **Tipo de Movimiento de Stock** constituye un catálogo reutilizable por la entidad **Movimiento de Stock**.

Su utilización evita almacenar repetidamente textos descriptivos en cada movimiento registrado y garantiza la consistencia de la clasificación del inventario.

El atributo **Tipo de Variación** permite determinar si un movimiento incrementa o disminuye las existencias sin depender de reglas implícitas o interpretaciones del nombre del movimiento.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre el nombre del tipo de movimiento.
* Restricción de dominio para el atributo **Tipo de Variación**.
* Tipos de datos apropiados para los atributos descriptivos.
* Restricciones para el atributo **Activo**.
* Índices para optimizar las búsquedas y las relaciones con la entidad **Movimiento de Stock**.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
