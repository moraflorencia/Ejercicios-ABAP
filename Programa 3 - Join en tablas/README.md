# 📊 Reporte ABAP: Unión de BKPF y BSEG

Este programa en ABAP (`zflor_03`) tiene como objetivo **unir información de cabecera de documentos contables (BKPF)** con sus **posiciones (BSEG)** para obtener un resultado consolidado y mostrarlo en un listado simple.

---

## 📝 Descripción del Programa

El reporte permite consultar documentos contables filtrando por:

- **Sociedad (BUKRS)**
- **Número de documento (BELNR)**
- **Ejercicio fiscal (GJAHR)**

Una vez ingresados los parámetros, el programa:
1. **Obtiene de BKPF** la información de cabecera del documento (sociedad, número de documento, año fiscal, moneda, fecha del documento).
2. **Obtiene de BSEG** las posiciones del documento (posición, importe, indicador de signo).
3. **Une los resultados** para armar una tabla interna consolidada (`lt_resultado`).
4. Ajusta el signo de los importes según el campo **SHKZG**:
   - `S` → se multiplica por `-1`.
   - `H` → queda positivo.
5. **Muestra un listado** con:
   - Sociedad (BUKRS)  
   - Número de documento (BELNR)  
   - Fecha del documento (BLDAT)  
   - Año fiscal (GJAHR)  
   - Importe (WRBTR, con signo ajustado)  
   - Moneda (WAERS)

---

## 🏗️ Estructura Técnica

- **Tablas SAP utilizadas**:
  - `BKPF` → Cabecera de documentos contables.
  - `BSEG` → Posiciones de documentos contables.
  
- **Tipos de datos definidos**:
  - `ty_bkpf`: Estructura para cabeceras.
  - `ty_bseg`: Estructura para posiciones.
  - `ty_resultado`: Estructura consolidada final.

- **Tablas internas**:
  - `lt_bkpf`: Cabeceras.
  - `lt_bseg`: Posiciones.
  - `lt_resultado`: Resultado final.

- **Campos claves** para la unión: `BUKRS`, `BELNR`, `GJAHR`.

---

## ⚙️ Lógica Principal

1. Selección de datos en `BKPF` según filtros.
2. Selección de datos en `BSEG` con `FOR ALL ENTRIES` para traer solo posiciones relacionadas.
3. Loop de unión entre `lt_bkpf` y `lt_bseg`.
4. Construcción de `lt_resultado` con importes ajustados por el signo.
5. Presentación del resultado en un `WRITE`.

## 📌 Ejemplo de salida

