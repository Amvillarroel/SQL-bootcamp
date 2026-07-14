# 03. Entidad lógica — Categoría

---

# Objetivo

La entidad **Categoría** representa un criterio de clasificación utilizado para organizar los productos comercializados por TechStore S.A.

Su finalidad es almacenar exclusivamente la información necesaria para clasificar los productos dentro del catálogo de la empresa, facilitando la organización, la búsqueda y la elaboración de reportes.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                                         | Tipo   | Obligatorio |
| ------------- | ------------------------------------------------------------------- | ------ | ----------- |
| Identificador | Identificador interno de la categoría.                              | Simple | Sí          |
| Nombre        | Nombre utilizado para identificar la categoría.                     | Simple | Sí          |
| Descripcion   | Descripción funcional de la categoría.                              | Simple | No          |
| Estado        | Indica si la categoría se encuentra disponible para su utilización. | Simple | Sí          |

---

# Análisis de diseño

## Identificador

Cada categoría dispondrá de un identificador interno generado por el sistema.

Este atributo permitirá establecer relaciones estables con la entidad **Producto**, independientemente de modificaciones en su nombre.

---

## Nombre

Representa la denominación utilizada para identificar la categoría dentro del catálogo de productos.

Debe ser claro, representativo y suficientemente descriptivo para facilitar la clasificación de los artículos.

---

## Descripción

Permite ampliar el significado o alcance de la categoría.

Su utilización es opcional y está orientada principalmente a facilitar la administración del catálogo.

---

## Estado

Permite mantener categorías históricas sin necesidad de eliminarlas físicamente.

Cuando una categoría deja de utilizarse podrá marcarse como inactiva, preservando la integridad de los productos que continúan referenciándola en operaciones históricas.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Cantidad de productos asociados.
* Total de ventas de la categoría.
* Stock total de la categoría.
* Facturación acumulada.
* Rentabilidad.
* Fecha de la última venta.

---

## Justificación

Todos estos valores representan información derivada de procesos transaccionales o de consultas analíticas.

Su almacenamiento dentro de la entidad **Categoría** introduciría redundancia y obligaría a mantener información sincronizada con múltiples operaciones del sistema.

Estos indicadores podrán obtenerse mediante consultas SQL sobre las entidades correspondientes.

---

# Consideraciones de normalización

La entidad **Categoría** cumple el principio de responsabilidad única al almacenar únicamente información descriptiva relacionada con la clasificación de productos.

No contiene información comercial, financiera ni de inventario.

La relación con los productos se materializa desde la entidad **Producto**, evitando duplicación de datos y manteniendo un modelo consistente.

Al tratarse de una entidad de catálogo, se espera que presente una baja frecuencia de modificaciones y una alta frecuencia de consultas por parte del resto del sistema.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria de la entidad.
* Restricción de unicidad del nombre de la categoría.
* Dominio permitido para el estado.
* Tipos de datos de cada atributo.
* Índices para optimizar búsquedas por nombre.
* Reglas de integridad referencial con la entidad **Producto**.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
