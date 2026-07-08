# 3. Decisiones de Arquitectura del MER

---

## 3.1 ENT-001 — Cliente

### Descripción

La entidad **Cliente** representa a toda persona física o jurídica habilitada para realizar compras en TechStore S.A.

Su finalidad es almacenar exclusivamente información propia del cliente, independientemente de las operaciones comerciales que realice.

Esta entidad constituye uno de los pilares del modelo de datos y será utilizada por los procesos de venta y análisis comercial.

---

### MER-001 — Modelado de la entidad Cliente

#### Contexto

Durante el análisis funcional se definió que TechStore S.A. comercializa productos tanto a consumidores finales (B2C) como a empresas (B2B).

Era necesario decidir si ambos tipos de clientes serían representados mediante entidades independientes o mediante una única entidad.

#### Alternativas consideradas

**Alternativa A**

Utilizar dos entidades independientes:

* Persona
* Empresa

**Alternativa B**

Utilizar una única entidad denominada **Cliente**, diferenciando ambos casos mediante un atributo de clasificación.

#### Decisión

Se implementará una única entidad **Cliente**.

La diferenciación entre personas físicas y personas jurídicas se realizará mediante un atributo denominado **TipoCliente**.

#### Justificación

Ambos tipos participan de los mismos procesos de negocio y comparten la mayor parte de sus atributos.

Mantener una única entidad simplifica el modelo, reduce la complejidad inicial y favorece el aprendizaje progresivo sin afectar el realismo del sistema.

#### Consecuencias

* Se simplifican las consultas SQL.
* Se reduce la cantidad de relaciones del modelo.
* El diseño podrá evolucionar hacia un modelo especializado si futuros requerimientos del negocio así lo justifican.

---

### MER-002 — Responsabilidad de la entidad Cliente

#### Contexto

Durante el modelado se identificó la necesidad de definir claramente el alcance funcional de la entidad.

#### Decisión

La entidad **Cliente** almacenará únicamente información propia del cliente.

No almacenará información derivada de procesos comerciales ni indicadores calculados.

#### Justificación

Cada entidad debe representar un único concepto del negocio.

Información como:

* Cantidad de compras
* Total facturado
* Última compra
* Deuda acumulada
* Ticket promedio

corresponde a información derivada de las transacciones y podrá obtenerse mediante consultas SQL.

#### Consecuencias

* Se evita duplicar información.
* Se preserva la consistencia del modelo.
* Se facilita el cumplimiento de las reglas de normalización.

---

### MER-003 — Identificación de la entidad Cliente

#### Contexto

Los documentos de identificación (DNI, CUIT u otros identificadores fiscales) forman parte de las reglas del negocio y pueden variar según el tipo de cliente.

#### Decisión

La entidad utilizará un identificador interno como clave primaria.

Los documentos fiscales se almacenarán como atributos independientes sujetos a las reglas de negocio correspondientes.

#### Justificación

Las claves primarias deben ser estables y no depender de información externa susceptible de cambios.

Esta estrategia facilita las relaciones con otras entidades y desacopla el diseño lógico de posibles modificaciones normativas.

#### Consecuencias

* Mayor estabilidad del modelo.
* Relaciones más simples entre entidades.
* Independencia respecto de cambios en la identificación fiscal de los clientes.

---

## 3.2 ENT-002 — Producto

### Descripción

La entidad **Producto** representa cada artículo comercializado por TechStore S.A.

Su finalidad es almacenar la información propia de los productos ofrecidos por la empresa, independientemente de las operaciones de compra, venta o movimientos de inventario en las que participen.

La entidad constituye uno de los elementos centrales del modelo de datos y será utilizada por múltiples procesos del negocio.

---

### MER-004 — Alcance de la entidad Producto

#### Contexto

Durante el diseño del modelo fue necesario establecer con precisión qué concepto del negocio representa la entidad Producto.

#### Decisión

La entidad **Producto** representará exclusivamente al artículo comercial que la empresa comercializa.

No representará existencias, precios, compras, ventas ni otra información derivada de procesos operativos.

#### Justificación

Cada entidad debe representar un único concepto del negocio.

Separar el concepto de producto de los procesos en los que participa favorece la normalización del modelo y reduce el acoplamiento entre entidades.

#### Consecuencias

* La entidad podrá ser utilizada por múltiples procesos.
* Se evita mezclar información permanente con información transaccional.
* El modelo será más flexible ante futuras ampliaciones.

