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

---

## 3.7 ENT-007 — Detalle de Venta

### Descripción

La entidad **Detalle de Venta** representa cada una de las líneas que componen una venta realizada por TechStore S.A.

Su finalidad es almacenar la información específica de cada producto vendido dentro de una operación comercial.

Esta entidad constituye el complemento de la entidad **Venta**, implementando el patrón Cabecera–Detalle adoptado para los documentos transaccionales.

---

### MER-018 — Alcance de la entidad Detalle de Venta

#### Contexto

Durante el diseño del modelo fue necesario definir cómo representar individualmente cada producto incluido en una venta.

#### Decisión

Cada registro de la entidad **Detalle de Venta** representará una única línea del documento comercial.

Cada línea corresponderá a un producto específico vendido dentro de una determinada venta.

#### Justificación

Una venta puede contener múltiples productos, cada uno con cantidades, precios y descuentos diferentes.

Representar cada línea como un registro independiente permite modelar correctamente la operación comercial.

#### Consecuencias

* Una venta podrá tener múltiples líneas de detalle.
* Cada detalle pertenecerá exclusivamente a una venta.
* Se mantiene la normalización del modelo.

---

### MER-019 — Responsabilidad de la entidad Detalle de Venta

#### Contexto

Fue necesario establecer qué información será administrada por esta entidad.

#### Decisión

La entidad **Detalle de Venta** almacenará la información propia de cada línea de venta, incluyendo el producto comercializado, la cantidad vendida, el precio unitario aplicado, los descuentos correspondientes y el subtotal de la línea.

#### Justificación

Esta información pertenece al hecho comercial registrado y puede variar entre distintas ventas del mismo producto.

Por ese motivo no debe almacenarse en la entidad **Producto**.

#### Consecuencias

* Se preserva la responsabilidad única de cada entidad.
* Se registra el historial real de las operaciones comerciales.
* Se facilita el análisis posterior de las ventas.

---

### MER-020 — Persistencia del subtotal

#### Contexto

Se evaluó si el subtotal de cada línea debía calcularse dinámicamente o almacenarse dentro del modelo.

#### Decisión

El subtotal será almacenado como parte de cada registro del **Detalle de Venta**.

#### Justificación

En sistemas comerciales reales el subtotal forma parte del comprobante emitido y puede verse afectado por descuentos, promociones, impuestos o reglas comerciales vigentes al momento de la venta.

Persistir este valor garantiza la trazabilidad histórica de la operación.

#### Consecuencias

* Se conserva el valor exacto registrado en la transacción.
* Se simplifica la emisión de comprobantes y reportes.
* El modelo refleja con mayor fidelidad el funcionamiento de un ERP.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-018
* MER-019
* MER-020

---

## 3.8 ENT-008 — Detalle de Compra

### Descripción

La entidad **Detalle de Compra** representa cada una de las líneas que componen una compra registrada por TechStore S.A.

Su finalidad es almacenar la información específica de cada producto adquirido dentro de una operación de compra.

Esta entidad constituye el complemento de la entidad **Compra**, implementando el patrón Cabecera–Detalle adoptado para los documentos transaccionales.

---

### MER-021 — Alcance de la entidad Detalle de Compra

#### Contexto

Durante el diseño del modelo fue necesario definir cómo representar individualmente cada producto incluido en una compra.

#### Decisión

Cada registro de la entidad **Detalle de Compra** representará una única línea del documento de compra.

Cada línea corresponderá a un producto específico adquirido dentro de una determinada compra.

#### Justificación

Una compra puede contener múltiples productos, cada uno con cantidades y costos diferentes.

Representar cada línea como un registro independiente permite modelar correctamente la operación comercial y mantener la integridad del modelo.

#### Consecuencias

* Una compra podrá contener múltiples líneas de detalle.
* Cada detalle pertenecerá exclusivamente a una compra.
* Se preserva la normalización del modelo.

---

### MER-022 — Responsabilidad de la entidad Detalle de Compra

#### Contexto

Fue necesario definir qué información será administrada por esta entidad.

#### Decisión

