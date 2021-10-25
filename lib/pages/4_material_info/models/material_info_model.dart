import 'package:materials/utils/app_const.dart';

class MaterialInfoModel {
  final String addInfo;
  final String idClass;
  final String idMaterial;
  final String idSubClass;
  final String nameClass;
  final String nameMaterial;
  final String nameOtherMaterial;
  final String nameSubClass;
  final String replaceMaterial;
  final String use;

  MaterialInfoModel({
    required this.addInfo,
    required this.nameClass,
    required this.nameSubClass,
    required this.replaceMaterial,
    required this.use,
    required this.idMaterial,
    required this.idClass,
    required this.nameMaterial,
    required this.idSubClass,
    required this.nameOtherMaterial,
  });

  factory MaterialInfoModel.fromJson(Map<String, dynamic> data) {
    return MaterialInfoModel(
      addInfo: data['add_info'] ?? AppConstString.NO_DATA,
      idClass: data['id_class'] ?? AppConstString.NO_DATA,
      idMaterial: data['id_name_material'] ?? AppConstString.NO_DATA,
      idSubClass: data['id_sub_class:'] ?? AppConstString.NO_DATA,
      nameClass: data['name_class'] ?? AppConstString.NO_DATA,
      nameMaterial: data['name_material'] ?? AppConstString.NO_DATA,
      nameOtherMaterial: data['name_other_material'] ?? AppConstString.NO_DATA,
      nameSubClass: data['name_sub_class:'] ?? AppConstString.NO_DATA,
      replaceMaterial: data['replace_material'] ?? AppConstString.NO_DATA,
      use: data['use'] ?? AppConstString.NO_DATA,
    );
  }
}