---

### MER-005 — Responsabilidad de la entidad Producto

#### Contexto

Se identificó la necesidad de delimitar qué tipo de información pertenece naturalmente al producto y cuál corresponde a otras entidades del sistema.

#### Decisión

La entidad **Producto** almacenará únicamente información descriptiva del artículo comercial.

Información como existencias, precios históricos, compras, ventas o movimientos de inventario será administrada por las entidades correspondientes.

#### Justificación

El producto describe un bien comercial.

Las operaciones realizadas sobre dicho producto constituyen hechos del negocio y deben representarse mediante entidades transaccionales independientes.

#### Consecuencias

* Se preserva la responsabilidad única de la entidad.
* Se facilita la reutilización del producto en distintos procesos.
* Se reduce la duplicación de información.

---

### Cuestiones pendientes

Durante el análisis de las entidades relacionadas deberán resolverse las siguientes cuestiones de arquitectura:

* Definir la relación entre **Producto** y **Proveedor**.
* Definir la estrategia para la administración de los precios de compra y venta.

---

### Estado de la entidad

**Estado:** En análisis.

**Decisiones aprobadas:**

* MER-004
* MER-005

**Cuestiones pendientes:**

* Relación entre Producto y Proveedor.
* Estrategia de administración de precios.

---

## 3.3 ENT-003 — Categoría

### Descripción

La entidad **Categoría** representa un criterio de clasificación utilizado para organizar los productos comercializados por TechStore S.A.

Su finalidad es facilitar la organización del catálogo, la navegación de productos, la elaboración de reportes y el análisis comercial.

Las categorías constituyen información de referencia relativamente estable y forman parte de las entidades de catálogo del modelo.

---

### MER-006 — Relación entre Producto y Categoría

#### Contexto

Durante el análisis del modelo fue necesario definir si un producto podrá pertenecer simultáneamente a múltiples categorías o si cada producto estará asociado a una única categoría.

#### Decisión

Cada **Producto** pertenecerá a una única **Categoría**.

Una categoría podrá contener múltiples productos.

#### Justificación

El modelo busca representar el comportamiento habitual de un ERP comercial, donde cada producto se clasifica dentro de una categoría principal.

Esta decisión simplifica el diseño del modelo, reduce la complejidad de las consultas SQL y facilita la generación de reportes.

Si en futuras versiones del sistema fuera necesario permitir múltiples categorías por producto, el modelo podrá evolucionar incorporando una entidad asociativa específica.

#### Consecuencias

* Relación uno a muchos entre Categoría y Producto.
* Simplificación de consultas y reportes.
* Modelo fácilmente extensible.

---

### MER-007 — Independencia de la entidad Categoría

#### Contexto

Se analizó si las categorías debían existir únicamente cuando tuvieran productos asociados o si debían administrarse como información independiente.

#### Decisión

Las categorías existirán independientemente de los productos.

Podrán crearse, modificarse o mantenerse sin necesidad de tener productos asociados.

#### Justificación

Las categorías representan información organizativa del negocio y no dependen de la existencia inmediata de productos.

Esta independencia permite preparar la estructura del catálogo antes de incorporar nuevos artículos.

#### Consecuencias

* Mayor flexibilidad administrativa.
* Mejor separación entre datos maestros y datos operativos.
* Facilita la planificación del catálogo de productos.

---

### MER-008 — Responsabilidad de la entidad Categoría

#### Contexto

Fue necesario definir el alcance funcional de la entidad.

#### Decisión

La entidad **Categoría** almacenará únicamente información descriptiva relacionada con la clasificación de productos.

No contendrá información comercial, inventarios, precios ni estadísticas.

#### Justificación

Las entidades de catálogo deben representar únicamente criterios de clasificación reutilizables por el resto del sistema.

#### Consecuencias

* Se mantiene el principio de responsabilidad única.
* Se evita incorporar información derivada.
* Se facilita la reutilización de la entidad.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-006
* MER-007
* MER-008

---

## 3.4 ENT-004 — Proveedor

### Descripción

La entidad **Proveedor** representa a toda organización habilitada para suministrar productos a TechStore S.A.

Su finalidad es almacenar exclusivamente la información propia de los proveedores con los que la empresa mantiene relaciones comerciales para el abastecimiento de mercaderías.