La entidad **Detalle de Compra** almacenará la información propia de cada línea de compra, incluyendo el producto adquirido, la cantidad comprada, el costo unitario aplicado, las bonificaciones o descuentos comerciales correspondientes y el subtotal de la línea.

#### Justificación

El costo de adquisición forma parte de la transacción comercial y puede variar entre distintas compras del mismo producto.

Por ese motivo no debe almacenarse en la entidad **Producto**.

#### Consecuencias

* Se mantiene la responsabilidad única de la entidad.
* Se conserva el historial real de costos de adquisición.
* Se facilita el análisis posterior de las compras.

---

### MER-023 — Persistencia del subtotal

#### Contexto

Se evaluó si el subtotal de cada línea debía calcularse dinámicamente o almacenarse dentro del modelo.

#### Decisión

El subtotal será almacenado como parte de cada registro del **Detalle de Compra**.

#### Justificación

El subtotal forma parte del documento comercial registrado y puede verse afectado por bonificaciones, descuentos, impuestos o reglas comerciales vigentes al momento de la compra.

Persistir este valor garantiza la trazabilidad histórica de la operación.

#### Consecuencias

* Se conserva el valor exacto registrado en la transacción.
* Se simplifica la generación de reportes y comprobantes.
* El modelo refleja con mayor fidelidad el funcionamiento de un ERP.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-021
* MER-022
* MER-023

---

## 3.9 ENT-009 — Empleado

### Descripción

La entidad **Empleado** representa a cada una de las personas que forman parte de la estructura organizacional de TechStore S.A.

Su finalidad es almacenar la información propia del personal de la empresa, permitiendo asociar empleados a distintos procesos del negocio, como ventas, compras, administración de productos y gestión de inventario.

Esta entidad constituye un dato maestro del sistema y representa exclusivamente a los colaboradores internos de la organización.

---

### MER-024 — Alcance de la entidad Empleado

#### Contexto

Durante el diseño del modelo fue necesario definir qué concepto del negocio representa la entidad Empleado.

#### Decisión

La entidad **Empleado** representará únicamente a las personas que mantienen una relación laboral con TechStore S.A.

No representará usuarios del sistema, clientes, proveedores ni otros actores externos.

#### Justificación

Cada entidad debe representar un único concepto del dominio.

Separar el concepto de empleado del concepto de usuario o de otros participantes del negocio evita ambigüedades y facilita la evolución futura del sistema.

#### Consecuencias

* Se mantiene la responsabilidad única de la entidad.
* El modelo podrá incorporar posteriormente una entidad de usuarios sin modificar la estructura de Empleado.
* Se mejora la claridad conceptual del modelo.

---

### MER-025 — Relación del empleado con la estructura organizacional

#### Contexto

Fue necesario establecer cómo se integran los empleados dentro de la organización de la empresa.

#### Decisión

Cada empleado pertenecerá a una única **Sucursal** y a un único **Sector**.

Estas relaciones permitirán identificar la ubicación organizacional del personal dentro de la empresa.

#### Justificación

La estructura organizacional constituye un elemento estable del negocio y facilita la asignación de responsabilidades, la generación de reportes y el análisis operativo.

#### Consecuencias

* Cada empleado estará asociado a una sucursal.
* Cada empleado estará asociado a un sector.
* Se simplifica el análisis organizacional de la empresa.

---

### MER-026 — Responsabilidad de la entidad Empleado

#### Contexto

Fue necesario delimitar la información que será administrada por la entidad.

#### Decisión

La entidad **Empleado** almacenará únicamente información propia del colaborador, como datos identificatorios, información de contacto, fecha de ingreso y estado laboral.

No almacenará indicadores de desempeño, comisiones, ventas realizadas ni otra información derivada de procesos del negocio.

#### Justificación

La información transaccional debe permanecer separada de los datos maestros.

Esto preserva la normalización y facilita la evolución del modelo.

#### Consecuencias

* Se evita la duplicación de información.
* Se preserva la integridad del modelo.
* Se facilita la reutilización de la entidad en distintos procesos.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-024
* MER-025
* MER-026


---

## 3.10 ENT-010 — Sector

### Descripción

La entidad **Sector** representa las distintas áreas funcionales que conforman la estructura organizacional de TechStore S.A.

