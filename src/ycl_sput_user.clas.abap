CLASS ycl_sput_user DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING bname   TYPE xubname.

    METHODS expire      EXPORTING success TYPE abap_bool.

  PRIVATE SECTION.
    DATA bname TYPE xubname.
ENDCLASS.


CLASS ycl_sput_user IMPLEMENTATION.
  METHOD constructor.
    me->bname = bname.
  ENDMETHOD.

  METHOD expire.
    CLEAR success.

    FINAL(logon) = VALUE bapilogond( gltgb = sy-datum ).
    FINAL(logonx) = VALUE bapilogonx( gltgb = abap_true ).
    DATA(bapi_returns) = VALUE bapiret2_tab( ).

    TEST-SEAM buc.
      CALL FUNCTION 'BAPI_USER_CHANGE'
        EXPORTING username   = me->bname
                  logondata  = logon
                  logondatax = logonx
        TABLES    return     = bapi_returns.
    END-TEST-SEAM.

    success = xsdbool( NOT line_exists( bapi_returns[ type = 'E' ] ) ).
  ENDMETHOD.
ENDCLASS.
