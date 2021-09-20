import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app/app.dart';

import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
    

  runApp(MyApp());
}
