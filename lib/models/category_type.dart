import 'package:hive/hive.dart';

class CategoryType {
  final String category;
  final List<String> type;

  CategoryType({required this.category, required this.type});

  @override
  String toString() {
    return "\ncategory  -  $category | type  - ${type.toString()}";
  }
}

class CategoryTypeAdapter extends TypeAdapter<CategoryType> {
  @override
  int get typeId => 0;

  @override
  CategoryType read(BinaryReader reader) {
    final category = reader.readString();
    final type = reader.readStringList();
    return CategoryType(category: category, type: type);
  }

  @override
  void write(BinaryWriter writer, CategoryType obj) {
    writer.writeString(obj.category);
    writer.writeStringList(obj.type);
  }
}
