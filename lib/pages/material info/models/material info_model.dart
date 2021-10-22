class MaterialInfoModel {
  final String nameClass;
  final String nameSubClass;
  final String nameMaterial;
  final String use;
  final String substitute;
  final String otherGrade;
  final String addInfo;

  MaterialInfoModel({
    required this.nameClass,
    required this.nameSubClass,
    required this.nameMaterial,
    required this.use,
    required this.substitute,
    required this.otherGrade,
    required this.addInfo,
  });

  factory MaterialInfoModel.fromRTDB(Map<String, dynamic> data) {
    return MaterialInfoModel(
      nameMaterial: data['grade'] ?? 'no data',
      addInfo: data['addInfo'] ?? 'no data',
      nameClass: data['class'] ?? 'no data',
      nameSubClass: data['subClass'] ?? 'no data',
      otherGrade: data['otherGrade'] ?? 'no data',
      substitute: data['substitute'] ?? 'no data',
      use: data['use'] ?? 'no data',
    );
  }
}
