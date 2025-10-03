REPORT zflor_04.

INCLUDE zflor_04_d.      "D: Declaracion
INCLUDE zflor_04_s.      "S: Select, es de referencia
INCLUDE zflor_04_f.

START-OF-SELECTION.

  PERFORM f_leer_tablas.
  IF sy-subrc EQ 0.
    PERFORM f_procesar_datos.
    PERFORM f_mostrar_datos.
  ENDIF.