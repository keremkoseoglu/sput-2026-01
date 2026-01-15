*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA hex TYPE REF TO ycl_sput_hex.

    CLASS-METHODS class_setup.

    METHODS setup.

    METHODS test_next_hex       FOR TESTING.

    METHODS test_something_else FOR TESTING.

    METHODS teardown.

    CLASS-METHODS class_teardown.

ENDCLASS.


CLASS lcl_test IMPLEMENTATION.
  METHOD class_setup.
    " Very beginning of the unit test
    hex = NEW #( ).
  ENDMETHOD.

  METHOD setup.
    " Called before each test method
  ENDMETHOD.

  METHOD test_next_hex.
    " 0 -> 1
    FINAL(hex_after_0) = hex->get_next_hex( '0' ).

    cl_abap_unit_assert=>assert_equals( exp = '1'
                                        act = hex_after_0 ).

    " 5 -> 6
    FINAL(hex_after_5) = hex->get_next_hex( '5' ).

    cl_abap_unit_assert=>assert_equals( exp = '6'
                                        act = hex_after_5 ).

    " 9 -> A
    FINAL(hex_after_9) = hex->get_next_hex( '9' ).

    cl_abap_unit_assert=>assert_equals( exp = 'A'
                                        act = hex_after_9 ).

    " F -> 0
    FINAL(hex_after_f) = hex->get_next_hex( 'F' ).

    cl_abap_unit_assert=>assert_equals( exp = '0'
                                        act = hex_after_f ).

    " Z -> SPACE
    FINAL(hex_after_z) = hex->get_next_hex( 'Z' ).

    cl_abap_unit_assert=>assert_equals( exp = space
                                        act = hex_after_z ).
  ENDMETHOD.

  METHOD test_something_else.
    " dummy

    cl_abap_unit_assert=>assert_true( act = 'X' ).

    cl_abap_unit_assert=>assert_differs( exp = 2
                                         act = 1 ).

    TRY.
        " Some abap code

      CATCH cx_sy_itab_line_not_found INTO DATA(error).
        cl_abap_unit_assert=>fail( msg = error->get_text( ) ).
    ENDTRY.

    IF sy-sysid <> 'ZZZ'.
      " cl_abap_unit_assert=>skip( msg = 'Rest of the tests are only for ZZZ' ).

      RETURN.
    ENDIF.
  ENDMETHOD.

  METHOD teardown.
    " Called after each test method
  ENDMETHOD.

  METHOD class_teardown.
    " Cleanup at the end of the test
    CLEAR hex.
  ENDMETHOD.
ENDCLASS.
