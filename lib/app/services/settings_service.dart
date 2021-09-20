import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'translation_services.dart';

class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    return this;
  }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
      primaryColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0, foregroundColor: Colors.white),
      brightness: Brightness.light,
    );
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    return ThemeData(
      primaryColor: Color(0xFF252525),
      floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0),
      scaffoldBackgroundColor: Color(0xFF2C2C2C),
      brightness: Brightness.dark,
    );
  }

  Locale getLocale() {
    String? _locale = GetStorage().read<String>('language');
    if (_locale == null || _locale.isEmpty) {
      _locale = 'en_US';
    }
    return Get.find<TranslationService>().fromStringToLocale(_locale);
  }

  ThemeMode getThemeMode() {
    String? _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
      default:
        return ThemeMode.system;
    }
  }
}
