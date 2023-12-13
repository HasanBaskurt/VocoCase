import 'package:case_app/feature/home/model/user_model.dart';
import 'package:case_app/feature/home/service/home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<List<UserModel>> {
  final HomeService _homeService;

  HomeController(this._homeService) : super([]);
  bool loading = true;

  Future<void> getUserList(String page) async {
    loading = true;
    try {
      final response = await _homeService.getUserList(
        page,
      );

      state = response;
    } catch (e) {
      state = [];
    }
    loading = false;
  }
}
