class NameMaterialModel {
  final String grade;
  final int idGrade;
  final String subClass;

  NameMaterialModel({
    required this.grade,
    required this.idGrade,
    required this.subClass,
  });

  factory NameMaterialModel.fromRTDB(Map<String, dynamic> data) {
    return NameMaterialModel(
      grade: data['grade'] ?? '',
      subClass: data['subClass'] ?? '',
      idGrade: data['idGrade'] ?? 0,
    );
  }
}
