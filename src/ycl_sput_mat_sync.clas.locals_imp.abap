*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_mat_src_correct DEFINITION.
  PUBLIC SECTION.
    INTERFACES yif_sput_mat_src.
ENDCLASS.


CLASS lcl_mat_src_correct IMPLEMENTATION.
  METHOD yif_sput_mat_src~fetch_materials.
    result = VALUE #( ( matnr = '123' maktx = 'ABC' )
                      ( matnr = '456' maktx = 'DEF' ) ).
  ENDMETHOD.
ENDCLASS.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

CLASS lcl_mat_src_incorrect DEFINITION.
  PUBLIC SECTION.
    INTERFACES yif_sput_mat_src.
ENDCLASS.


CLASS lcl_mat_src_incorrect IMPLEMENTATION.
  METHOD yif_sput_mat_src~fetch_materials.
    result = VALUE #( ( matnr = '' maktx = 'ABC' )
                      ( matnr = '456' maktx = '' ) ).
  ENDMETHOD.
ENDCLASS.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

CLASS lcl_mat_tar_dummy DEFINITION.
  PUBLIC SECTION.
    INTERFACES yif_sput_mat_tar.
ENDCLASS.


CLASS lcl_mat_tar_dummy IMPLEMENTATION.
  METHOD yif_sput_mat_tar~write_materials.
    RETURN.
  ENDMETHOD.
ENDCLASS.
