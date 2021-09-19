part of app;

final fireDataBase = FirebaseServices.to.database;
final versionRef = fireDataBase.reference().child(ConstRefFireBase.database);

class FirebaseServices extends GetxService {
  static FirebaseServices get to => Get.find<FirebaseServices>();

  late StreamSubscription stream;
  late FirebaseDatabase _database;

  FirebaseDatabase get database => _database;

  void updateOnlineVersionDB(double version) async {
    try {
      await versionRef.update({ConstRefFireBase.version: version * 5});
    } catch (e) {
      logger.e('error $e');
    }
  }

  double getVersionOnlineDB() {
    double version = 0;
    try {
      stream = versionRef
          .child(ConstRefFireBase.version)
          .onValue
          .listen((event) async {
        version = event.snapshot.value;

        logger.i(version);
        SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setDouble(ConstSharepPref.version, version);
        stream.cancel();
        logger.w('sharedPreferences.setVersion = $version');
      });
    } catch (e) {
      logger.e(e);
    }
    return version;
  }

  Future<double> getVersionLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getDouble(ConstSharepPref.version) ?? 0;
    logger.w('sharedPreferences.getVersion = $value');
    return value;
  }

  @override
  Future<void> onInit() async {
    logger.v('onInit');
    _database = FirebaseDatabase.instance;

    super.onInit();
  }

  init() async {
    logger.v('init');
    return this;
  }
}
