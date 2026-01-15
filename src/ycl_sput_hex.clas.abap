CLASS ycl_sput_hex DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_next_hex
      IMPORTING current_hex   TYPE char1
      RETURNING VALUE(result) TYPE char1.

  PRIVATE SECTION.
    CONSTANTS hexes TYPE char16 VALUE '0123456789ABCDEF'.
ENDCLASS.


CLASS ycl_sput_hex IMPLEMENTATION.
  METHOD get_next_hex.
    DATA: current_hex_index TYPE i,
          next_hex_index    TYPE i.

    FIND FIRST OCCURRENCE OF current_hex IN hexes MATCH OFFSET current_hex_index.
    CHECK sy-subrc = 0.

    next_hex_index = current_hex_index + 1.

    IF next_hex_index >= strlen( me->hexes ).
      next_hex_index = 0.
    ENDIF.

    result = hexes+next_hex_index(1).
  ENDMETHOD.
ENDCLASS.
