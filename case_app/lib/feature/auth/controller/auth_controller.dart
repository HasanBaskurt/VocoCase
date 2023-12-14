// import 'package:case_app/core/constants/data_state.dart';
// import 'package:case_app/feature/auth/model/login_model.dart';

// import 'package:case_app/feature/auth/service/auth_service.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AuthController extends StateNotifier<DataState> {
//   final AuthService _authService;

//   AuthController(this._authService) : super(const DataState.initial());

//   Future<void> login(LoginModel loginModel) async {
//     state = const DataState.loading();
//     try {
//       final response = await _authService.login(
//         loginModel.email,
//         loginModel.password,
//       );
//       DataState.success(data: response);
//     } catch (e) {
//       DataState.error(message: e.toString());
//     }
//   }
// }
