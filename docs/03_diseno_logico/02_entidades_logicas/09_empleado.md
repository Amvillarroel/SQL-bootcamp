# 09. Entidad lógica — Empleado

---

# Objetivo

La entidad **Empleado** representa a cada persona que desempeña funciones dentro de TechStore S.A.

Su finalidad es almacenar la información permanente de los empleados de la organización, permitiendo identificar a los responsables de distintas operaciones del sistema y dejando preparada la base de datos para futuras ampliaciones funcionales, como módulos de recursos humanos o liquidación de haberes.

Las decisiones conceptuales relacionadas con esta entidad fueron documentadas previamente en el Modelo Entidad-Relación (MER). El presente documento desarrolla únicamente su estructura lógica.

---

# Atributos propuestos

| Atributo      | Descripción                                           | Tipo        | Obligatorio |
| ------------- | ----------------------------------------------------- | ----------- | ----------- |
| Identificador | Identificador interno del empleado.                   | Simple      | Sí          |
| Nombre        | Nombre del empleado.                                  | Simple      | Sí          |
| Apellido      | Apellido del empleado.                                | Simple      | Sí          |
| Documento     | Documento de identidad.                               | Simple      | Sí          |
| FechaIngreso  | Fecha de incorporación a la empresa.                  | Simple      | Sí          |
| Sector        | Referencia al sector al que pertenece.                | Referencial | Sí          |
| Sucursal      | Referencia a la sucursal donde desarrolla sus tareas. | Referencial | Sí          |
| Activo        | Indica si el empleado continúa prestando servicios.   | Simple      | Sí          |

---

# Análisis de diseño

## Identificador

Cada empleado dispondrá de un identificador interno único generado por el sistema.

Este identificador será utilizado como clave de referencia en las distintas entidades que requieran identificar al responsable de una operación.

---

## Nombre

Representa el nombre del empleado.

Debe almacenar únicamente el nombre propio, evitando incorporar apellidos u otra información adicional.

---

## Apellido

Representa el apellido del empleado.

Se almacena separado del nombre para facilitar búsquedas, ordenamientos y generación de reportes.

---

## Documento

Representa el documento nacional de identidad u otro identificador oficial del empleado.

Aunque constituye un dato único dentro del negocio, no será utilizado como clave primaria debido a que podría cambiar por razones administrativas o normativas.

---

## FechaIngreso

Indica la fecha en que el empleado comenzó su relación laboral con la empresa.

Este dato resulta útil tanto para consultas administrativas como para futuras funcionalidades vinculadas a recursos humanos.

---

## Sector

Cada empleado pertenecerá a un único sector de la organización.

La información correspondiente al sector será administrada mediante la entidad **Sector**, evitando duplicar datos descriptivos.

---

## Sucursal

Cada empleado desarrollará sus actividades en una sucursal determinada.

La información propia de cada establecimiento será administrada por la entidad **Sucursal**.

---

## Activo

Permite identificar si el empleado continúa formando parte de la organización.

La utilización de este atributo evita eliminar registros históricos y preserva la integridad referencial de las operaciones realizadas por empleados que ya no trabajan en la empresa.

---

# Atributos descartados

Durante el diseño lógico se decidió no incorporar los siguientes atributos:

* Edad.
* Antigüedad.
* Salario.
* Cargo.
* Teléfono laboral.
* Correo institucional.
* Cantidad de ventas realizadas.
* Comisión acumulada.

---

## Justificación

La edad y la antigüedad pueden obtenerse a partir de otras fechas registradas.

Los datos salariales, cargos, beneficios o información específica de recursos humanos corresponden a un eventual módulo especializado que excede el alcance del presente proyecto.

Las estadísticas de desempeño constituyen información derivada y podrán obtenerse mediante consultas sobre las entidades transaccionales.

---

# Consideraciones de normalización

La entidad **Empleado** representa exclusivamente la información permanente de cada integrante de la organización.

Los datos relacionados con la estructura organizacional se delegan a las entidades **Sector** y **Sucursal**, evitando redundancias y facilitando el mantenimiento del modelo.

La entidad no almacena información operativa ni indicadores calculados, respetando el principio de responsabilidad única.

---

# Preparación para la siguiente etapa

Durante las próximas fases del diseño lógico deberán definirse los siguientes aspectos:

* Clave primaria.
* Restricción de unicidad sobre el documento de identidad.
* Tipos de datos para fechas y atributos alfanuméricos.
* Restricciones para el atributo **Activo**.
* Índices sobre las referencias a **Sector** y **Sucursal**.
* Reglas de integridad referencial con las entidades relacionadas.

Estas decisiones serán desarrolladas durante las etapas de claves, restricciones y diseño físico del modelo.
