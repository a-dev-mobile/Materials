import 'package:materials/utils/app_const.dart';

class MaterialSubClassesModel {
  final String nameSubClass;
  final String idSubClass;
  final String idClass;
  final int numberUniqMaterial;

  MaterialSubClassesModel({
    required this.idClass,
    required this.nameSubClass,
    required this.idSubClass,
    required this.numberUniqMaterial,
  });

  factory MaterialSubClassesModel.fromJson(Map<String, dynamic> data) {
    return MaterialSubClassesModel(
      nameSubClass: data['name_sub_class'] ?? AppConstString.NO_DATA,
      numberUniqMaterial:
          data['number_unique_materials_by_subclass'] ?? 0,
      idSubClass: data['id_sub_class'] ??  AppConstString.NO_DATA,
      idClass: data['id_class'] ??  AppConstString.NO_DATA,
    );
  }
}
