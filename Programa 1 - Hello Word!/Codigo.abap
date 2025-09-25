REPORT zflor_01.

DATA: lv_fecha TYPE datum.  "Declaro variable

INITIALIZATION.        "Inicializo la variable

  CLEAR: lv_fecha.     "Borro el contenido de la variable

START-OF-SELECTION.        "Indica el comienzo del programa}

  MOVE sy-datum TO lv_fecha.   "sy-datum = Fecha del dia, MOVE = Asigna un valor a una variable, TO = Donde declaro
*Para depurara marco afuera de los numero la linea que quiero , en la interfaz lo marco y apreto F5

  IF lv_fecha EQ sy-datum .    "EQ = Igual

    WRITE:'Hello World!'.  "Los : son para decir que es en una sola linea, puede ser sin :

  ENDIF.     "Finalizo la condicion