*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS test_discount FOR TESTING.

ENDCLASS.


CLASS lcl_test IMPLEMENTATION.
  METHOD test_discount.
    FINAL(calc) = NEW ycl_sput_discount_calc( ).

    " No  discount until 100
    FINAL(discount99) = calc->calculate_discount( pieces     = 99
                                                  unit_price = 1 ).

    cl_abap_unit_assert=>assert_equals( exp = 0
                                        act = discount99 ).

    " %10 discount between 100-499
    FINAL(discount100) = calc->calculate_discount( pieces     = 100
                                                   unit_price = 1 ).

    cl_abap_unit_assert=>assert_equals( exp = 10
                                        act = discount100 ).

    FINAL(discount300) = calc->calculate_discount( pieces     = 300
                                                   unit_price = 1 ).

    cl_abap_unit_assert=>assert_equals( exp = 30
                                        act = discount300 ).

    " %20 discount over 500
    FINAL(discount500) = calc->calculate_discount( pieces     = 500
                                                   unit_price = 1 ).

    cl_abap_unit_assert=>assert_equals( exp = 100
                                        act = discount500 ).

  ENDMETHOD.
ENDCLASS.
