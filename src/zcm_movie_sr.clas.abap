CLASS zcm_movie_sr DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

        CONSTANTS:
      BEGIN OF person_not_exists,
        msgid TYPE symsgid VALUE 'ZMOVIE_MSG_SR',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'PESRONID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF person_not_exists .
    CONSTANTS:
      BEGIN OF release_year_invalid,
        msgid TYPE symsgid VALUE 'ZMOVIE_MSG_SR',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'RELEASEYEAR',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF release_year_invalid .
    CONSTANTS:
      BEGIN OF unauthorized,
        msgid TYPE symsgid VALUE 'ZMOVIE_MSG_SR',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF unauthorized .
    CONSTANTS:
      BEGIN OF duration_invalid,
        msgid TYPE symsgid VALUE 'ZMOVIE_MSG_SR',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'DURATION',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF duration_invalid .
      CONSTANTS:
      BEGIN OF movie_name_empty,
        msgid TYPE symsgid VALUE 'ZMOVIE_MSG_SR',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'MOVIENAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF movie_name_empty .
      CONSTANTS:
      BEGIN OF person_name_empty,
        msgid TYPE symsgid VALUE 'ZMOVIE_MSG_SR',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF person_name_empty .



    METHODS constructor
      IMPORTING
        severity    TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid      LIKE if_t100_message=>t100key OPTIONAL
        previous    TYPE REF TO cx_root OPTIONAL
        personid    TYPE string OPTIONAL
        releaseyear TYPE int2 OPTIONAL
        duration    TYPE int4 OPTIONAL
        moviename    TYPE string OPTIONAL.

    DATA personid TYPE string READ-ONLY.
    DATA releaseyear TYPE int2 READ-ONLY.
    DATA duration TYPE int4 READ-ONLY.
    DATA moviename TYPE string READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_movie_sr IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->personid = |{ personid ALPHA = OUT }|.
    me->releaseyear =  |{ releaseyear NUMBER = RAW }|.
    me->duration = |{ duration NUMBER = RAW }|.
    me->moviename = |{ personid ALPHA = OUT }|.




  ENDMETHOD.
ENDCLASS.
