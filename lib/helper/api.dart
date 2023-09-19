import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.get(Uri.parse(url), headers: header);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code : ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> header = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code : ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }

  Future<Map<String, dynamic>> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> header = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    print("body = $body");
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: header);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code : ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }
}
