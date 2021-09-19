library home;

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:materials/src/config/routes/app_pages.dart';

// controller
part '../../controllers/home_controller.dart';

// binding
part '../../bindings/home_binding.dart';

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
          title: Text(AppLocalizations.of(context)!.appTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Container(
            color: Colors.amber,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.setting);
              },
              child: Text('start setting'),
            ),
          ),
        ));
  }
}