Su finalidad es clasificar a los empleados según el área en la que desempeñan sus funciones, facilitando la organización interna y la generación de reportes administrativos.

Esta entidad constituye un catálogo organizacional del sistema y representa información relativamente estable.

---

### MER-027 — Alcance de la entidad Sector

#### Contexto

Durante el diseño del modelo fue necesario definir el concepto representado por la entidad Sector.

#### Decisión

La entidad **Sector** representará exclusivamente una división funcional de la organización.

No representará sucursales, oficinas, ubicaciones físicas ni otras estructuras administrativas.

#### Justificación

Los sectores constituyen una clasificación organizacional independiente de la ubicación física donde operan.

Esta separación facilita la reutilización de la estructura organizacional en distintas sucursales y evita duplicar información.

#### Consecuencias

* Un mismo sector podrá existir en múltiples sucursales.
* Se preserva la independencia entre la organización funcional y la estructura física.
* El modelo resulta más flexible y reutilizable.

---

### MER-028 — Independencia de la entidad Sector

#### Contexto

Se analizó si un sector debía existir únicamente cuando tuviera empleados asignados.

#### Decisión

Los sectores podrán existir independientemente de la asignación de empleados.

#### Justificación

La estructura organizacional puede definirse antes de incorporar personal o reorganizar áreas existentes.

Representar los sectores como entidades independientes refleja con mayor fidelidad el funcionamiento de una organización.

#### Consecuencias

* Se facilita la planificación organizacional.
* Se evita condicionar la existencia del catálogo a los datos operativos.
* Se mantiene la separación entre datos maestros y transacciones.

---

### MER-029 — Responsabilidad de la entidad Sector

#### Contexto

Fue necesario establecer el alcance funcional de la entidad.

#### Decisión

La entidad **Sector** almacenará únicamente información descriptiva relacionada con las áreas funcionales de la empresa.

No administrará empleados, indicadores de desempeño ni información derivada de procesos organizacionales.

#### Justificación

Las entidades de catálogo deben representar criterios de clasificación reutilizables por el resto del modelo.

#### Consecuencias

* Se mantiene la responsabilidad única de la entidad.
* Se evita la duplicación de información.
* Se facilita la reutilización del catálogo en distintos procesos.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-027
* MER-028
* MER-029

---

## 3.11 ENT-011 — Sucursal

### Descripción

La entidad **Sucursal** representa cada una de las unidades operativas mediante las cuales TechStore S.A. desarrolla sus actividades comerciales.

Su finalidad es identificar el lugar donde se realizan las operaciones del negocio y organizar la información asociada a empleados, compras, ventas y movimientos de inventario.

Esta entidad constituye un dato maestro del sistema y representa la estructura física y operativa de la empresa.

---

### MER-030 — Alcance de la entidad Sucursal

#### Contexto

Durante el diseño del modelo fue necesario definir qué concepto representa la entidad Sucursal dentro de la organización.

#### Decisión

La entidad **Sucursal** representará una unidad operativa de TechStore S.A.

No representará únicamente un domicilio físico, sino el establecimiento donde se desarrollan las actividades comerciales de la empresa.

#### Justificación

Las operaciones del negocio se realizan en sucursales específicas.

Representarlas como unidades operativas permite asociar correctamente empleados, documentos comerciales y movimientos de inventario.

#### Consecuencias

* Las operaciones podrán asociarse a una sucursal determinada.
* Se facilita el análisis por establecimiento.
* El modelo resulta más representativo de la realidad del negocio.

---

### MER-031 — Independencia de la entidad Sucursal

#### Contexto

Se evaluó si una sucursal debía existir únicamente cuando tuviera empleados, stock o movimientos registrados.

#### Decisión

Las sucursales podrán existir independientemente de la existencia de empleados o transacciones asociadas.

#### Justificación

Una empresa puede planificar nuevas sucursales antes de iniciar sus operaciones.

Representarlas como entidades independientes refleja adecuadamente la evolución natural de la organización.

#### Consecuencias

* Se facilita la planificación del crecimiento de la empresa.
* Se mantiene la independencia entre datos maestros y datos transaccionales.
* El modelo conserva su flexibilidad.