Esta entidad constituye uno de los datos maestros del sistema y será utilizada por los procesos de compras y abastecimiento.

---

### MER-009 — Relación entre Producto y Proveedor

#### Contexto

Durante el diseño del modelo fue necesario definir si cada producto podría ser suministrado por un único proveedor o por múltiples proveedores.

#### Alternativas consideradas

**Alternativa A**

Establecer una relación uno a muchos entre **Proveedor** y **Producto**, donde cada producto tenga un único proveedor.

**Alternativa B**

Establecer una relación muchos a muchos entre **Producto** y **Proveedor**, resolviéndola mediante una entidad asociativa.

#### Decisión

Se adoptará la **Alternativa B**.

Un mismo producto podrá ser suministrado por múltiples proveedores y un mismo proveedor podrá suministrar múltiples productos.

La relación será materializada mediante una entidad asociativa denominada **ProductoProveedor**, que será incorporada durante el diseño detallado del MER.

#### Justificación

Este enfoque representa con mayor fidelidad el funcionamiento de un ERP comercial, permitiendo modelar distintos costos de compra, plazos de entrega, códigos de proveedor y demás características propias de la relación comercial.

Además, respeta el principio de normalización al convertir una relación muchos a muchos en una entidad independiente.

#### Consecuencias

* El modelo será más flexible y escalable.
* Se incorpora una nueva entidad asociativa al diseño lógico.
* La relación entre Producto y Proveedor quedará completamente normalizada.

---

### MER-010 — Alcance de la entidad Proveedor

#### Contexto

Fue necesario definir con precisión el concepto representado por la entidad.

#### Decisión

La entidad **Proveedor** representará exclusivamente a las organizaciones que suministran productos a TechStore S.A.

No representará fabricantes, transportistas, clientes ni otros actores del negocio.

#### Justificación

Cada entidad debe representar un único concepto del dominio.

Mantener esta separación facilita el mantenimiento del modelo y evita ambigüedades en las relaciones.

#### Consecuencias

* Se preserva el principio de responsabilidad única.
* El modelo resulta más claro y extensible.

---

### MER-011 — Responsabilidad de la entidad Proveedor

#### Contexto

Se definió el alcance de la información que será administrada por la entidad.

#### Decisión

La entidad **Proveedor** almacenará únicamente información descriptiva e identificatoria del proveedor.

Información como compras realizadas, importes, productos adquiridos o estadísticas comerciales será administrada por las entidades transaccionales correspondientes.

#### Justificación

La información transaccional debe permanecer separada de los datos maestros para garantizar la consistencia del modelo y facilitar su evolución.

#### Consecuencias

* Se evita la duplicación de información.
* Se mantiene la cohesión de la entidad.
* Se favorece la normalización del modelo.

---

### Observación de arquitectura

Como consecuencia de la decisión **MER-009**, durante el desarrollo del Modelo Entidad-Relación se incorporará una nueva entidad denominada **ProductoProveedor**.

Esta entidad no forma parte del análisis funcional original, sino que surge durante el diseño lógico como resultado de la resolución de una relación de muchos a muchos.

Su incorporación constituye una evolución natural del modelo y no representa una modificación del dominio del negocio.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-009
* MER-010
* MER-011

---

## 3.5 ENT-005 — Compra

### Descripción

La entidad **Compra** representa el documento comercial mediante el cual TechStore S.A. registra la adquisición de productos a un proveedor.

Su finalidad es almacenar la información general del documento de compra, independientemente del detalle de los productos incluidos en la operación.

Esta entidad constituye una de las principales entidades transaccionales del sistema y será utilizada para registrar el abastecimiento de mercaderías.

---

### MER-012 — Modelo Cabecera–Detalle para las compras

#### Contexto

Durante el diseño del modelo fue necesario definir cómo representar una compra que puede incluir múltiples productos.

#### Decisión

La entidad **Compra** representará únicamente la cabecera del documento comercial.

Los productos adquiridos, sus cantidades, precios y subtotales serán administrados mediante la entidad **Detalle de Compra**.

#### Justificación

Una compra constituye un documento que puede contener múltiples líneas de detalle.

Separar la cabecera del detalle evita la duplicación de información y permite representar correctamente la relación entre el documento y los productos adquiridos.

#### Consecuencias

* Se adopta el patrón Cabecera–Detalle.
* Cada compra podrá contener uno o varios productos.
* Se preserva la normalización del modelo.

