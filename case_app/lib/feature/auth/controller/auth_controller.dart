import 'package:case_app/feature/auth/model/login_model.dart';

import 'package:case_app/feature/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<bool> {
  final AuthService _authService;

  AuthController(this._authService) : super(false);

  Future<void> login(LoginModel loginModel) async {
    try {
      final response = await _authService.login(
        loginModel.email,
        loginModel.password,
      );

      state = true;
    } catch (e) {
      debugPrint(e.toString());

      state = false;
    }
  }
}
