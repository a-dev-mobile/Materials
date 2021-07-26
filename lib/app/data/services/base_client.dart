import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:materials/app/controller/base_controller.dart';


import 'app_exception.dart';

class BaseClient{
  static const int timeOutDuration = 20;

  //GET
  Future<dynamic> get(String baseUrl, String api) async {
    var url = Uri.parse(baseUrl + api);


    try {
      var response =
          await http.get(url).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());

      case 500:
      default:
        throw FetchDataException(
            'Error server with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }


}
