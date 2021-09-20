library home;

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:materials/main.dart';
import 'package:materials/src/app/app.dart';

import 'package:materials/src/config/routes/app_pages.dart';

// controller
part '../../controllers/home_controller.dart';

// binding
part '../../bindings/home_binding.dart';

// component

// model

late HomeController c = HomeController();
late FirebaseServices fireBaseServices = FirebaseServices();

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Get.toNamed(Routes.setting);
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
