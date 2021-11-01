import 'package:materials/utils/app_const.dart';

class NamesModel {
  final String idClass;
  final String idMaterial;
  final String idSubClass;
  final String nameMaterial;
  final String nameOtherMaterial;

  NamesModel({
    required this.idMaterial,
    required this.idClass,
    required this.nameMaterial,
    required this.idSubClass,
    required this.nameOtherMaterial,
  });

  factory NamesModel.fromJson(Map<String, dynamic> data) {
    return NamesModel(
      nameMaterial: data['name_material'] ?? AppConstString.NO_DATA,
      idSubClass: data['id_sub_class'] ?? AppConstString.NO_DATA,
      idClass: data['id_class'] ?? AppConstString.NO_DATA,
      nameOtherMaterial: data['name_other_material'] ?? AppConstString.NO_DATA,
      idMaterial:data['id_name_material'] ?? AppConstString.NO_DATA,
 
    );
  }
}
