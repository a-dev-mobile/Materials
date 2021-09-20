import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:materials/main.dart';
import 'package:materials/src/constant/const_string.dart';
import 'package:materials/src/utils/app_utils.dart';

class FirebaseServ extends GetxService {
  late final FirebaseDatabase firebaseDatabase;
  static FirebaseServ get to => Get.find<FirebaseServ>();

  var isUpdateversionDB = false.obs;

  @override
  void onInit() {
    logger.v('FirebaseServices onInit');
    firebaseDatabase = FirebaseDatabase.instance;
    getVersionOnlineDB();
    // _saveToLocalVersionDb();
    super.onInit();
  }

  void getVersionOnlineDB() {
    late StreamSubscription stream;

    try {
      stream = firebaseDatabase
          .reference()
          .child(ConstString.firebaseDatabase)
          .child(ConstString.firebaseVersion)
          .onValue
          .listen((event) async {
        AppUtilsGetStorage.saveDB(event.snapshot.value); 
        stream.cancel();
        // _saveToLocalVersionDb();
      });
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  void onReady() async {
    logger.v('FirebaseServices onReady');
    //  logger.i(await getVersionOnlineDB());
    super.onReady();
  }

  Future<FirebaseServ> init() async {
    logger.v('FirebaseServices init');
    return this;
  }
}
