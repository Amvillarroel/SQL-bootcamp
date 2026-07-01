# Procesos de Negocio

**Proyecto:** SQL Bootcamp
**Módulo:** 2 - Diseñar el Modelo de Datos (MER)
**Fase:** 2.1 - Análisis Funcional
**Documento:** 04_Procesos_Negocio.md
**Estado:** BORRADOR v1.0

---

# 1. Objetivo

El presente documento describe los principales procesos operativos de TechStore S.A.

Su finalidad es representar el flujo de información entre las distintas entidades del negocio, identificando los actores involucrados y las operaciones que el sistema ERP deberá administrar.

Este documento constituye un insumo para validar el Modelo Entidad-Relación (MER), asegurando que todas las operaciones relevantes del negocio puedan ser representadas correctamente.

---

# 2. Alcance

Incluye:

* Procesos principales del negocio.
* Flujo general de información.
* Actores involucrados.
* Información generada y actualizada.

No incluye:

* Diagramas BPMN.
* Diagramas UML.
* Diseño físico de la base de datos.
* Implementación técnica.

---

# 3. Procesos del Negocio

## PRC-001 – Gestión de Ventas

### Objetivo

Registrar una operación de venta realizada a un cliente.

### Actores involucrados

* Cliente
* Empleado
* Sistema ERP

### Flujo general

1. El cliente solicita uno o más productos.
2. El empleado registra la venta.
3. El sistema verifica la información necesaria para completar la operación.
4. Se genera la venta.
5. Se registran los productos vendidos.
6. Se registra la forma de pago utilizada.
7. Se actualiza el inventario.
8. La operación queda disponible para consultas e informes.

### Información generada

* Venta
* Detalle de Venta

### Información actualizada

* Stock de productos

---

## PRC-002 – Gestión de Compras

### Objetivo

Registrar el ingreso de mercadería adquirida a un proveedor.

### Actores involucrados

* Proveedor
* Empleado
* Sistema ERP

### Flujo general

1. Se genera una compra.
2. El proveedor entrega la mercadería.
3. Se registran los productos recibidos.
4. Se actualizan las existencias.
5. La operación queda registrada para consultas posteriores.

### Información generada

* Compra
* Detalle de Compra

### Información actualizada

* Stock de productos

---

## PRC-003 – Administración del Inventario

### Objetivo

Mantener actualizada la información correspondiente al stock de productos.

### Actores involucrados

* Personal de Inventario
* Sistema ERP

### Flujo general

1. Se produce un movimiento de inventario.
2. El sistema identifica el tipo de movimiento.
3. Se registra la operación.
4. Se actualiza el stock correspondiente.
5. El movimiento queda disponible para auditoría.

### Información generada

* Movimiento de Stock

### Información actualizada

* Stock de productos

---

## PRC-004 – Administración de Clientes

### Objetivo

Gestionar el ciclo de vida de los clientes de la empresa.

### Actores involucrados

* Personal Administrativo
* Sistema ERP

### Flujo general

1. Se registra un nuevo cliente.
2. Se actualizan sus datos cuando corresponda.
3. El cliente participa en operaciones comerciales.
4. En caso necesario, el cliente puede quedar inactivo sin perder su historial.

### Información generada

* Cliente

### Información actualizada

* Información del cliente

---

## PRC-005 – Administración de Proveedores

### Objetivo

Gestionar la información de los proveedores de la empresa.

### Actores involucrados

* Área de Compras
* Sistema ERP

### Flujo general

1. Se registra un proveedor.
2. Se actualizan sus datos cuando corresponda.
3. El proveedor participa en operaciones de compra.
4. Puede quedar inactivo sin perder el historial de operaciones.

### Información generada

* Proveedor

### Información actualizada

* Información del proveedor

---

## PRC-006 – Administración del Personal

### Objetivo

Administrar la información correspondiente a los empleados de la organización.

### Actores involucrados

* Recursos Humanos
* Sistema ERP

### Flujo general

1. Se incorpora un empleado.
2. Se asigna una sucursal.
3. Se asigna un sector.
4. Se actualizan los datos administrativos cuando sea necesario.
5. Se conserva el historial de participación del empleado en las operaciones del sistema.

### Información generada

* Empleado

### Información actualizada

* Información del empleado

---

## PRC-007 – Administración del Catálogo de Productos

### Objetivo

Gestionar el catálogo de productos comercializados por la empresa.

### Actores involucrados

* Área Comercial
* Inventario
* Sistema ERP

### Flujo general

1. Se registra un nuevo producto.
2. Se asigna una categoría.
3. Se establece el proveedor correspondiente.
4. Se actualizan los datos del producto cuando corresponda.
5. El producto puede mantenerse activo, discontinuarse o permanecer sin stock, conservando siempre su historial.

### Información generada

* Producto

### Información actualizada

* Información del producto

---

# 4. Relación entre procesos

Los procesos definidos no funcionan de manera aislada.

La información generada por uno de ellos puede ser utilizada por otros procesos.

Ejemplos:

* El proceso de Compras incrementa el stock administrado por Inventario.
* El proceso de Ventas reduce el stock administrado por Inventario.
* El proceso de Administración de Clientes provee la información necesaria para registrar Ventas.
* El proceso de Administración de Productos suministra el catálogo utilizado tanto por Compras como por Ventas.
* El proceso de Administración del Personal identifica a los responsables de las operaciones comerciales y administrativas.

---

# 5. Observaciones

Los procesos documentados representan el funcionamiento general de TechStore S.A.

Durante el diseño del Modelo Entidad-Relación podrán incorporarse nuevos procesos o ampliarse los existentes cuando el análisis funcional lo requiera.

Toda modificación deberá quedar documentada para preservar la coherencia entre el análisis funcional y el modelo de datos.

---

# 6. Estado del documento

Versión: 1.0

Estado: **BORRADOR**

Este documento permanecerá en estado BORRADOR hasta la finalización de la Fase 2.1 del análisis funcional.
