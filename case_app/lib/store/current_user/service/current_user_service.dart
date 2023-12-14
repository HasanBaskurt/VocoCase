import 'package:case_app/features/auth/model/current_user_model.dart';

class CurrentUserService {
  CurrentUserModel? changeCurrentUser(CurrentUserModel currentUser) {
    if (currentUser.token != null) return currentUser;
    return null;
  }
}
