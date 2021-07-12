import 'dart:io';

import 'package:path_provider/path_provider.dart';

class TextStorage {
  Future<File> patchFile(String nameFile) async {
    Directory directory = await getApplicationDocumentsDirectory();
    print('directory $directory');

    return File('${directory.path}/$nameFile');
  }

  Future<String> readText(String nameFile) async {
    try {
      final file = await patchFile(nameFile);

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "null";
    }
  }

  Future<File> writeText(String text, String nameFile) async {
    final file = await patchFile(nameFile);

    print('save to ${file.path}');

    // Write the file
    return file.writeAsString(text);
  }
}
