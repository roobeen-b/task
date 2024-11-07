import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class LoginController {
  static final username = TextEditingController();
  static final password = TextEditingController();

  static GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  static const storage = FlutterSecureStorage();

  static Future<void> login() async {
    try {
      Map<String, dynamic> payload = {
        "username": username.text.trim(),
        "password": password.text.trim()
      };

      String jsonBody = jsonEncode(payload);

      final url = Uri.parse("https://assessment.mydvls.com/auth/jwt/create");

      var headers = {
        'Content-Type': 'application/json',
      };

      Response response = await post(url, body: jsonBody, headers: headers);

      if (response.statusCode == 200) {
        final data = await jsonDecode(response.body);

        String accessToken = data["access"];

        await storage.write(key: "access", value: accessToken);
      }
    } catch (e) {
      print(e);
    }
  }
}
