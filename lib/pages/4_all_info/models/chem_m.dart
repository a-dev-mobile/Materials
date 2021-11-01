import 'package:get/get.dart';
import 'package:materials/utils/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChemModel {
  final String abrv;
  final String name;
  final double percent;
  final String value;

  ChemModel(
      {required this.value,
      required this.abrv,
      required this.name,
      required this.percent});

  @override
  String toString() {
    log.i('$abrv | $name | $percent| $value');
    return super.toString();
  }

  String getTranslate(String abrv) {
    switch (abrv) {
      case 'Mn':
        return AppLocalizations.of(Get.context!)!.mn;
    }
    return 'no data';
  }
}
