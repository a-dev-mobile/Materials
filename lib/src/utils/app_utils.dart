import 'package:get_storage/get_storage.dart';
import 'package:materials/src/constant/const_string.dart';

abstract class AppUtilsGetStorage {
  static Future<void> saveDB(int version) async {
    await GetStorage().write(ConstString.keyVersionLocalDB, version);
  }

  static int getDB() {
    int version = GetStorage().read(ConstString.keyVersionLocalDB) ?? 0;
    return version;
  }
}
