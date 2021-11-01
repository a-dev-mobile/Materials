
import 'package:materials/utils/logger.dart';

class ChemModel {
  final String abrv;
  final String name;
  final double percent;
  final String value;

  ChemModel({required this.value, required this.abrv, required this.name, required this.percent});
  

  @override
  String toString() {
    log.i('$abrv | $name | $percent| $value');
    return super.toString();
  }
}
