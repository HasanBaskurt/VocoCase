import 'package:case_app/core/constants/data_state.dart';
import 'package:case_app/feature/home/model/user_model.dart';
import 'package:case_app/feature/home/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<DataState> {
  HomeController(this._homeService) : super(const DataState.loading());

  final HomeService _homeService;

  Future<void> getUserList(String page) async {
    try {
      List<UserModel> userList = await _homeService.getUserList(
        page,
      );

      state = DataState.success(data: userList);
    } catch (e) {
      state = DataState.error(message: e.toString());
      debugPrint(e.toString());
    }
  }
}
