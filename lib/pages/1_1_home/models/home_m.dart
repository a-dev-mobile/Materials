import 'package:materials/utils/app_const.dart';

class HomeModel {
  final String nameClass;
  final String idMaterial;


  HomeModel(
      {required this.nameClass,
      required this.idMaterial,
     });

  factory HomeModel.fromJson(Map<String, dynamic> data) {
    return HomeModel(
      nameClass: data['class'] ??AppConstString.NO_DATA,
      idMaterial: data['id_material'] ?? AppConstString.NO_DATA,
        );
  }
}
