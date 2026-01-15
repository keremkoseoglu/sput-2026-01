*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS fail_test FOR TESTING.

ENDCLASS.


CLASS lcl_test IMPLEMENTATION.
  METHOD fail_test.
    cl_abap_unit_assert=>assert_equals( exp = 0
                                        act = 1 ).
  ENDMETHOD.
ENDCLASS.
