import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'model/material.dart';
import 'dart:convert' as convert;

import 'model/album.dart';

class ApiClient {

  Future<dynamic> getJson(String www) async {
    var url = Uri.parse(www);
    var response = await http.get(url);
    var body = await http.read(url);
    print('Response status: ${response.statusCode}');
    print('response.body  ${response.body}');
    print('http.read(url) $body');

    return "json";
  }

  Future<List<Album>> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

    print('Response status: ${response.statusCode}');
    print('response.body  ${response.body}');

    if (response.statusCode == 200) {
      return _parseAlbum(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  List<Album> _parseAlbum(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}
