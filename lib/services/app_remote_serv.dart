import 'package:get/get.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:materials/utils/app_const.dart';
import 'package:materials/utils/local_torage.dart';
import 'package:materials/utils/logger.dart';

class AppRemoteServ extends GetxService {
  static AppRemoteServ get to => Get.find();
  final RemoteConfig _remoteConfig = RemoteConfig.instance;

  var isUpdateDB = false;

  static const _defaultVersionDB = 1;

  static const _keyVersionDB = 'version_db';
  static const _keyIsDark = 'isDarkTheme';
  static const _defaultIsDark = false;

  static const _keyChangeLog = 'change_log';


  int get _versionDB => _getIntData(_keyVersionDB, _defaultVersionDB);
  bool get isDark => _getBoolData(_keyIsDark);
  String get changeLog => _getJsonData(_keyChangeLog, "");

  void setDefaults() {
    _remoteConfig.setDefaults(<String, dynamic>{
      _keyVersionDB: _defaultVersionDB,
      _keyIsDark: _defaultIsDark,
      _keyChangeLog: "",
    });
  }

  String _getStringData(String key, String defaultValue) {
    return _remoteConfig.getString(key).isNotEmpty
        ? _remoteConfig.getString(key)
        : defaultValue;
  }

  int _getIntData(String key, int defaultValue) {
    return _remoteConfig.getInt(key);
  }

  _getJsonData(String key, String defaultValue) {
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
  void onInit() async {
    logger.d('onInit AppRemoteServ');

    await _initConfig();
    setDefaults();

    int oldVersionDB =
        await LocalStorage().getItemInt(AppConstString.keyVersionDB);

    if (_versionDB != oldVersionDB) {
      LocalStorage().setItemBool(AppConstString.keyIsUpdateDB, true);
      log.w('isUpdateDB.value = true;');
    } else {
      LocalStorage().setItemBool(AppConstString.keyIsUpdateDB, false);
     log.w('isUpdateDB.value = false;');
    }

    super.onInit();
  }
}
