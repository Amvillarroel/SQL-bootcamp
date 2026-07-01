# Decisiones de Arquitectura

**Proyecto:** SQL Bootcamp
**Módulo:** 2 - Diseñar el Modelo de Datos (MER)
**Documento:** 07_Decisiones_Arquitectura.md
**Estado:** ACTIVO v1.0

---

# 1. Objetivo

Este documento centraliza las decisiones de arquitectura que influyen en el diseño del proyecto.

Su finalidad es registrar criterios generales, decisiones pendientes y lineamientos que servirán de guía durante el desarrollo del modelo de datos.

A diferencia de los Architecture Decision Records (ADR), este documento es dinámico y podrá evolucionar a medida que avance el proyecto.

---

# 2. Principios de Arquitectura

## DA-001 — El modelo representará una empresa realista

El dominio del negocio será una empresa de comercialización de productos tecnológicos con procesos similares a los de un ERP real.

---

## DA-002 — La documentación forma parte del producto

Toda decisión relevante deberá quedar documentada antes de su implementación.

---

## DA-003 — El análisis funcional precede al diseño lógico

No se tomarán decisiones de modelado sin haber finalizado previamente el análisis funcional correspondiente.

---

## DA-004 — El aprendizaje tendrá prioridad sobre la complejidad

Cuando existan varias alternativas técnicamente válidas, se elegirá aquella que aporte mayor valor pedagógico sin perder realismo.

---

# 3. Decisiones pendientes

Las siguientes decisiones serán resueltas durante el diseño del MER.

## DP-001 — Modelado de clientes

Determinar si clientes particulares y empresas compartirán una única entidad o se representarán mediante entidades independientes.

---

## DP-002 — Gestión del stock

Definir si el stock será modelado como una entidad específica, como un atributo derivado o mediante otra estrategia.

---

## DP-003 — Gestión de depósitos

Determinar si cada sucursal administrará un único depósito o múltiples depósitos.

---

## DP-004 — Estrategia de precios

Definir si el sistema administrará un precio actual, historial de precios, listas de precios o una combinación de estos enfoques.

---

# 4. Criterios para futuras decisiones

Toda decisión de arquitectura deberá cumplir los siguientes criterios:

* Mantener la coherencia del modelo.
* Favorecer el aprendizaje progresivo.
* Preservar la trazabilidad entre análisis funcional, MER e implementación.
* Evitar complejidad innecesaria.
* Documentarse mediante un ADR cuando tenga impacto permanente en el proyecto.

---

# 5. Estado del documento

Versión: 1.0

Estado: **ACTIVO**

Este documento permanecerá abierto durante todo el desarrollo del proyecto y se actualizará cuando se incorporen nuevas decisiones de arquitectura o se resuelvan decisiones pendientes.
