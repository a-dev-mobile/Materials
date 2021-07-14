import 'package:json_annotation/json_annotation.dart';

part 'material.g.dart';

@JsonSerializable()
class Material {
  Material({
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

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialToJson(this);
}
