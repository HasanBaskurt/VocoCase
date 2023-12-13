
import 'package:case_app/feature/auth/controller/auth_controller.dart';
import 'package:case_app/feature/auth/service/auth_service.dart';
import 'package:case_app/feature/home/controller/home_controller.dart';
import 'package:case_app/feature/home/model/user_model.dart';
import 'package:case_app/feature/home/service/home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




// Services
final homeServiceProvider = Provider<HomeService>(
  (ref) => HomeService(),
);

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(),
);



//Notifiers
final homeNotifierProvider =
    StateNotifierProvider<HomeController, List<UserModel>>(
  (ref) => HomeController(ref.read(homeServiceProvider)),
);

final authNotifierProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(ref.read(authServiceProvider)),
);
