import 'package:case_app/core/constants/api_constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.loginUrl),
        body: <String, dynamic>{'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        debugPrint(response.body.toString());
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}
