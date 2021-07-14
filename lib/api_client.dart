import 'dart:convert';
import 'dart:io';

import 'material.dart';

class ApiClient {
  final client = HttpClient();
  final String _url;

  ApiClient(this._url);

  Future<List<MaterialModel>> getMaterial() async {
// Uri(scheme: 'https',host: 'materials-9edc1.firebaseio.com',path:'materials.json' )
    Uri url = Uri.parse(_url);

    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;
    print(jsonString);
    final material = json.map((dynamic e) =>
        MaterialModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return material;
  }
}
