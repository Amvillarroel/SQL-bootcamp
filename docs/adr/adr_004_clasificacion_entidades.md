# ADR-004 — Incorporación de la Clasificación de Entidades como etapa formal del diseño del MER

**Estado:** Aprobado
**Fecha:** Julio de 2026

---

# Contexto

Inicialmente, el diseño del Modelo Entidad-Relación (MER) comenzaba directamente con la identificación de relaciones entre entidades.

Durante la revisión metodológica del proyecto se identificó que la clasificación previa de las entidades aportaba una comprensión más profunda del dominio del negocio y facilitaba las decisiones posteriores de modelado.

Además, esta etapa había surgido de manera natural durante las sesiones de arquitectura y se consideró suficientemente relevante como para formalizarla dentro del proceso del Bootcamp.

---

# Decisión

Se incorpora una nueva etapa formal denominada **Clasificación de Entidades del Dominio**, ubicada entre el Análisis Funcional y el diseño del Modelo Entidad-Relación.

Como consecuencia de esta decisión:

* Se crea el documento `06_Clasificacion_Entidades.md`.
* El documento del MER pasa a identificarse como `07_MER.md`.
* El documento de Decisiones de Arquitectura pasa a identificarse como `08_Decisiones_Arquitectura.md`.

La clasificación de entidades será un paso obligatorio antes de iniciar el diseño del MER en este proyecto.

---

# Consecuencias

* Se mejora la trazabilidad entre el análisis funcional y el diseño lógico.
* El proceso de modelado adquiere una estructura más gradual y didáctica.
* El repositorio incorpora un documento reutilizable para futuros proyectos de modelado de datos.
* Las decisiones sobre relaciones y cardinalidades podrán tomarse con un mayor conocimiento del papel que desempeña cada entidad dentro del dominio.

---

# Justificación

La incorporación de esta etapa responde a una mejora metodológica identificada durante el desarrollo del proyecto.

Formalizar la clasificación de entidades favorece tanto la calidad del diseño como el valor pedagógico del Bootcamp, al enseñar una práctica habitual en proyectos profesionales que rara vez se aborda de forma explícita en materiales introductorios.
