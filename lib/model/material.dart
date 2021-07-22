import 'dart:convert';

List<MaterialMod> materialFromJson(String str) => List<MaterialMod>.from(
    json.decode(str).map((x) => MaterialMod.fromJson(x)));

class MaterialMod {
  MaterialMod({
    required this.id,
    required this.category,
    required this.type,
    required this.name,
    required this.extra,
    required this.use,
    required this.replace,
    required this.chem,
  });

  final int id;
  final String type;
  final String category;
  final String name;
  final String extra;
  final String use;
  final String replace;
  final String chem;

  factory MaterialMod.fromJson(Map<String, dynamic> json) => MaterialMod(
        id: json["id"],
        category: json["category"],
        type: json["type"],
        name: json["name"],
        extra: json["extra"],
        use: json["use"],
        replace: json["replace"],
        chem: json["chem"],
      );
}
