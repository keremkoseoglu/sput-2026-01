*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS test_expire_success FOR TESTING.
    METHODS test_expire_failure FOR TESTING.

ENDCLASS.


CLASS lcl_test IMPLEMENTATION.
  METHOD test_expire_success.
    TEST-INJECTION buc.
      bapi_returns = VALUE #( ).
    END-TEST-INJECTION.

    NEW ycl_sput_user( 'DUMMY' )->expire( IMPORTING success = DATA(success) ).
    cl_abap_unit_assert=>assert_not_initial( success ).
  ENDMETHOD.

  METHOD test_expire_failure.
    TEST-INJECTION buc.
      bapi_returns = VALUE #( ( type = 'E' ) ).
    END-TEST-INJECTION.

    NEW ycl_sput_user( 'DUMMY' )->expire( IMPORTING success = DATA(success) ).
    cl_abap_unit_assert=>assert_initial( success ).
  ENDMETHOD.
ENDCLASS.