---

### MER-032 — Relación de la entidad Sucursal con la ubicación geográfica

#### Contexto

Fue necesario establecer cómo representar la ubicación física de cada sucursal.

#### Decisión

Cada **Sucursal** estará asociada a una única **Ciudad**.

La ciudad correspondiente determinará, a su vez, la provincia donde se encuentra ubicada.

La dirección física será almacenada como un atributo propio de la sucursal, mientras que la información geográfica reutilizable será administrada mediante las entidades **Ciudad** y **Provincia**.

#### Justificación

Separar la dirección específica de la clasificación geográfica evita la duplicación de información y favorece la normalización del modelo.

#### Consecuencias

* Se reutiliza la información geográfica.
* Se simplifican las consultas por ciudad o provincia.
* Se evita almacenar repetidamente los mismos nombres geográficos.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-030
* MER-031
* MER-032

---

## 3.12 ENT-012 — Ciudad

### Descripción

La entidad **Ciudad** representa las localidades utilizadas para identificar la ubicación geográfica de las sucursales de TechStore S.A.

Su finalidad es normalizar la información geográfica y evitar la duplicación de nombres de ciudades dentro del modelo de datos.

Esta entidad constituye un catálogo geográfico y mantiene una relación jerárquica con la entidad **Provincia**.

---

### MER-033 — Normalización de la información geográfica

#### Contexto

Durante el diseño del modelo se evaluó cómo representar la información geográfica correspondiente a las sucursales.

#### Decisión

Los nombres de ciudades y provincias no serán almacenados como texto libre dentro de las entidades operativas.

La información geográfica será administrada mediante las entidades **Ciudad** y **Provincia**.

#### Justificación

La utilización de entidades de catálogo evita inconsistencias de escritura, reduce la duplicación de información y facilita la generación de reportes geográficos.

#### Consecuencias

* Se mejora la calidad de los datos.
* Se evita la duplicación de nombres geográficos.
* Se facilita el análisis por ubicación.

---

### MER-034 — Relación entre Ciudad y Provincia

#### Contexto

Fue necesario establecer la jerarquía geográfica del modelo.

#### Decisión

Cada **Ciudad** pertenecerá a una única **Provincia**.

Cada **Provincia** podrá contener múltiples ciudades.

#### Justificación

Esta estructura refleja la organización territorial utilizada por la empresa y permite reutilizar la información geográfica de forma consistente.

#### Consecuencias

* Se establece una relación jerárquica entre ambas entidades.
* Se simplifican las consultas por provincia y ciudad.
* Se preserva la normalización del modelo.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-033
* MER-034

---

## 3.13 ENT-013 — Provincia

### Descripción

La entidad **Provincia** representa las divisiones territoriales utilizadas para organizar la información geográfica del sistema.

Su finalidad es proporcionar un catálogo reutilizable de provincias que permita estructurar las ciudades y facilitar el análisis territorial de las operaciones.

Esta entidad constituye un catálogo geográfico de referencia.

---

### MER-035 — Alcance de la entidad Provincia

#### Contexto

Fue necesario definir el papel que desempeña la entidad Provincia dentro del modelo.

#### Decisión

La entidad **Provincia** representará exclusivamente las divisiones territoriales utilizadas por TechStore S.A.

No administrará información de sucursales ni de ciudades, sino únicamente el catálogo de provincias.

#### Justificación

Cada entidad debe representar un único concepto del negocio.

La separación entre provincias y ciudades facilita la reutilización de la información geográfica y evita redundancias.

#### Consecuencias

* Se preserva la responsabilidad única de la entidad.
* Se simplifica la administración del catálogo geográfico.
* Se mejora la consistencia del modelo.

---

### MER-036 — Independencia de la entidad Provincia

#### Contexto

Se evaluó si una provincia debía existir únicamente cuando tuviera ciudades asociadas.

#### Decisión

Las provincias podrán existir independientemente de la existencia de ciudades registradas.

#### Justificación

Los catálogos geográficos representan información estable que puede definirse previamente a la carga de datos operativos.

#### Consecuencias

