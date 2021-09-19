part of app;

class FirebaseServices extends GetxService {
  static FirebaseServices get to => Get.find<FirebaseServices>();

  late FirebaseDatabase _firebaseDatabase;
  FirebaseDatabase get database => _firebaseDatabase;

  @override
  void onInit() {

    _firebaseDatabase = FirebaseDatabase.instance;
    super.onInit();
  }

  init() async {
    return this;
  }
}
