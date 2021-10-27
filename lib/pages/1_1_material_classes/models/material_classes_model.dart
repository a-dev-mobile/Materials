import 'package:materials/utils/app_const.dart';

class MaterialClassesModel {
  final String nameClass;
  final String idClass;
  final int numberUniqMaterials;
  final int numberUniqSubClass;
@override
String toString() {
  return '$nameClass | $idClass';
}
  MaterialClassesModel(
      {required this.nameClass,
      required this.idClass,
      required this.numberUniqMaterials,
      required this.numberUniqSubClass});

  factory MaterialClassesModel.fromJson(Map<String, dynamic> data) {
    return MaterialClassesModel(
      nameClass: data['name_class'] ??AppConstString.NO_DATA,
      idClass: data['id_class'] ?? AppConstString.NO_DATA,
      numberUniqMaterials: data['number_unique_materials_by_class'] ?? 0,
      numberUniqSubClass: data['number_unique_subclass_by_class'] ?? 0,
    );
  }
}
