# 👩‍💻 Primer programa en ABAP – Hello World

Este es el primer programa desarrollado en **ABAP**, que imprime en pantalla un **Hello World!** luego de validar la fecha del sistema.

---

## 📌 Descripción

El programa define una variable de fecha (`lv_fecha`) y le asigna el valor de la fecha del sistema (`sy-datum`).  
Si la condición se cumple, muestra en pantalla el mensaje **Hello World!**.  

Este ejemplo es un clásico **"Hello World" en ABAP**, ideal para dar los primeros pasos en el lenguaje.

---

## ⚙️ Funcionamiento

1. **Declaración de variable**  
   - Se declara `lv_fecha` de tipo `datum` (fecha).  

2. **Inicialización**  
   - Se limpia la variable con `CLEAR`.  

3. **Ejecución principal** (`START-OF-SELECTION`)  
   - Se asigna la fecha del sistema a la variable (`MOVE sy-datum TO lv_fecha`).  
   - Si la variable es igual a la fecha del sistema, se imprime `Hello World!`.  

---

## 📷 Ejemplo de salida en SAP

![Hello World en ABAP](https://i.postimg.cc/B64SxLvB/Captura-de-pantalla-2025-09-25-133634.png)
