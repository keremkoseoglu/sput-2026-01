INTERFACE yif_sput_order
  PUBLIC .

  METHODS get_currency   RETURNING VALUE(result) TYPE waers.

  METHODS get_item_count RETURNING VALUE(result) TYPE i.


ENDINTERFACE.
