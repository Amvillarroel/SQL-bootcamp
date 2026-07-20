# 3. Normalización del Modelo de Datos

---

# Objetivo

El objetivo de la normalización es organizar la información del modelo de datos de forma que se reduzca la redundancia, se preserve la integridad de los datos y se facilite la evolución del sistema.

Durante el desarrollo de este Bootcamp, la normalización no fue tratada como una etapa aislada, sino como un criterio presente desde el momento en que comenzaron a modelarse las entidades y sus relaciones.

El presente documento formaliza las decisiones adoptadas durante el análisis funcional, el diseño del MER y el diseño lógico, explicando cómo dichas decisiones contribuyen al cumplimiento de las primeras formas normales.

---

# ¿Qué es la normalización?

La normalización es un proceso de diseño cuyo propósito consiste en estructurar una base de datos de manera que cada dato se almacene una única vez, evitando redundancias innecesarias y reduciendo la posibilidad de inconsistencias.

Un modelo correctamente normalizado ofrece múltiples beneficios:

* Reduce la duplicación de información.
* Facilita el mantenimiento de los datos.
* Evita anomalías durante las operaciones de inserción, modificación y eliminación.
* Favorece la integridad referencial.
* Permite que el modelo evolucione con mayor facilidad frente a nuevos requerimientos del negocio.

Durante este proyecto, la normalización fue aplicada de forma progresiva mediante decisiones de arquitectura que luego quedaron reflejadas tanto en el MER como en el diseño lógico.

---

# Primera Forma Normal (1FN)

## Concepto

La Primera Forma Normal establece que cada atributo debe contener un único valor y que cada registro debe representar una única ocurrencia de una entidad.

No deben existir grupos repetitivos ni listas de valores almacenadas dentro de un mismo atributo.

---

## Aplicación en el proyecto

Desde el inicio del diseño se evitó almacenar múltiples valores dentro de un mismo campo.

Por ejemplo, nunca se planteó una estructura como la siguiente:

```text
Producto

Proveedor = "HP, Lenovo, Dell"
```

En su lugar, se decidió representar la relación entre productos y proveedores mediante la entidad asociativa **ProductoProveedor**, permitiendo que cada registro represente una única relación comercial.

Del mismo modo, tampoco se consideró almacenar varias categorías dentro de un mismo atributo:

```text
Producto

Categorías = "Hardware, Notebooks, Gaming"
```

Cada producto pertenece a una única categoría, estableciendo una relación entre las entidades **Producto** y **Categoría**.

---

## Beneficios obtenidos

* Todos los atributos contienen valores atómicos.
* No existen listas dentro de un mismo campo.
* Cada entidad representa un único concepto del negocio.
* El modelo resulta más sencillo de consultar mediante SQL.

---

# Segunda Forma Normal (2FN)

## Concepto

La Segunda Forma Normal establece que todos los atributos de una entidad deben depender completamente de su clave primaria.

No deben existir atributos que dependan únicamente de una parte de la clave o que correspondan conceptualmente a otra entidad.

---

## Aplicación en el proyecto

Durante el modelado se decidió separar claramente las operaciones comerciales de los datos maestros.

Por ejemplo, la entidad **Venta** representa la operación comercial, mientras que los productos vendidos se almacenan en **Detalle de Venta**.

Una estructura como la siguiente fue descartada:

```text
Venta

Producto1
Cantidad1

Producto2
Cantidad2

Producto3
Cantidad3
```

En su lugar, se creó una entidad independiente para registrar cada producto incluido en la venta.

El mismo criterio se aplicó al proceso de compras mediante la entidad **Detalle de Compra**.

---

## Beneficios obtenidos

* Cada registro representa un único hecho del negocio.
* Se elimina la duplicación de columnas.
* El modelo admite cualquier cantidad de productos por operación.
* Las consultas resultan más flexibles y escalables.

---

# Tercera Forma Normal (3FN)

## Concepto

La Tercera Forma Normal establece que los atributos deben depender únicamente de la clave primaria y no de otros atributos de la misma entidad.

Cuando un conjunto de datos representa un concepto independiente del negocio, debe modelarse mediante una entidad propia.

---

## Aplicación en el proyecto

A lo largo del diseño surgieron varias decisiones que fortalecieron el cumplimiento de esta forma normal.

En lugar de almacenar información descriptiva repetida dentro de otras entidades, se crearon catálogos específicos.

Algunos ejemplos son:

* **Marca**
* **Categoría**
* **Forma de Pago**
* **Tipo de Movimiento de Stock**
* **Alícuota IVA**

Gracias a estas decisiones, entidades como **Producto**, **Venta** y **Movimiento de Stock** almacenan únicamente referencias hacia dichos catálogos.

Por ejemplo, en lugar de guardar repetidamente:

```text
Producto

Marca = Samsung
IVA = 21 %
Categoría = Monitores
```

el modelo establece relaciones con las entidades correspondientes.

Esto evita inconsistencias y facilita el mantenimiento de la información.

---

## Beneficios obtenidos

* Se elimina información redundante.
* Se facilita la actualización de datos maestros.
* Se reduce el riesgo de inconsistencias.
* El modelo resulta más flexible frente a futuros cambios del negocio.

---

# Decisiones de diseño que favorecen la normalización

Durante el desarrollo del modelo se adoptaron diversas decisiones que fortalecen la calidad del diseño.

Entre las más relevantes se encuentran:

* Separación entre entidades maestras, transaccionales y de catálogo.
* Incorporación de la entidad asociativa **ProductoProveedor** para resolver una relación muchos a muchos.
* Separación entre **Compra** y **Detalle de Compra**.
* Separación entre **Venta** y **Detalle de Venta**.
* Creación de la entidad **Marca**.
* Creación de la entidad **Alícuota IVA**.
* Creación de la entidad **Tipo de Movimiento de Stock**.
* Utilización de identificadores internos como claves primarias.
* Eliminación de información derivada, como el importe del IVA o el stock calculado.

Cada una de estas decisiones fue documentada previamente en el MER y desarrollada posteriormente durante el diseño lógico.

---

# Errores evitados durante el modelado

Durante el análisis se descartaron diversas estructuras que, aunque pueden parecer simples en una primera aproximación, generan importantes problemas de mantenimiento.

Entre ellas:

Guardar varios proveedores dentro del mismo producto.

```text
Proveedor1
Proveedor2
Proveedor3
```

Guardar múltiples productos dentro de una venta.

```text
Producto1
Cantidad1

Producto2
Cantidad2
```

Almacenar el tipo de movimiento como texto libre.

```text
TipoMovimiento = "Compra"
```

Guardar el porcentaje de IVA repetido en cada operación comercial.

```text
IVA = 21 %
```

Representar estos conceptos mediante entidades independientes reduce la redundancia y mejora la consistencia del modelo.

---

# Conclusiones

El modelo de datos desarrollado durante este Bootcamp cumple los principios fundamentales de las primeras formas normales mediante decisiones de arquitectura tomadas de manera progresiva a lo largo del proyecto.

Más que aplicar reglas de forma mecánica, el proceso consistió en comprender el dominio del negocio y representar cada concepto mediante la entidad que mejor reflejara su responsabilidad.

Este enfoque permitió construir un modelo coherente, escalable y preparado para las siguientes etapas del diseño, donde se definirán las claves, las restricciones de integridad y la implementación física de la base de datos.
