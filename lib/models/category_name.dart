import 'package:hive/hive.dart';

class CategoryName {
  final String category;
  final List<String> name;

  CategoryName({required this.category, required this.name});

  @override
  String toString() {
    return "\ncategory  -  $category | name  - ${name.toString()}";
  }
}

class CategoryNameAdapter extends TypeAdapter<CategoryName> {
  @override
  
  int get typeId => 1;

  @override
  CategoryName read(BinaryReader reader) {
    final category = reader.readString();
    final name = reader.readStringList();
    return CategoryName(category: category, name: name);
  }

  @override
  void write(BinaryWriter writer, CategoryName obj) {
    writer.writeString(obj.category);
    writer.writeStringList(obj.name);
  }
}
