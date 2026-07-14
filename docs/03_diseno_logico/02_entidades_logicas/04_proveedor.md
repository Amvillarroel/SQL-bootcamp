# 04. Entidad lógica — Proveedor

---

# Objetivo

La entidad **Proveedor** representa a toda persona física o jurídica que suministra productos a TechStore S.A.

Su finalidad es almacenar exclusivamente la información propia de los proveedores, independientemente de las compras realizadas o de los productos que suministren.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo          | Descripción                                                                | Tipo        | Obligatorio |
| ----------------- | -------------------------------------------------------------------------- | ----------- | ----------- |
| Identificador     | Identificador interno del proveedor.                                       | Simple      | Sí          |
| RazonSocial       | Denominación comercial del proveedor.                                      | Simple      | Sí          |
| DocumentoFiscal   | Documento de identificación fiscal del proveedor.                          | Simple      | Sí          |
| CorreoElectronico | Dirección de correo electrónico principal.                                 | Simple      | No          |
| Telefono          | Número telefónico principal.                                               | Simple      | No          |
| Direccion         | Domicilio principal del proveedor.                                         | Compuesto   | No          |
| Ciudad            | Ciudad correspondiente al domicilio. Referencia a la entidad Ciudad.       | Referencial | Sí          |
| ContactoPrincipal | Nombre de la persona de contacto habitual.                                 | Simple      | No          |
| Estado            | Indica si el proveedor se encuentra habilitado para operar con la empresa. | Simple      | Sí          |
| FechaAlta         | Fecha de incorporación del proveedor al sistema.                           | Simple      | Sí          |

---

# Análisis de diseño

## Identificador

Cada proveedor dispondrá de un identificador interno generado por el sistema.

Este identificador permitirá establecer relaciones con otras entidades sin depender de información comercial o fiscal susceptible de modificaciones.

---

## Razón social

Representa la denominación comercial utilizada para identificar al proveedor.

Constituye uno de los principales atributos descriptivos de la entidad.

---

## Documento fiscal

Permite identificar al proveedor dentro del marco legal y tributario correspondiente.

Su obligatoriedad responde a las necesidades administrativas y fiscales del negocio.

---

## Información de contacto

Los atributos **CorreoElectronico**, **Telefono** y **ContactoPrincipal** facilitan la comunicación operativa con el proveedor.

Aunque son altamente recomendables, no resultan indispensables para la existencia lógica del registro.

---

## Dirección

La dirección representa el domicilio principal del proveedor.

Conceptualmente constituye un atributo compuesto cuya descomposición será analizada en etapas posteriores del diseño.

La ciudad se representa mediante una referencia lógica a la entidad **Ciudad**, promoviendo la reutilización de información geográfica.

---

## Estado

Permite conservar el historial de proveedores aun cuando hayan dejado de operar con la empresa.

La inactivación evita eliminar registros históricos asociados a compras anteriores.

---

## Fecha de alta

Registra el momento en que el proveedor fue incorporado al sistema.

Se trata de un atributo histórico propio de la entidad.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Cantidad de compras realizadas.
* Importe total comprado.
* Última compra.
* Cantidad de productos suministrados.
* Precio promedio de compra.
* Tiempo promedio de entrega.
* Calificación del proveedor basada en operaciones.

---

## Justificación

Todos estos valores representan información derivada de compras, relaciones comerciales o análisis estadísticos.

Su almacenamiento dentro de **Proveedor** produciría redundancia y generaría dependencias innecesarias con entidades transaccionales.

La relación entre productos y proveedores será administrada mediante la entidad asociativa **ProductoProveedor**, mientras que la información histórica se obtendrá a partir de las compras registradas en el sistema.

---

# Consideraciones de normalización

La entidad **Proveedor** cumple el principio de responsabilidad única al almacenar únicamente información propia del proveedor.

No contiene información relativa a productos específicos, compras, precios ni indicadores derivados.

Las relaciones comerciales se representan mediante entidades independientes, preservando la normalización y facilitando la evolución del modelo.

La información geográfica se desacopla mediante la referencia a la entidad **Ciudad**, evitando duplicidad de datos.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria de la entidad.
* Restricción de unicidad del documento fiscal.
* Restricción de unicidad de la razón social (si las reglas del negocio así lo requieren).
* Dominio permitido para el estado del proveedor.
* Tipos de datos apropiados para cada atributo.
* Índices para optimizar búsquedas por documento fiscal y razón social.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
