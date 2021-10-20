class SumClass {
  final String class_;
  final int id;
  final int sumGradle;
  final int sumSubClass;

  SumClass(
      {required this.class_,
      required this.id,
      required this.sumGradle,
      required this.sumSubClass});

  factory SumClass.fromRTDB(Map<String, dynamic> data) {
    return SumClass(
      class_: data['class'] ?? '',
      id: data['id'] ?? 0,
      sumGradle: data['sumGrade'] ?? 0,
      sumSubClass: data['sumSubClass'] ?? 0,
    );
  }
}
