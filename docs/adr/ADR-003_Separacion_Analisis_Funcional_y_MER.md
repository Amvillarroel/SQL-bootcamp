# ADR-003 — Separación entre Análisis Funcional y MER

**Estado:** Aprobado
**Fecha:** Julio de 2026

---

# Contexto

Durante el análisis funcional surgieron decisiones relacionadas con el diseño del modelo de datos, como la representación de clientes, la gestión del stock y la estrategia de precios.

Resolverlas en esta etapa habría mezclado análisis del negocio con diseño lógico.

---

# Decisión

El análisis funcional se limitará a describir el negocio y sus necesidades.

Las decisiones de modelado se tomarán exclusivamente durante la fase de diseño del Modelo Entidad-Relación (MER).

---

# Consecuencias

* Se mantendrá una separación clara entre requisitos y diseño.
* El MER se construirá sobre una base funcional validada.
* Las decisiones de modelado estarán respaldadas por el análisis previo y no por suposiciones técnicas.
