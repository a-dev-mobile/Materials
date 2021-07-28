import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materials/controller/home_controller.dart';
import 'package:materials/pages/sub_page.dart';
import 'package:materials/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    c.initFirebase();
    print(c.category.length);
    print('build');
    // CollectionReference users =
    //     FirebaseFirestore.instance
    //     .collection('materials')
    //     .doc('Алюминий, сплав алюминия')
    //     .collection('Алюминиевый антифрикционный сплав');

// CollectionReference users = FirebaseFirestore.instance.collection('users');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text('incre ${c.i}')),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.green,
                  heroTag: "btn1",
                  onPressed: () {
                    c.increment();
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  heroTag: "btn2",
                  onPressed: () {
                    Get.toNamed(Routes.SUB);
                  }),

            ],
          );
        }),
      ),
    );
  }


}
              // FutureBuilder<DocumentSnapshot>(
              //   future: users.doc("АМК").get(),
              //   builder: (BuildContext context,
              //       AsyncSnapshot<DocumentSnapshot> snapshot) {
              //     if (snapshot.hasError) {
              //       return Text("Something went wrong");
              //     }

              //     if (snapshot.hasData && !snapshot.data!.exists) {
              //       return Text("Document does not exist");
              //     }

              //     if (snapshot.connectionState == ConnectionState.done) {
              //       Map<String, dynamic> data =
              //           snapshot.data!.data() as Map<String, dynamic>;
              //       return Text("Full Name: ${data['name']} ${data['use']}");
              //     }

              //     return Text("loading");
              //   },
              // ),