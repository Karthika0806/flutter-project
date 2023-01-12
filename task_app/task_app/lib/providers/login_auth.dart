import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class LoginAuth with ChangeNotifier {
  Future<int> login(String userName, String password) async {
    final url =
        Uri.parse('https://easytouchcloudapibeta.kern-sohn.com/api/v1/login');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'userName': userName,
          'password': password,
        }));

    return response.statusCode;
  }
}
