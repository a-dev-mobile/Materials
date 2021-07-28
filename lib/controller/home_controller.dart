import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var i = 0.obs;

  void increment() {
    i = i + 2;
    print(i);
  }

  List<dynamic> category = [].obs;

  Future<void> initFirebase() async {
    print('start to category');
    CollectionReference materialsRef =
        await FirebaseFirestore.instance.collection('materials');

    print(materialsRef.toString());

    await materialsRef.get().then((value) {
      for (var element in value.docs) {
        category.add(element);
        print(element.toString());
      }
    });
  }
}