* Se facilita la administración del catálogo.
* Se mantiene la independencia entre datos maestros y datos operativos.
* Se conserva la flexibilidad del modelo.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-035
* MER-036

---

## 3.14 ENT-014 — Forma de Pago

### Descripción

La entidad **Forma de Pago** representa los distintos medios mediante los cuales TechStore S.A. puede cancelar o cobrar una operación comercial.

Su finalidad es proporcionar un catálogo reutilizable que pueda ser utilizado por los procesos de compra y venta para identificar el medio de pago utilizado en cada transacción.

Esta entidad constituye un catálogo del sistema y representa información relativamente estable.

---

### MER-037 — Alcance de la entidad Forma de Pago

#### Contexto

Durante el diseño del modelo fue necesario definir qué concepto representa la entidad Forma de Pago.

#### Decisión

La entidad **Forma de Pago** representará exclusivamente un catálogo de medios de pago disponibles.

No almacenará operaciones de pago, importes, fechas ni otra información transaccional.

#### Justificación

Los medios de pago constituyen información de referencia utilizada por distintos procesos del negocio.

Separarlos de las transacciones permite reutilizar el catálogo y mantener el modelo normalizado.

#### Consecuencias

* Se preserva la responsabilidad única de la entidad.
* Se evita la duplicación de información.
* Se facilita la incorporación de nuevos medios de pago.

---

### MER-038 — Reutilización del catálogo de Formas de Pago

#### Contexto

Se evaluó si los procesos de compra y venta debían utilizar catálogos independientes de formas de pago.

#### Decisión

Los procesos de compra y venta compartirán una única entidad **Forma de Pago**.

#### Justificación

Los medios de pago representan el mismo concepto de negocio independientemente del tipo de operación comercial.

Utilizar un único catálogo simplifica el mantenimiento y evita inconsistencias.

#### Consecuencias

* Un único catálogo será utilizado por múltiples procesos.
* Se reduce la redundancia del modelo.
* Se mejora la consistencia de la información.

---

### MER-039 — Independencia de la entidad Forma de Pago

#### Contexto

Se analizó si una forma de pago debía existir únicamente cuando hubiera sido utilizada en alguna operación.

#### Decisión

Las formas de pago podrán existir independientemente de las operaciones comerciales.

#### Justificación

La empresa puede definir nuevos medios de pago antes de comenzar a utilizarlos.

Representar el catálogo como información independiente facilita la administración del sistema.

#### Consecuencias

* Se mantiene la independencia entre catálogos y transacciones.
* Se facilita la administración de medios de pago.
* Se conserva la flexibilidad del modelo.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-037
* MER-038
* MER-039

---

## 3.15 ENT-015 — Movimiento de Stock

### Descripción

La entidad **Movimiento de Stock** representa cada una de las variaciones registradas en la existencia de un producto dentro de una sucursal de TechStore S.A.

Su finalidad es mantener el historial de ingresos, egresos y ajustes de inventario, permitiendo reconstruir la evolución del stock a lo largo del tiempo.

Esta entidad constituye una entidad transaccional del sistema y registra hechos relacionados con la gestión del inventario.

---

### MER-040 — Alcance de la entidad Movimiento de Stock

#### Contexto

Durante el diseño del modelo fue necesario definir qué concepto representa la entidad Movimiento de Stock.

#### Decisión

La entidad **Movimiento de Stock** registrará exclusivamente las variaciones producidas sobre las existencias de los productos.

No almacenará el stock disponible de cada artículo.

#### Justificación

El stock disponible representa un estado derivado del conjunto de movimientos registrados.

Separar el historial de movimientos del estado actual preserva la trazabilidad de las operaciones y mantiene la normalización del modelo.

#### Consecuencias

* Se conserva el historial completo del inventario.
* El stock podrá calcularse a partir de los movimientos registrados o mantenerse mediante procesos específicos si el rendimiento lo requiere.
* Se mejora la capacidad de auditoría del sistema.

---

### MER-041 — Origen de los movimientos de stock

#### Contexto

Se analizó qué procesos del negocio pueden generar movimientos de inventario.

#### Decisión

