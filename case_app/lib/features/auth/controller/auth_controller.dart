

import 'package:case_app/core/constants/data_state.dart';
import 'package:case_app/core/constants/storage_constants.dart';
import 'package:case_app/core/storage/local_storage.dart';
import 'package:case_app/features/auth/model/current_user_model.dart';

import 'package:case_app/features/auth/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<DataState> {
  final AuthService _authService;

  AuthController(this._authService) : super(const DataState.initial());

  Future<void> login({required String email, required String password}) async {
    state = const DataState.loading();
    try {
      final token = await _authService
          .login(CurrentUserModel(email: email, password: password));
      final currentUser =
          CurrentUserModel(email: email, password: password, token: token);
      await LocalStorage.setString(
          StorageConstants.currentUser, currentUser.toJson());
      state = DataState.success(data: currentUser);
    } catch (e) {
      state = DataState.error(message: e.toString());
    }
  }

  Future<CurrentUserModel?> tryAutoLogin() async {
    String? currentUserJson =
        await LocalStorage.getString(StorageConstants.currentUser);

    CurrentUserModel? currentUser = currentUserJson != null
        ? CurrentUserModel.fromJson(currentUserJson)
        : null;
    return currentUser;
  }



  @override
  void dispose() {
    super.dispose();
    state = const DataState.initial();
  }
}
