import 'dart:convert';

List<Db> versionModelFromJson(String str) => List<Db>.from(
    json.decode(str).map((x) => Db.fromJson(x)));

class Db {
  final int version;

  Db({required this.version});

  @override
  String toString() => 'version db $version';

  factory Db.fromJson(Map<String, dynamic> json) {
    return Db(version: json['version']);
  }
}