La entidad **Movimiento de Stock** podrá registrar movimientos originados por distintos procesos del negocio, como compras, ventas, ajustes de inventario, devoluciones u otras operaciones que impliquen una modificación de existencias.

No dependerá exclusivamente de un único proceso transaccional.

#### Justificación

El inventario puede modificarse por múltiples causas.

Representar el movimiento como un concepto independiente permite extender el sistema sin alterar la estructura del modelo.

#### Consecuencias

* La entidad podrá integrarse con nuevos procesos en el futuro.
* Se favorece la extensibilidad del modelo.
* Se mantiene una representación fiel de la realidad operativa.

---

### MER-042 — Relación del movimiento con la sucursal

#### Contexto

Fue necesario definir el ámbito físico en el que se producen las variaciones de inventario.

#### Decisión

Todo **Movimiento de Stock** estará asociado a una única **Sucursal**, indicando el establecimiento donde ocurrió la variación de existencias.

#### Justificación

Las existencias se administran por ubicación física.

Registrar la sucursal asociada a cada movimiento permite controlar el inventario de manera independiente para cada establecimiento.

#### Consecuencias

* Se facilita el control de stock por sucursal.
* Se mejora la trazabilidad de las operaciones.
* El modelo soporta escenarios con múltiples establecimientos.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-040
* MER-041
* MER-042

---

## 3.16 ENT-016 — Marca

### Descripción

La entidad **Marca** representa los fabricantes o marcas comerciales asociadas a los productos comercializados por TechStore S.A.

Su finalidad es normalizar la información de las marcas, evitando su almacenamiento como texto libre y permitiendo realizar consultas, reportes y análisis comerciales basados en este criterio de clasificación.

Esta entidad constituye un catálogo reutilizable del sistema.

---

### MER-043 — Incorporación de la entidad Marca

#### Contexto

Durante la revisión arquitectónica del MER se identificó que los productos comercializados pertenecen naturalmente a una marca comercial.

Inicialmente esta información no había sido modelada como una entidad independiente.

#### Decisión

Se incorporará la entidad **Marca** como un catálogo del sistema.

Cada **Producto** estará asociado a una única **Marca**.

Una **Marca** podrá estar asociada a múltiples productos.

#### Justificación

La marca constituye un concepto propio del negocio y posee identidad independiente de los productos que representa.

Modelarla como una entidad de catálogo evita inconsistencias de escritura, facilita la administración de la información y permite reutilizar el mismo registro en múltiples productos.

#### Consecuencias

* Se elimina la duplicación de nombres de marcas.
* Se facilita la generación de reportes comerciales por marca.
* Se mejora la normalización del modelo.

---

### MER-044 — Alcance de la entidad Marca

#### Contexto

Fue necesario definir qué información corresponde almacenar en la entidad Marca.

#### Decisión

La entidad **Marca** almacenará únicamente información propia de la marca comercial.

No almacenará productos, precios, proveedores, ventas ni otra información derivada de procesos comerciales.

#### Justificación

Cada entidad debe representar un único concepto del negocio.

Los productos comercializados constituyen una entidad independiente que mantiene una relación con la marca, pero no forman parte de ella.

#### Consecuencias

* Se preserva el principio de responsabilidad única.
* Se reduce el acoplamiento entre entidades.
* Se facilita la evolución futura del modelo.

---

### MER-045 — Independencia de la entidad Marca

#### Contexto

Se evaluó si una marca debía existir únicamente cuando tuviera productos asociados.

#### Decisión

Las marcas podrán existir independientemente de la existencia de productos registrados.

#### Justificación

La empresa puede incorporar nuevas marcas a su catálogo antes de comercializar productos asociados a ellas.

Representar la marca como una entidad independiente facilita la administración del catálogo y mantiene la coherencia con el resto de las entidades de referencia del sistema.

#### Consecuencias

* Se mantiene la independencia entre catálogos y entidades operativas.
* Se facilita la incorporación de nuevas líneas de productos.
* Se conserva la flexibilidad del modelo.

---

### Estado de la entidad

**Estado:** Aprobada.

**Decisiones aprobadas:**

* MER-043
* MER-044
* MER-045
