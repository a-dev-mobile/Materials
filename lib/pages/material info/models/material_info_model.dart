class MaterialInfoModel {
  final String nameClass;
  final String nameSubClass;
  final String nameMaterial;
  final String use;
  final String substitute;
  final String otherNameMaterial;
  final String addInfo;

  MaterialInfoModel({
    this.nameClass='',
     this.nameSubClass='',
    this.nameMaterial='',
     this.use='',
     this.substitute='',
    this.otherNameMaterial='',
    this.addInfo='',
  });
@override
String toString() {
  return nameClass+' | '+ nameSubClass+' | '+ nameSubClass ;
}
  factory MaterialInfoModel.fromJson(Map<String, dynamic> data) {
    return MaterialInfoModel(
      nameMaterial: data['grade'] ?? 'no data',
      addInfo: data['addInfo'] ?? 'no data',
      nameClass: data['class'] ?? 'no data',
      nameSubClass: data['subClass'] ?? 'no data',
      otherNameMaterial: data['otherGrade'] ?? 'no data',
      substitute: data['substitute'] ?? 'no data',
      use: data['use'] ?? 'no data',
    );
  }
}
