INTERFACE yif_sput_mat_src
  PUBLIC .

  TYPES: BEGIN OF material_map,
           matnr TYPE matnr,
           maktx TYPE maktx,
         END OF material_map,

         material_array TYPE STANDARD TABLE OF material_map WITH KEY matnr.

  METHODS fetch_materials RETURNING VALUE(result) TYPE material_array.


ENDINTERFACE.
