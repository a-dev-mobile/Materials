import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("app_title".tr),
      ),
    );
  }
}
