class MaterialInfo {
  final String category;
  final List<String> name;
  final List<String> type;

  MaterialInfo(
      {required this.category, required this.name, required this.type});

  @override
  String toString() {
    return "\ncategory  -  $category | type  - $type | name  - $name";
  }
}
