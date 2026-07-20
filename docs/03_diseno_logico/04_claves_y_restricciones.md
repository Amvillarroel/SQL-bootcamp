# 4. Claves y Restricciones

---

# Objetivo

Una vez finalizado el diseño lógico del modelo de datos, resulta necesario definir las reglas que garantizarán la integridad y consistencia de la información almacenada.

Las claves y restricciones constituyen el mecanismo mediante el cual el sistema asegura que los datos respeten las reglas del negocio y las relaciones establecidas durante el diseño del Modelo Entidad-Relación (MER).

El presente documento establece los criterios generales que serán aplicados posteriormente durante la implementación física de la base de datos.

---

# Claves Primarias (Primary Key)

## Concepto

Una clave primaria es un atributo (o conjunto de atributos) que identifica de forma única cada registro de una entidad.

No puede contener valores nulos ni registros duplicados.

Durante este proyecto todas las entidades utilizarán un identificador interno como clave primaria.

---

## Criterios adoptados

Se decidió utilizar claves sustitutas (Surrogate Keys) en lugar de claves naturales.

Por ejemplo:

* ClienteID
* ProductoID
* CompraID
* VentaID

En lugar de utilizar información propia del negocio, como un DNI, un CUIT o un código comercial.

---

## Justificación

Las claves naturales pueden cambiar con el tiempo debido a modificaciones normativas o decisiones del negocio.

En cambio, un identificador interno permanece estable durante toda la vida útil del registro.

Esta decisión simplifica las relaciones entre entidades y reduce el impacto de futuros cambios en los datos maestros.

---

# Claves Foráneas (Foreign Key)

## Concepto

Una clave foránea es un atributo cuyo valor corresponde a la clave primaria de otra entidad.

Su función es establecer relaciones entre tablas y garantizar la integridad referencial del modelo.

---

## Aplicación en el proyecto

Algunos ejemplos son:

* Venta referencia a Cliente.
* Compra referencia a Proveedor.
* Producto referencia a Categoría.
* Producto referencia a Marca.
* Producto referencia a Alícuota IVA.
* Movimiento de Stock referencia a Tipo de Movimiento de Stock.
* Detalle de Venta referencia a Venta y Producto.
* Detalle de Compra referencia a Compra y Producto.

Estas relaciones impedirán registrar información asociada a entidades inexistentes.

---

# Restricciones de unicidad (UNIQUE)

## Concepto

Existen atributos que, sin ser claves primarias, deben contener valores únicos dentro del sistema.

Estas restricciones evitan la duplicación de información y preservan la coherencia del modelo.

---

## Ejemplos

Podrán definirse restricciones de unicidad sobre atributos como:

* CUIT del cliente.
* Código interno del producto.
* Nombre de la categoría.
* Nombre de la marca.
* Nombre de la forma de pago.
* Nombre del tipo de movimiento de stock.
* Nombre de la alícuota IVA.

La necesidad de cada restricción será evaluada durante la implementación física del modelo.

---

# Restricciones de obligatoriedad (NOT NULL)

## Concepto

Algunos atributos son indispensables para representar correctamente una entidad.

En esos casos se establecerá una restricción que impida almacenar valores nulos.

---

## Ejemplos

Serán obligatorios, entre otros:

* Nombre del cliente.
* Nombre del producto.
* Fecha de la venta.
* Fecha de la compra.
* Cantidad vendida.
* Cantidad comprada.

En cambio, atributos como observaciones o descripciones podrán admitir valores nulos cuando así lo permita el negocio.

---

# Restricciones de dominio (CHECK)

## Concepto

Las restricciones de dominio limitan los valores que puede tomar un atributo.

De esta forma se evita registrar información inconsistente.

---

## Ejemplos

Podrán establecerse restricciones como:

* Cantidades mayores que cero.
* Precios mayores o iguales a cero.
* Porcentajes de IVA válidos.
* Estados activos expresados mediante valores permitidos.
* Tipo de variación limitado a "Entrada" o "Salida".

Estas reglas complementan las validaciones implementadas por la aplicación.

---

# Integridad referencial

La integridad referencial garantiza que todas las relaciones definidas entre entidades permanezcan consistentes.

Por ejemplo:

No será posible registrar un detalle de venta asociado a una venta inexistente.

Tampoco podrá registrarse un producto perteneciente a una categoría que no exista.

Estas restricciones serán implementadas mediante claves foráneas y políticas de actualización y eliminación apropiadas.

---

# Restricciones derivadas del negocio

Además de las restricciones propias del modelo relacional, el sistema deberá respetar reglas específicas del dominio de negocio.

Entre ellas:

* Un producto deberá pertenecer a una única categoría.
* Cada producto tendrá asociada una única marca.
* Cada producto tendrá asociada una única alícuota de IVA.
* Una venta deberá poseer al menos un detalle.
* Una compra deberá poseer al menos un detalle.
* Un movimiento de stock deberá estar asociado a un tipo de movimiento válido.

Algunas de estas reglas podrán implementarse directamente en la base de datos y otras mediante la lógica de la aplicación.

---

# Relación con las siguientes etapas

Las decisiones documentadas en este capítulo constituyen la base para la implementación física de la base de datos.

Durante los scripts SQL del proyecto se definirán:

* PRIMARY KEY.
* FOREIGN KEY.
* UNIQUE.
* NOT NULL.
* CHECK.
* Índices.

Asimismo, las restricciones de integridad serán complementadas mediante reglas implementadas en la lógica de negocio de la aplicación cuando resulte necesario.

---

# Conclusiones

Las claves y restricciones representan el mecanismo principal para garantizar la calidad de los datos almacenados.

Mientras el diseño lógico define qué información debe representar cada entidad, las restricciones aseguran que dicha información permanezca consistente a lo largo del tiempo.

Por este motivo, la implementación física de la base de datos no consiste únicamente en crear tablas, sino también en traducir las reglas del negocio en mecanismos que impidan el ingreso de información inválida o inconsistente.
