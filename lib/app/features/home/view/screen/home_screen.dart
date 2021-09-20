

import 'package:get/get.dart';
import 'package:flutter/material.dart';





// component

// model




class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( "Home".tr),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Get.toNamed(Routes.SETTING);
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // fireBaseServices.updateOnlineVersionDB(2222 / 258);
                },
                child: Text('set version db'),
              ),
              ElevatedButton(
                onPressed: () async {
              //  fireBaseServices.updateDbLocal();
                },
                child: Text('update DB'),
              ),
              ElevatedButton(
                onPressed: () async {
            
                },
                child: Text('get version local'),
              ),
                ElevatedButton(
                onPressed: () async {
             
                },
                child: Text('get perfom version online'),
              ),
            ],
          ),
        ));
  }
}
