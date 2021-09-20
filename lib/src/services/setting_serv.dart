import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingService extends GetxService{

    Locale getLocale() {
    String? _locale = GetStorage().read<String>('language');
    if (_locale == null || _locale.isEmpty) {
      _locale = setting.value.mobileLanguage;
    }
    return Get.find<TranslationServ>().fromStringToLocale(_locale!);
  }


}