import 'package:get/get.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:materials/utils/logger.dart';

class RemoteConfigController extends GetxController {
  static RemoteConfigController get to => Get.find();
  final RemoteConfig _remoteConfig = RemoteConfig.instance;

  static const keyDbVersion = 'db_version';
  static const defaultDbVersion = 1;

  var versionDB = defaultDbVersion;

  _setVersionDB() {
    versionDB = _remoteConfig.getInt(keyDbVersion);
  }

  Future<void> _initConfig() async {

    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 1)));     //TODO change

    _fetchConfig();
  }

  @override
  void onInit() {
    _initConfig();
    setDefaults();
    _setVersionDB();
    super.onInit();
  }

  void setDefaults() {
    _remoteConfig.setDefaults(<String, dynamic>{
      keyDbVersion: defaultDbVersion,
    });
  }

  // Fetching, caching, and activating remote config
  void _fetchConfig() async {
    bool updated = await _remoteConfig.fetchAndActivate();
    if (updated) {
      logger.w('update remote');
        
    } else {
      // the config values were previously updated.
      logger.w('not update remote');
    }
  }
}
