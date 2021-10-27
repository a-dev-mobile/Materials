class SearchModel {
  final String nameMaterial;
  final String nameSubClass;
  final String nameClass;
  final String use;
  final String idMaterial;

  SearchModel(
      {required this.nameMaterial,
      required this.nameSubClass,
      required this.nameClass,
      required this.use,
      required this.idMaterial});
@override
String toString() {
  return '$idMaterial $nameMaterial | $nameClass $nameSubClass';
}
  factory SearchModel.fromJson(Map<String, dynamic> data) {
    return SearchModel(
      idMaterial: data['id_name_material'],
      nameClass: data['name_class'],
      nameSubClass: data['name_sub_class'],
      nameMaterial: data['name_material'],
      use: data['use'],
    );
  }

/* 
 "name_material": "Мн87Н6",
    "id_name_material": "000001",
    "name_sub_class": "Марганец металлический и марганец азотированный",
    "use": "Применяется для легирования специальных сталей и сплавов, а также в химической промышленности",
    "name_class": "Ферросплав"


 */

}
