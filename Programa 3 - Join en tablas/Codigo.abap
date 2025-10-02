REPORT zflor_03.

TABLES bkpf.

"Declaracion de las tablas

TYPES: BEGIN OF ty_bkpf,
         bukrs TYPE bukrs,
         belnr TYPE belnr_d,
         gjahr TYPE gjahr,
         waers TYPE waers,        "Es el tipo de moneda
         bldat TYPE bldat,
       END OF ty_bkpf.

TYPES: BEGIN OF ty_bseg,
         bukrs TYPE bukrs,
         belnr TYPE belnr_d,
         gjahr TYPE gjahr,
         buzei TYPE buzei,        "La posicion
         shkzg TYPE shkzg,        "Indica si el importe es positivo o negativo
         wrbtr TYPE wrbtr,        "Importe
       END OF ty_bseg.

TYPES: BEGIN OF ty_resultado,          "Tabla declarada de la union de ambas
         bukrs TYPE bukrs,
         belnr TYPE belnr_d,
         gjahr TYPE gjahr,
         wrbtr TYPE wrbtr,
         waers TYPE waers,
         bldat TYPE bldat,
       END OF ty_resultado.

"Creacion de las tablas

DATA: lt_bkpf      TYPE STANDARD TABLE OF ty_bkpf, "Creo la tabla interna
      lt_bseg      TYPE STANDARD TABLE OF ty_bseg,
      lt_resultado TYPE STANDARD TABLE OF ty_resultado.

DATA ls_resultado TYPE ty_resultado.   "LS= Estructura local

FIELD-SYMBOLS: <fs_bkpf>      TYPE ty_bkpf,
               <fs_bseg>      TYPE ty_bseg,
               <fs_resultado> TYPE ty_resultado.

SELECT-OPTIONS: s_bukrs FOR bkpf-bukrs OBLIGATORY, "BURKS= Sociedad
                s_belnr FOR bkpf-belnr, "BELNR= Documento
                s_gjahr FOR bkpf-gjahr. "GJAHR= Año Fiscal

START-OF-SELECTION.

  SELECT bukrs
          belnr
          gjahr
          waers
          bldat
     FROM bkpf
     INTO TABLE lt_bkpf            "Digo donde guardar lo que traigo
     WHERE bukrs IN s_bukrs AND
           belnr IN s_belnr AND
           gjahr IN s_gjahr.

  IF sy-subrc EQ 0.        "Para volver si vuelve con datos
    SELECT bukrs,
           belnr,
           gjahr,
           buzei,      "La posicion
           shkzg,    "Indica si el importe es positivo o negativo
           wrbtr
      FROM bseg
      INTO TABLE @lt_bseg
      FOR ALL ENTRIES IN @lt_bkpf
       WHERE bukrs EQ @lt_bkpf-bukrs AND
            belnr EQ @lt_bkpf-belnr AND
            gjahr EQ @lt_bkpf-gjahr.

    IF sy-subrc EQ 0.

      LOOP AT lt_bseg
        ASSIGNING <fs_bseg>.

        READ TABLE lt_bkpf
        ASSIGNING <fs_bkpf>
        WITH KEY bukrs = <fs_bseg>-bukrs
                 belnr = <fs_bseg>-belnr
                 gjahr = <fs_bseg>-gjahr.

        IF sy-subrc EQ 0.
          READ TABLE lt_resultado
        ASSIGNING <fs_resultado>
        WITH KEY bukrs = <fs_bseg>-bukrs
                 belnr = <fs_bseg>-belnr
                 gjahr = <fs_bseg>-gjahr.

          IF sy-subrc NE 0 .
            MOVE: <fs_bseg>-belnr TO ls_resultado-belnr,
                  <fs_bkpf>-bldat TO ls_resultado-bldat.
            APPEND ls_resultado TO lt_resultado.
          ENDIF.

          CLEAR: ls_resultado.

          MOVE: <fs_bseg>-bukrs TO ls_resultado-bukrs,
                <fs_bseg>-belnr TO ls_resultado-belnr,
                <fs_bseg>-gjahr TO ls_resultado-gjahr,
                <fs_bseg>-wrbtr TO ls_resultado-wrbtr,
                <fs_bkpf>-waers TO ls_resultado-waers.

          IF <fs_bseg>-shkzg EQ 'S'.
            MULTIPLY ls_resultado-wrbtr BY -1.
          ENDIF.

          APPEND ls_resultado TO lt_resultado.

        ENDIF.

      ENDLOOP.
      LOOP AT lt_resultado
         ASSIGNING <fs_resultado>.
        WRITE: / <fs_resultado>-bukrs ,
                 <fs_resultado>-belnr,
                 <fs_resultado>-bldat,
                 <fs_resultado>-gjahr,
                 <fs_resultado>-wrbtr,
                 <fs_resultado>-waers.
      ENDLOOP.

    ENDIF.
  ENDIF.