INTERFACE yif_sput_mat_tar
  PUBLIC .

  METHODS write_materials IMPORTING materials TYPE yif_sput_mat_src=>material_array.

ENDINTERFACE.
