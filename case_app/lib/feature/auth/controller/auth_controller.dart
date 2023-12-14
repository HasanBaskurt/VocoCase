import 'package:case_app/core/constants/data_state.dart';
import 'package:case_app/core/constants/storage_constants.dart';
import 'package:case_app/core/storage/local_storage.dart';
import 'package:case_app/feature/auth/model/current_user_model.dart';

import 'package:case_app/feature/auth/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<DataState> {
  final AuthService _authService;

  AuthController(this._authService) : super(const DataState.loading());

  Future<void> login(CurrentUserModel currentUserModel) async {
    state = const DataState.loading();
    try {
      final token = await _authService.login(currentUserModel);
      currentUserModel.token = token;
      LocalStorage.setString(
          StorageConstants.currentUser, currentUserModel.toString());
      DataState.success(data: token);
    } catch (e) {
      DataState.error(message: e.toString());
    }
  }
}
