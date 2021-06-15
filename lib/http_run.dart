import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url = Uri.parse('https://materials-9edc1.firebaseio.com/.json');
  var response = await http.post(url);
  print('Response status: ${response.statusCode}');
  print(await http.read(url));
}
