part of app;

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppServices());
    Get.lazyPut(() => FirebaseServices());
  }
}
