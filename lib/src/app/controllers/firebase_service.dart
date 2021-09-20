part of app;

class FirebaseServices extends GetxService {
  static FirebaseServices get to => Get.find<FirebaseServices>();
  late FirebaseDatabase firebaseDatabase;

  // void updateOnlineVersionDB(double version) async {
  //   try {
  //     await databaseRef.update({ConstRefFireBase.version: version});
  //   } catch (e) {
  //     logger.e('error $e');
  //   }
  // }

  Future<int> getVersionOnlineDB() async {
    late StreamSubscription stream;
    int version = 0;
    try {
      stream = firebaseDatabase
          .reference()
          .child(ConstRefFireBase.database)
          .child(ConstRefFireBase.version)
          .onValue
          .listen((event) async {
        version = await event.snapshot.value;

        stream.cancel();
        // _saveToLocalVersionDb();
      });
    } catch (e) {
      logger.e(e);
    }

    return version;
  }

  @override
  void onReady() {
    super.onReady();
    print('onReady');
  }

  @override
  void onInit() {
    logger.v('FirebaseServices onInit');
    firebaseDatabase = FirebaseDatabase.instance;

    // getVersionOnlineDB();
    // _saveToLocalVersionDb();
    super.onInit();
  }

  init() async {
    logger.v('FirebaseServices init');
    return this;
  }
}
