CLASS ycl_sput_order_check DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS validate_order
      IMPORTING !order    TYPE REF TO yif_sput_order
      EXPORTING error_msg TYPE bapi_msg.
ENDCLASS.


CLASS ycl_sput_order_check IMPLEMENTATION.
  METHOD validate_order.
    CLEAR error_msg.

    IF order->get_currency( ) <> 'EUR'.
      error_msg = 'Only EUR orders are accepted'.
      RETURN.
    ENDIF.

    IF order->get_item_count( ) < 2.
      error_msg = 'At least two items needed'.
      RETURN.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
