class ClassSumsModel {
  final String class_;
  final int idClass;
  final int sumGradle;
  final int sumSubClass;

  ClassSumsModel(
      {required this.class_,
      required this.idClass,
      required this.sumGradle,
      required this.sumSubClass});

  factory ClassSumsModel.fromRTDB(Map<String, dynamic> data) {
    return ClassSumsModel(
      class_: data['class'] ?? '',
      idClass: data['idClass'] ?? 0,
      sumGradle: data['sumGrade'] ?? 0,
      sumSubClass: data['sumSubClass'] ?? 0,
    );
  }
}
