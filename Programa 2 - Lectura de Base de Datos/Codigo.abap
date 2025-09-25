REPORT zflor_02.

TABLES: bkpf.

TYPES: BEGIN OF ty_bkpf,   "Declaro los campos que voy a traer para mi tabla interna
         bukrs TYPE bukrs,
         belnr TYPE belnr_d,
         gjahr TYPE gjahr,
       END OF ty_bkpf.

DATA: lt_bkpf TYPE STANDARD TABLE OF ty_bkpf. "Creo la tabla interna

FIELD-SYMBOLS: <fs_bkpf> TYPE ty_bkpf.   "Creo un puntero

INITIALIZATION.

FREE lt_bkpf.

*SELECTION-SCREEN.

SELECT-OPTIONS: s_bukrs FOR bkpf-bukrs OBLIGATORY, "BURKS= Sociedad
                s_belnr FOR bkpf-belnr, "BELNR= Documento
                s_gjahr FOR bkpf-gjahr. "GJAHR= Año Fiscal

START-OF-SELECTION.

  SELECT bukrs
         belnr
         gjahr
    FROM bkpf
    INTO TABLE lt_bkpf            "Digo donde guardar lo que traigo
    WHERE bukrs IN s_bukrs AND
          belnr IN s_belnr AND
          gjahr IN s_gjahr.

IF sy-subrc EQ 0.        "Para volver si vuelve con datos
  LOOP AT lt_bkpf       "LOOP = Recorre la tabla
    ASSIGNING <fs_bkpf>.
    WRITE: / <fs_bkpf>-belnr.
  ENDLOOP.
ENDIF.