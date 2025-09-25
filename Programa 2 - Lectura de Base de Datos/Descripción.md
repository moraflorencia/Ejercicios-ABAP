# 📊 Programa 2 – Lectura de Base de Datos en ABAP

Este proyecto contiene un **reporte en ABAP** que permite consultar documentos contables desde la tabla estándar **BKPF** de SAP.  
El objetivo es mostrar cómo realizar una lectura simple de base de datos con filtros definidos en la pantalla de selección.

---

## ⚙️ Funcionalidad

1. **Pantalla de selección**  
   El programa solicita parámetros al usuario para ejecutar la consulta:  
   - **Sociedad (BUKRS)** → obligatorio.  
   - **Número de documento (BELNR)** → opcional.  
   - **Año fiscal (GJAHR)** → opcional.  

   ![Pantalla de selección](https://i.postimg.cc/qRGwgnPV/Captura-de-pantalla-2025-09-25-132037.png)

2. **Ejecución de la consulta**  
   Se realiza un `SELECT` sobre la tabla **BKPF** trayendo los campos:  
   - Sociedad (`BUKRS`)  
   - Número de documento (`BELNR`)  
   - Año fiscal (`GJAHR`)  

3. **Salida de resultados**  
   Si existen registros, se listan los **números de documento contable** en la salida estándar (`WRITE`).  

   ![Salida de resultados](https://i.postimg.cc/bYBbg3HV/Captura-de-pantalla-2025-09-25-132055.png)


4. **Textos de selección personalizados**  
   Los labels de la pantalla fueron modificados para mayor claridad (N° Documento, Sociedad, Año Fiscal).  

   ![Textos de selección](https://i.postimg.cc/GpLHdyxs/Captura-de-pantalla-2025-09-25-132152.png)
