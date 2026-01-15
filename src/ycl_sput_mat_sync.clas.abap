CLASS ycl_sput_mat_sync DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS sync_mats
      IMPORTING mat_source TYPE REF TO yif_sput_mat_src
                mat_target TYPE REF TO yif_sput_mat_tar
      EXPORTING error_msg  TYPE bapi_msg.
ENDCLASS.


CLASS ycl_sput_mat_sync IMPLEMENTATION.
  METHOD sync_mats.
    CLEAR error_msg.

    DATA(source_mats) = mat_source->fetch_materials( ).

    LOOP AT source_mats REFERENCE INTO DATA(mat).
      IF mat->matnr IS INITIAL.
        error_msg = 'Have empty material code'.
        RETURN.
      ENDIF.

      IF mat->maktx IS INITIAL.
        error_msg = 'Have empty material text'.
        RETURN.
      ENDIF.
    ENDLOOP.

    mat_target->write_materials( source_mats ).
  ENDMETHOD.
ENDCLASS.
