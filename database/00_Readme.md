# Base de Datos

## Objetivo

La carpeta `database` contiene todos los scripts SQL necesarios para construir la base de datos del proyecto **TechStore S.A.**.

Estos scripts representan la implementación física del modelo diseñado durante las etapas de análisis funcional, Modelo Entidad-Relación (MER) y diseño lógico.

La ejecución ordenada de los archivos permite crear una base de datos completamente funcional y consistente.

---

# Motor de Base de Datos

Durante el desarrollo del Bootcamp se utilizará **MySQL** como sistema gestor de bases de datos.

La administración y ejecución de los scripts se realizará mediante **MySQL Workbench**, utilizando una conexión local al servidor MySQL.

La elección de este entorno busca simplificar el flujo de trabajo y concentrar el aprendizaje en SQL y en el diseño de bases de datos.

---

# Organización de los scripts

Los archivos SQL se encuentran numerados según el orden en que deben ejecutarse.

| Archivo                    | Descripción                                                                                         |
| -------------------------- | --------------------------------------------------------------------------------------------------- |
| `01_CreateDatabase.sql`    | Crea la base de datos y selecciona el esquema de trabajo.                                           |
| `02_CreateTables.sql`      | Crea todas las tablas del sistema junto con sus restricciones estructurales.                        |
| `03_CreateConstraints.sql` | Define restricciones adicionales que no hayan sido implementadas durante la creación de las tablas. |
| `04_InsertData.sql`        | Inserta los datos iniciales necesarios para el funcionamiento del sistema.                          |
| `05_CreateIndexes.sql`     | Crea índices destinados a optimizar el rendimiento de las consultas.                                |

---

# Orden de ejecución

Los scripts deben ejecutarse respetando el siguiente orden:

```text
01_CreateDatabase.sql
            ↓
02_CreateTables.sql
            ↓
03_CreateConstraints.sql
            ↓
04_InsertData.sql
            ↓
05_CreateIndexes.sql
```

Cada archivo depende de la correcta ejecución de los anteriores.

---

# Herramientas utilizadas

Durante el Bootcamp se utilizarán las siguientes herramientas:

* MySQL Server
* MySQL Workbench
* Visual Studio Code (para la edición de los scripts y la documentación)

---

# Relación con la documentación

Los scripts implementan físicamente las decisiones documentadas en:

* Análisis funcional.
* Modelo Entidad-Relación (MER).
* Diseño lógico.
* Normalización.
* Claves y restricciones.

La implementación física constituye la etapa donde el diseño conceptual se transforma en una base de datos real.

---

# Convenciones

Durante el desarrollo se seguirán las siguientes convenciones:

* Utilizar nombres descriptivos para tablas y columnas.
* Mantener una nomenclatura consistente en todo el proyecto.
* Documentar mediante comentarios las decisiones relevantes.
* Separar la creación de la base de datos, tablas, restricciones, datos iniciales e índices en scripts independientes.
* Favorecer el uso de SQL estándar siempre que sea posible, minimizando las dependencias específicas de MySQL.

---

# Consideraciones finales

El objetivo principal de esta carpeta es implementar progresivamente la base de datos diseñada durante las etapas anteriores del Bootcamp.

Aunque el proyecto utiliza MySQL como motor de ejecución, se procurará mantener un diseño portable y alineado con las buenas prácticas del estándar SQL, facilitando una futura migración a otros sistemas gestores de bases de datos.
