class ClassSumsModel {
  final String class_;
  final int id;
  final int sumGradle;
  final int sumSubClass;

  ClassSumsModel(
      {required this.class_,
      required this.id,
      required this.sumGradle,
      required this.sumSubClass});

  factory ClassSumsModel.fromRTDB(Map<String, dynamic> data) {
    return ClassSumsModel(
      class_: data['class'] ?? '',
      id: data['id'] ?? 0,
      sumGradle: data['sumGrade'] ?? 0,
      sumSubClass: data['sumSubClass'] ?? 0,
    );
  }
}
