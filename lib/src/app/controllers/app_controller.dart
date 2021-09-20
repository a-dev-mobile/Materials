part of app;

initServices() async {
  await Firebase.initializeApp();
  await Get.putAsync(() => FirebaseServices().init());
  await Get.putAsync(() => AppServices().init());
}

late FirebaseServices firebaseServices = Get.find();

class AppServices extends GetxService {
  static AppServices get to => Get.find<AppServices>();

  static Future<void> initTheme() async {
    print('initTheme');
  }

  init() async {
    print('AppServices init');
    initTheme();
    return this;
  }

  var version = 0.obs;

  void _saveToLocalVersionDb() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(ConstSharepPref.version, version.value);
    logger.w('sharedPreferences.setVersion = ${version.value}');
  }

  Future<double> _getVersionOflinelDb() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getDouble(ConstSharepPref.version) ?? 0.0;
    logger.w('sharedPreferences.getVersion = $value');
    return value;
  }

  updateDbLocal() async {
    double versionOfline = await _getVersionOflinelDb();

    if (versionOfline == version.value) {
      logger.v('not update DB $versionOfline == ${version.value}');
    } else {
      logger.v('update DB $versionOfline == ${version.value}');
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    int i = await firebaseServices.getVersionOnlineDB();

    print(i);
    print(i);
    print(i);
    print(i);
    super.onReady();
  }
}
