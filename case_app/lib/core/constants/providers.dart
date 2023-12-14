import 'package:case_app/core/constants/data_state.dart';
import 'package:case_app/features/auth/controller/auth_controller.dart';
import 'package:case_app/features/auth/model/current_user_model.dart';
import 'package:case_app/features/auth/service/auth_service.dart';
import 'package:case_app/features/home/controller/home_controller.dart';
import 'package:case_app/features/home/service/home_service.dart';
import 'package:case_app/store/current_user/controller/current_user_controller.dart';
import 'package:case_app/store/current_user/service/current_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Services
final homeServiceProvider = Provider<HomeService>(
  (ref) => HomeService(),
);

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(),
);

final currentUserServiceProvider = Provider<CurrentUserService>(
  (ref) => CurrentUserService(),
);

//Notifiers
final homeNotifierProvider = StateNotifierProvider<HomeController, DataState>(
  (ref) => HomeController(ref.read(homeServiceProvider)),
);

final authNotifierProvider = StateNotifierProvider<AuthController, DataState>(
  (ref) => AuthController(ref.read(authServiceProvider)),
);

final currentUserNotifierProvider =
    StateNotifierProvider<CurrentUserController, CurrentUserModel?>(
  (ref) => CurrentUserController(ref.read(currentUserServiceProvider)),
);
