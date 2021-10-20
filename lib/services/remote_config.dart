import 'package:get/get.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigServices extends GetxService {
  static RemoteConfigServices get to => Get.find();
  static const keyAppName = 'appName';
  static const defaultAppName = 'materials';
  var appName = ''.obs;

  final RemoteConfig _remoteConfig = RemoteConfig.instance;

  _getMessage() {
    appName.value = _remoteConfig.getString(keyAppName).isNotEmpty
        ? _remoteConfig.getString(keyAppName)
        : defaultAppName;
  }

  Future<void> _initConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 1)));

    _fetchConfig();
  }

  // Fetching, caching, and activating remote config
  void _fetchConfig() async {
    await _remoteConfig.fetchAndActivate();
  }

  Future<RemoteConfigServices> init() async {
    await _initConfig();
    await _getMessage();
   
    return this;

  }
}
