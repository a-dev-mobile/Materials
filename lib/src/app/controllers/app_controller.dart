part of app;

initServices() async {
  await Firebase.initializeApp();
  await Get.putAsync(() => FirebaseServices().init());
}

class AppServices extends GetxService {
  static AppServices get to => Get.find<AppServices>();

  // @override
  // void onInit() async {
  //   await Get.putAsync(() => FirebaseServices().init());
  //   super.onInit();
  // }
}
