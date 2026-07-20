# 5. Revisión del Modelo Lógico

---

# Objetivo

Una vez finalizado el diseño lógico del modelo de datos, resulta necesario realizar una revisión integral que permita verificar la coherencia del modelo antes de iniciar su implementación física.

El propósito de esta revisión es comprobar que las entidades, atributos, relaciones y reglas definidas durante las etapas anteriores representan correctamente el dominio del problema y proporcionan una base sólida para el desarrollo de la base de datos.

---

# Alcance de la revisión

La presente revisión comprende los siguientes aspectos:

* Estructura general del modelo.
* Responsabilidad de las entidades.
* Relaciones entre entidades.
* Aplicación de los principios de normalización.
* Integridad lógica del modelo.
* Preparación para la implementación física.

No se analizan en esta etapa aspectos relacionados con el rendimiento, índices o configuraciones específicas del motor de base de datos.

---

# Revisión de las entidades

Durante el diseño lógico se documentaron todas las entidades identificadas durante el análisis funcional y el desarrollo del MER.

Cada entidad posee una responsabilidad claramente definida dentro del dominio del negocio.

El modelo quedó conformado por:

## Entidades maestras

* Cliente
* Producto
* Proveedor
* Empleado
* Sucursal

## Entidades transaccionales

* Compra
* Venta
* Movimiento de Stock

## Entidades de detalle

* Detalle de Compra
* Detalle de Venta

## Entidades de catálogo

* Categoría
* Marca
* Forma de Pago
* Sector
* Ciudad
* Provincia
* Tipo de Movimiento de Stock
* Alícuota IVA

## Entidad asociativa

* ProductoProveedor

La clasificación realizada durante el análisis continúa siendo consistente con el diseño lógico desarrollado.

---

# Revisión de las relaciones

Las relaciones definidas entre entidades representan correctamente las reglas del negocio identificadas durante el análisis funcional.

Entre las principales decisiones adoptadas se destacan:

* Cada producto pertenece a una única categoría.
* Cada producto posee una única marca.
* Cada producto utiliza una única alícuota de IVA.
* Un proveedor puede suministrar múltiples productos.
* Un producto puede ser suministrado por múltiples proveedores mediante la entidad asociativa **ProductoProveedor**.
* Una venta posee uno o más detalles.
* Una compra posee uno o más detalles.
* Cada movimiento de stock posee un único tipo de movimiento.

Las relaciones permiten representar adecuadamente el funcionamiento esperado para un sistema ERP comercial.

---

# Revisión de la normalización

El análisis realizado en el documento anterior permitió verificar que el modelo satisface los principios fundamentales de las primeras formas normales.

Las principales decisiones que favorecen la normalización fueron:

* Separación entre entidades maestras y transaccionales.
* Utilización de entidades de catálogo.
* Eliminación de atributos multivaluados.
* Eliminación de información derivada.
* Resolución de relaciones muchos a muchos mediante entidades asociativas.

Como resultado, el modelo presenta una estructura consistente, escalable y preparada para evolucionar sin generar redundancias innecesarias.

---

# Aspectos preparados para la implementación física

El modelo lógico deja definidos los elementos necesarios para comenzar la implementación de la base de datos.

Entre ellos:

* Identificación de todas las entidades.
* Definición conceptual de sus atributos.
* Relaciones entre entidades.
* Responsabilidades de cada entidad.
* Clasificación del dominio.
* Reglas generales de integridad.
* Criterios para la definición de claves primarias y foráneas.
* Restricciones generales del modelo.

La implementación física consistirá en traducir estas definiciones a instrucciones SQL.

---

# Aspectos diferidos para etapas posteriores

Con el fin de mantener una metodología incremental, algunos aspectos fueron intencionalmente reservados para fases posteriores.

Entre ellos:

* Selección definitiva de tipos de datos.
* Longitudes de los atributos.
* Creación de índices.
* Optimización de consultas.
* Estrategias de rendimiento.
* Procedimientos almacenados.
* Triggers.
* Vistas.
* Optimización específica del motor de base de datos.

Estas decisiones corresponden al diseño físico y a etapas avanzadas de administración de bases de datos.

---

# Conclusiones

La revisión realizada permite concluir que el modelo lógico desarrollado durante el Bootcamp representa de manera consistente las necesidades del negocio identificadas en el análisis funcional.

Las decisiones documentadas en el MER fueron trasladadas correctamente al diseño lógico y posteriormente verificadas mediante los principios de normalización y las reglas de integridad.

En consecuencia, el modelo se considera preparado para iniciar la etapa de implementación física de la base de datos, donde cada una de estas definiciones será materializada mediante scripts SQL y estructuras propias del sistema gestor de bases de datos seleccionado.
