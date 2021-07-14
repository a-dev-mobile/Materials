import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

@JsonSerializable()
class MaterialModel {
  MaterialModel({
    @JsonKey(name: 'add') required this.anyInform,
    required this.category,
    required this.chem,
    required this.name,
    required this.type,
    required this.use,
  });

  String anyInform;
  String category;
  String chem;
  String name;
  String type;
  String use;

  factory MaterialModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialModelToJson(this);

  @override
  String toString() {
    return 'MaterialModel{anyInform: $anyInform, category: $category, chem: $chem, name: $name, type: $type, use: $use}';
  }
}
