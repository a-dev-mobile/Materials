class SearchModel {
  final String nameMaterial;
  final String nameSubClass;


  final String idMaterial;

  SearchModel(
      {required this.nameMaterial,
      required this.nameSubClass,


      required this.idMaterial});
@override
String toString() {
  return '$idMaterial $nameMaterial | $nameSubClass';
}
  factory SearchModel.fromJson(Map<String, dynamic> data) {
    return SearchModel(
      idMaterial: data['id_name_material'],
      nameSubClass: data['name_sub_class'],
      nameMaterial: data['name_material'],
 
    );
  }



}
