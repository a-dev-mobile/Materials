class NameMaterialModel {
  final String nameMaterial;
  final int idNameMaterial;
  final String subClass;

  NameMaterialModel({
    required this.nameMaterial,
    required this.idNameMaterial,
    required this.subClass,
  });

  factory NameMaterialModel.fromRTDB(Map<String, dynamic> data) {
    return NameMaterialModel(
      nameMaterial: data['grade'] ?? 'no data',
      subClass: data['subClass'] ?? 'no data',
      idNameMaterial: data['idGrade'] ?? 0,
    );
  }
}
