# 01. Metodología del Diseño Lógico

---

# Objetivo

Finalizada la etapa de análisis funcional y el diseño del Modelo Entidad-Relación (MER), el siguiente paso consiste en transformar dicho modelo conceptual en un modelo lógico de base de datos.

El propósito del diseño lógico es definir con precisión la estructura que posteriormente será implementada en un sistema gestor de bases de datos (DBMS), estableciendo las entidades, sus atributos, las claves, las restricciones y las relaciones necesarias para garantizar la integridad y consistencia de la información.

En esta etapa todavía no se escribe código SQL ni se consideran particularidades de un motor de base de datos específico. El objetivo es obtener un modelo independiente de la tecnología, correctamente normalizado y preparado para su implementación.

---

# Alcance

El diseño lógico desarrollado en este Bootcamp comprende todas las decisiones necesarias para convertir el MER en una estructura relacional implementable.

Se abordarán, entre otros, los siguientes aspectos:

* Definición de atributos para cada entidad.
* Identificación de atributos obligatorios y opcionales.
* Identificación de claves primarias y claves candidatas.
* Definición de claves foráneas.
* Aplicación de las reglas de normalización.
* Definición de restricciones de integridad.
* Selección de dominios y tipos de datos lógicos.
* Revisión integral del modelo antes de su implementación física.

El resultado de esta etapa será un modelo lógico completamente documentado y listo para transformarse en sentencias SQL.

---

# Metodología de trabajo

Al igual que en las etapas anteriores del Bootcamp, el diseño lógico se desarrollará de forma incremental.

Cada decisión será documentada, revisada y validada antes de avanzar hacia la siguiente.

El proceso seguirá el siguiente orden:

1. Definición de los atributos de todas las entidades.
2. Revisión y aplicación de las reglas de normalización.
3. Definición de claves y restricciones.
4. Selección de los tipos de datos.
5. Revisión integral del modelo lógico.

Este enfoque permite mantener la coherencia del diseño y comprender el motivo de cada decisión antes de su implementación.

---

# Principios de diseño

Durante toda esta etapa se respetarán los siguientes principios:

## Responsabilidad única

Cada entidad representará un único concepto del negocio.

Cada atributo pertenecerá únicamente a la entidad que naturalmente lo representa.

---

## Independencia tecnológica

Las decisiones del modelo lógico no dependerán de un motor de base de datos específico.

Siempre que sea posible, las definiciones se realizarán utilizando conceptos estándar del modelo relacional.

---

## Normalización

Toda decisión será evaluada considerando las reglas de normalización, evitando redundancias innecesarias y reduciendo las anomalías de inserción, actualización y eliminación.

---

## Integridad

El modelo deberá garantizar la consistencia de la información mediante claves, relaciones y restricciones adecuadamente definidas.

---

## Escalabilidad

Las decisiones deberán permitir que el modelo pueda evolucionar sin requerir rediseños estructurales importantes.

---

# Relación con el MER

El Modelo Entidad-Relación constituye la fuente de información principal para el diseño lógico.

Las entidades, relaciones y decisiones arquitectónicas documentadas durante el MER no serán redefinidas en esta etapa.

El diseño lógico únicamente desarrollará el nivel de detalle necesario para transformar dichas decisiones conceptuales en un modelo relacional implementable.

Toda modificación que implique alterar el significado conceptual de una entidad deberá resolverse previamente en el MER antes de incorporarse al diseño lógico.

---

# Relación con el Modelo Físico

El diseño lógico constituye la base sobre la cual posteriormente se desarrollará el modelo físico de la base de datos.

Una vez finalizada esta etapa, el modelo estará preparado para traducirse a sentencias SQL mediante la creación de tablas, restricciones, índices y demás objetos propios del motor de base de datos seleccionado.

En consecuencia, el diseño lógico actúa como el puente entre la arquitectura conceptual del negocio y la implementación técnica del sistema.

---

# Objetivos de aprendizaje

Al finalizar este módulo del Bootcamp, el desarrollador será capaz de:

* Transformar un MER en un modelo lógico relacional.
* Identificar correctamente los atributos de cada entidad.
* Aplicar criterios de normalización sobre un caso de estudio real.
* Definir claves primarias, claves foráneas y restricciones de integridad.
* Seleccionar tipos de datos adecuados según el dominio de la información.
* Preparar un modelo listo para su implementación física mediante SQL.

Más allá de aprender una sintaxis específica, el objetivo es comprender el razonamiento que existe detrás de cada decisión de diseño, desarrollando criterios que puedan aplicarse a proyectos de cualquier tamaño y tecnología.