---

### MER-013 — Alcance de la entidad Compra

#### Contexto

Fue necesario establecer qué tipo de documento representará la entidad dentro del modelo.

#### Decisión

La entidad **Compra** representará el documento mediante el cual la empresa registra el ingreso de mercaderías provenientes de un proveedor.

No modelará órdenes de compra, remitos u otros documentos del proceso de abastecimiento.

#### Justificación

El objetivo del Bootcamp es construir un modelo didáctico, manteniendo un equilibrio entre realismo y complejidad.

Esta decisión permite simplificar el proceso de compras sin perder consistencia conceptual.

#### Consecuencias

* El modelo resulta más sencillo de comprender.
* Se reduce la cantidad de entidades transaccionales.
* El diseño podrá evolucionar en futuras versiones si se requiere un flujo documental más completo.

---

### MER-014 — Responsabilidad de la entidad Compra

#### Contexto

Se definió el alcance funcional de la información que almacenará la entidad.

#### Decisión

La entidad **Compra** almacenará únicamente la información general del documento comercial.

La información correspondiente a los productos adquiridos será administrada por la entidad **Detalle de Compra**.

#### Justificación

Cada entidad debe representar un único concepto del negocio.

La separación entre cabecera y detalle facilita el mantenimiento del modelo y evita redundancias.

#### Consecuencias

* Se mantiene la responsabilidad única de la entidad.
* Se facilita la integridad de la información.
* El modelo queda preparado para representar documentos con cualquier cantidad de líneas de detalle.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-012
* MER-013
* MER-014

---

## 3.6 ENT-006 — Venta

### Descripción

La entidad **Venta** representa el documento comercial mediante el cual TechStore S.A. registra la comercialización de productos a un cliente.

Su finalidad es almacenar la información general de la operación de venta, independientemente del detalle de los productos incluidos en la transacción.

Esta entidad constituye una de las principales entidades transaccionales del sistema y será utilizada para registrar las operaciones comerciales realizadas por la empresa.

---

### MER-015 — Modelo Cabecera–Detalle para las ventas

#### Contexto

Durante el diseño del modelo fue necesario definir cómo representar una venta que puede incluir múltiples productos.

#### Decisión

La entidad **Venta** representará únicamente la cabecera del documento comercial.

Los productos vendidos, sus cantidades, precios unitarios y subtotales serán administrados mediante la entidad **Detalle de Venta**.

#### Justificación

Una venta constituye un documento que puede contener múltiples líneas de detalle.

Separar la cabecera del detalle evita redundancias, facilita la normalización y permite representar correctamente cualquier cantidad de productos dentro de una misma operación.

#### Consecuencias

* Se adopta el patrón Cabecera–Detalle.
* Cada venta podrá contener uno o varios productos.
* Se preserva la integridad y consistencia del modelo.

---

### MER-016 — Alcance de la entidad Venta

#### Contexto

Fue necesario establecer qué tipo de documento representará la entidad dentro del modelo.

#### Decisión

La entidad **Venta** representará el documento mediante el cual la empresa registra la salida de mercaderías hacia un cliente.

No modelará presupuestos, pedidos, remitos, notas de crédito u otros documentos comerciales.

#### Justificación

El objetivo del Bootcamp es desarrollar un modelo didáctico que represente las operaciones esenciales del negocio sin incorporar procesos que excedan el alcance definido.

Esta decisión mantiene un equilibrio entre simplicidad y realismo.

#### Consecuencias

* El modelo resulta más sencillo de comprender.
* Se limita el alcance funcional de la entidad.
* Se facilita una futura ampliación del sistema si el negocio lo requiere.

---

### MER-017 — Responsabilidad de la entidad Venta

#### Contexto

Se definió el alcance funcional de la información administrada por la entidad.

#### Decisión

La entidad **Venta** almacenará únicamente la información general del documento comercial.

La información correspondiente a los productos vendidos será administrada por la entidad **Detalle de Venta**.

#### Justificación

Cada entidad debe representar un único concepto del negocio.

La separación entre cabecera y detalle evita duplicar información y facilita el mantenimiento del modelo.

#### Consecuencias

* Se preserva la responsabilidad única de la entidad.
* Se mejora la organización de la información.
* El modelo queda preparado para representar ventas con cualquier cantidad de líneas de detalle.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-015
* MER-016
* MER-017
