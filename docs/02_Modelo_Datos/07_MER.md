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

### Decisiones pendientes

Las siguientes decisiones serán resueltas durante el análisis de otras entidades relacionadas:

**MER-006 — Relación entre Producto y Proveedor**

Se definirá si un producto podrá ser suministrado por uno o múltiples proveedores.

---

**MER-007 — Gestión de precios**

Se definirá la estrategia para representar los precios de compra y venta dentro del modelo de datos.

---

### Estado de la entidad

**Estado:** En análisis.

**Decisiones aprobadas:**

* MER-004
* MER-005

**Decisiones pendientes:**

* MER-006
* MER-007
