import 'dart:convert';

import 'package:case_app/feature/home/model/user_model.dart';
import 'package:http/http.dart';

class HomeService {
  Future<List<UserModel>> getUserList(String page) async {
    var url = Uri.parse('https://reqres.in/api/unknown');
    try {
      Response response = await get(url, headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
      });

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return result.map(((e) => UserModel.fromJson(e))).toList();
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}
