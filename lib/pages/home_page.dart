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
    // final c = Get.put(HomeController());
    // c.initFirebase();
    print('build');
    // CollectionReference users =
    //     FirebaseFirestore.instance
    //     .collection('materials')
    //     .doc('Алюминий, сплав алюминия')
    //     .collection('Алюминиевый антифрикционный сплав');

// CollectionReference users = FirebaseFirestore.instance.collection('users');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('incre')),
        body: LoadWidget(),
      ),
    );
  }
}

class LoadWidget extends StatelessWidget {
  const LoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference materials = FirebaseFirestore.instance.collection('c1');

    return FutureBuilder <DocumentSnapshot>(
        future:getposts(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong ${snapshot.data.toString()}");
            return Text("Something went wrong");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            print("Document does not exist ${snapshot.data.toString()}");
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
             String datas = '';
            // Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
            // String datas = data['name'];


     var docs = snapshot.docs.map(doc => doc.data());
            print('ConnectionState.done ${snapshot.data.toString()}');
            return Text('name ${datas}');
          }
          print('LOAD');
          return Text('LOAD');
        });
  }



 Future getposts() async{
await Firebase.initializeApp();
var firestore = FirebaseFirestore.instance;
  QuerySnapshot qn = await firestore.collection("c1/d1").get();
  return qn.docs;}
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
