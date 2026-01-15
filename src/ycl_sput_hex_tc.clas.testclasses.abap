*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    TYPES: BEGIN OF hex_io_map,
             input           TYPE char1,
             expected_output TYPE char1,
           END OF hex_io_map,

           hex_io_array TYPE STANDARD TABLE OF hex_io_map WITH EMPTY KEY.

    METHODS test_next_hex FOR TESTING.



ENDCLASS.


CLASS lcl_test IMPLEMENTATION.
  METHOD test_next_hex.
    FINAL(test_cases) = VALUE hex_io_array( ( input = '0' expected_output = '1' )
                                            ( input = '5' expected_output = '6' )
                                            ( input = '9' expected_output = 'A' )
                                            ( input = 'F' expected_output = '0' )
                                            ( input = 'Z' expected_output = '' ) ).

    FINAL(hex) = NEW ycl_sput_hex_tc( ).

    LOOP AT test_cases REFERENCE INTO DATA(test_case).
      FINAL(hex_output) = hex->get_next_hex( test_case->input ).

      cl_abap_unit_assert=>assert_equals( exp = test_case->expected_output
                                          act = hex_output ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
