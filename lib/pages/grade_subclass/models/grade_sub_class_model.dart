class GradeSubClassModel {
  final String grade;
  final int idGrade;
  final String subClass;

  GradeSubClassModel({
    required this.grade,
    required this.idGrade,
    required this.subClass,
  });

  factory GradeSubClassModel.fromRTDB(Map<String, dynamic> data) {
    return GradeSubClassModel(
      grade: data['grade'] ?? '',
      subClass: data['subClass'] ?? '',
      idGrade: data['idGrade'] ?? 0,
    );
  }
}
