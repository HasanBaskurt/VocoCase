import 'dart:convert';

import 'package:case_app/core/constants/api_constanst.dart';
import 'package:case_app/feature/home/model/user_model.dart';
import 'package:http/http.dart';

class HomeService {
  Future<List<UserModel>> getUserList(String page) async {
    var url = Uri.parse(ApiConstants.getUserListUrl + page);
    try {
      Response response = await get(url);

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return result.map(((e) => UserModel.fromMap(e))).toList();
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      throw Exception("Is the device online?");
    }
  }
}
