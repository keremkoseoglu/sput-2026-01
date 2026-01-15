*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS valid_mats   FOR TESTING.
    METHODS invalid_mats FOR TESTING.

ENDCLASS.


CLASS lcl_test IMPLEMENTATION.
  METHOD valid_mats.
    FINAL(sync)    = NEW ycl_sput_mat_sync( ).
    FINAL(mat_src) = NEW lcl_mat_src_correct( ).
    FINAL(mat_tar) = NEW lcl_mat_tar_dummy( ).

    sync->sync_mats( EXPORTING mat_source = mat_src
                               mat_target = mat_tar
                     IMPORTING error_msg  = FINAL(error_msg) ).

    cl_abap_unit_assert=>assert_initial( error_msg ).
  ENDMETHOD.

  METHOD invalid_mats.
    FINAL(sync)    = NEW ycl_sput_mat_sync( ).
    FINAL(mat_src) = NEW lcl_mat_src_incorrect( ).
    FINAL(mat_tar) = NEW lcl_mat_tar_dummy( ).

    sync->sync_mats( EXPORTING mat_source = mat_src
                               mat_target = mat_tar
                     IMPORTING error_msg  = FINAL(error_msg) ).

    cl_abap_unit_assert=>assert_not_initial( error_msg ).
  ENDMETHOD.
ENDCLASS.
