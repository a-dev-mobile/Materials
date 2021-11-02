import 'package:materials/utils/logger.dart';

class ChangeLogModel {
  final String version;
  final String date;
  final String changes;

  ChangeLogModel({
    required this.version,
    required this.date,
    required this.changes,
  });

  @override
  String toString() {
    return '$version | $date | $changes';
  }

  factory ChangeLogModel.fromJson(Map<String, dynamic> data) {
    return ChangeLogModel(
      version: data['version']??"",
      date: data['date']??"",
      changes: data['changes']??"",
    );
  }
}
