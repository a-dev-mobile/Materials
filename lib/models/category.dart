import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(jsonDecode(str).map((x) => Category.fromJson(x)));

class Category {
  final String name;
  final String type;

  Category({required this.name, required this.type});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(name: json['category'], type: json['type']);
  }

  @override
  String toString() {
    return "category  -  $name, type  - $type";
  }
}
