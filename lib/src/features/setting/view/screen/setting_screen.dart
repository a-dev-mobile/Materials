library setting;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// controller
part '../../controllers/setting_controller.dart';
// binding
part '../../binndings/setting_binding.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
