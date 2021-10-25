import 'package:get/get.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppRemoteServ extends GetxService {
  static AppRemoteServ get to => Get.find();
  final RemoteConfig _remoteConfig = RemoteConfig.instance;

  static const _keyWelcome = 'welcome';
  static const _defaultWelcome = 'welcome';

  static const _keyAuthor = 'author';
  static const _defaultAuthor = 'Dmitriy';

  static const _keyIsDark = 'isDarkTheme';
  static const _defaultIsDark = false;

  String get author => _getStringData(_keyAuthor, _defaultAuthor);
  String get welcome => _getStringData(_keyWelcome, _defaultWelcome);
  bool get isDark => _getBoolData(_keyIsDark);

  void setDefaults() {
    _remoteConfig.setDefaults(<String, dynamic>{
      _keyWelcome: _defaultWelcome,
      _keyAuthor: _defaultAuthor,
      _keyIsDark: _defaultIsDark,
    });
  }

  String _getStringData(String key, String defaultValue) {
    return _remoteConfig.getString(key).isNotEmpty
        ? _remoteConfig.getString(key)
        : defaultValue;
  }

  bool _getBoolData(String key) {
    return _remoteConfig.getBool(key);
  }

  Future<void> _initConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      //TODO change
      minimumFetchInterval: const Duration(seconds: 10),
    ));

    await _remoteConfig.fetchAndActivate();
  }

  @override
  void onInit() {
    _initConfig();
    setDefaults();

    super.onInit();
  }
}
