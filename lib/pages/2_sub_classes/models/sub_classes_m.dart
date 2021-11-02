import 'package:materials/utils/app_const.dart';

class SubClassesModel {
  final String nameSubClass;
  final String idSubClass;
  final String idClass;
  final int numberUniqMaterial;

  SubClassesModel({
    required this.idClass,
    required this.nameSubClass,
    required this.idSubClass,
    required this.numberUniqMaterial,
  });

  factory SubClassesModel.fromJson(Map<String, dynamic> data) {
    return SubClassesModel(
      nameSubClass: data['name_sub_class'] ?? AppConstString.NO_DATA,
      numberUniqMaterial:
          data['number_unique_materials_by_subclass'] ?? 0,
      idSubClass: data['id_sub_class'] ??  AppConstString.NO_DATA,
      idClass: data['id_class'] ??  AppConstString.NO_DATA,
    );
  }
}
