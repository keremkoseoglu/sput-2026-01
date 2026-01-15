*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS test_valid_order   FOR TESTING.

    METHODS test_invalid_order FOR TESTING.

ENDCLASS.


CLASS lcl_test IMPLEMENTATION.
  METHOD test_valid_order.
    DATA order TYPE REF TO yif_sput_order.

    order ?= cl_abap_testdouble=>create( 'YIF_SPUT_ORDER' ).

    cl_abap_testdouble=>configure_call( order )->returning( 'EUR' ).
    order->get_currency( ). " Now this will always return EUR

    cl_abap_testdouble=>configure_call( order )->returning( '3' ).
    order->get_item_count( ). " Now this will always return 3

    NEW ycl_sput_order_check( )->validate_order( EXPORTING order     = order
                                                 IMPORTING error_msg = FINAL(error_msg) ).

    cl_abap_unit_assert=>assert_initial( error_msg ).
  ENDMETHOD.

  METHOD test_invalid_order.
    DATA order TYPE REF TO yif_sput_order.

    order ?= cl_abap_testdouble=>create( 'YIF_SPUT_ORDER' ).

    cl_abap_testdouble=>configure_call( order )->returning( 'USD' ).
    order->get_currency( ).

    cl_abap_testdouble=>configure_call( order )->returning( '1' ).
    order->get_item_count( ).

    NEW ycl_sput_order_check( )->validate_order( EXPORTING order     = order
                                                 IMPORTING error_msg = FINAL(error_msg) ).

    cl_abap_unit_assert=>assert_not_initial( error_msg ).

  ENDMETHOD.
ENDCLASS.
