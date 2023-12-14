import 'dart:convert';

import 'package:case_app/core/constants/api_constanst.dart';
import 'package:case_app/features/auth/model/current_user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<String> login(CurrentUserModel currentUser) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.loginUrl),
        body: <String, dynamic>{
          'email': currentUser.email,
          'password': currentUser.password
        },
      );

      if (response.statusCode == 200) {
        final String result = jsonDecode(response.body)['token'];
        return result;
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
