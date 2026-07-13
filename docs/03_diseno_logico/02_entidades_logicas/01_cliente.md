# 01. Entidad lógica — Cliente

---

# Objetivo

La entidad **Cliente** representa a toda persona física o jurídica habilitada para realizar operaciones comerciales con TechStore S.A.

Su finalidad es almacenar exclusivamente la información propia del cliente, independientemente de las compras realizadas o de cualquier otro proceso transaccional.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo          | Descripción                                                              | Clasificación | Obligatorio |
| ----------------- | ------------------------------------------------------------------------ | ------------- | ----------- |
| Identificador     | Identificador interno del cliente.                                       | Simple        | Sí          |
| TipoCliente       | Indica si el cliente es una persona física o una persona jurídica.       | Simple        | Sí          |
| Nombre            | Nombre del cliente cuando se trata de una persona física.                | Simple        | Condicional |
| Apellido          | Apellido del cliente cuando se trata de una persona física.              | Simple        | Condicional |
| RazonSocial       | Denominación comercial cuando se trata de una persona jurídica.          | Simple        | Condicional |
| DocumentoFiscal   | Documento de identificación fiscal (DNI, CUIT u otro según corresponda). | Simple        | Sí          |
| CorreoElectronico | Dirección de correo electrónico de contacto.                             | Simple        | No          |
| Telefono          | Número telefónico principal.                                             | Simple        | No          |
| Direccion         | Domicilio principal del cliente.                                         | Compuesto     | No          |
| Ciudad            | Ciudad correspondiente al domicilio. Referencia a la entidad Ciudad.     | Referencial   | Sí          |
| FechaAlta         | Fecha de incorporación del cliente al sistema.                           | Simple        | Sí          |
| Estado            | Indica si el cliente se encuentra activo o inactivo.                     | Simple        | Sí          |

---

# Análisis de diseño

## Identificador

Todo cliente deberá poseer un identificador interno generado por el sistema.

Este atributo permitirá identificar unívocamente cada registro sin depender de información externa susceptible de cambios.

---

## Tipo de cliente

El atributo **TipoCliente** materializa una de las decisiones adoptadas durante el MER.

Su función es diferenciar personas físicas y personas jurídicas sin necesidad de crear entidades independientes.

---

## Información personal

Los atributos **Nombre** y **Apellido** únicamente tendrán significado cuando el cliente represente a una persona física.

Por este motivo se consideran atributos condicionales.

---

## Información empresarial

El atributo **RazonSocial** será utilizado exclusivamente para clientes que representen personas jurídicas.

Al igual que los atributos personales, su obligatoriedad dependerá del valor de **TipoCliente**.

---

## Documento fiscal

Todo cliente deberá poseer un documento que permita su identificación dentro del contexto comercial.

La naturaleza exacta del documento dependerá de las reglas de negocio y será validada mediante restricciones en etapas posteriores.

---

## Información de contacto

Los datos de contacto no son indispensables para identificar al cliente, pero sí resultan útiles para la operación diaria.

Por esta razón se consideran atributos opcionales.

---

## Dirección

Conceptualmente, una dirección está compuesta por varios elementos (calle, número, código postal, etc.).

En el modelo lógico se identifica como un atributo compuesto, cuya descomposición será analizada durante el diseño físico.

La ciudad no se almacena como texto libre, sino como una referencia a la entidad **Ciudad**, garantizando la reutilización y consistencia de la información geográfica.

---

## Fecha de alta

Permite conocer el momento en que el cliente comenzó a operar con la empresa.

Se trata de un dato histórico propio de la entidad y no deriva de ningún proceso transaccional.

---

## Estado

El estado refleja la disponibilidad operativa del cliente dentro del sistema.

Su existencia evita eliminar registros históricos cuando un cliente deja de operar comercialmente.

---

# Atributos descartados

Durante el diseño se decidió no incorporar los siguientes atributos por tratarse de información derivada de otros procesos del negocio:

* Cantidad de compras realizadas.
* Importe total facturado.
* Saldo de cuenta corriente.
* Fecha de la última compra.
* Ticket promedio.
* Cantidad de productos adquiridos.

Toda esta información podrá obtenerse mediante consultas sobre las entidades transaccionales, evitando redundancias y preservando la normalización del modelo.

---

# Consideraciones de normalización

La entidad mantiene el principio de responsabilidad única al almacenar únicamente información propia del cliente.

No contiene atributos calculados ni información derivada de ventas, compras o movimientos de stock.

La información geográfica se desacopla mediante la referencia a la entidad **Ciudad**, evitando la repetición de datos y favoreciendo la consistencia del modelo.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria de la entidad.
* Restricciones de unicidad para el documento fiscal.
* Restricciones asociadas al tipo de cliente.
* Reglas de obligatoriedad condicional entre **TipoCliente**, **Nombre**, **Apellido** y **RazonSocial**.
* Tipos de datos apropiados para cada atributo.
* Restricciones de validación para el estado del cliente.
* Índices que optimicen las búsquedas por documento fiscal y nombre.

Estas decisiones serán desarrolladas en los documentos correspondientes a claves, restricciones y modelo físico.
