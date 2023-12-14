import 'package:case_app/features/auth/model/current_user_model.dart';
import 'package:case_app/store/current_user/service/current_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentUserController extends StateNotifier<CurrentUserModel?> {
  final CurrentUserService _currentUserService;

  CurrentUserController(this._currentUserService) : super(null);

  void changeCurrentUser(CurrentUserModel currentUserModel) {
    state = _currentUserService.changeCurrentUser(currentUserModel);
  }
}
