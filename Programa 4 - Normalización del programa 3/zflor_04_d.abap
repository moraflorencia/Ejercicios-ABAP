TABLES bkpf.

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