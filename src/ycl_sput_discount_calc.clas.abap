CLASS ycl_sput_discount_calc DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS calculate_discount
      IMPORTING pieces        TYPE i
                unit_price    TYPE i
      RETURNING VALUE(result) TYPE i.
ENDCLASS.


CLASS ycl_sput_discount_calc IMPLEMENTATION.
  METHOD calculate_discount.
    FINAL(total_amount) = pieces * unit_price.

    IF total_amount >= 500.
      result = total_amount / 5.
      RETURN.
    ENDIF.

    IF total_amount >= 100.
      result = total_amount / 10.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
