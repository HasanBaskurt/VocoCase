import 'package:case_app/core/constants/providers.dart';
import 'package:case_app/feature/auth/model/current_user_model.dart';
import 'package:case_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(authNotifierProvider);
    return SizedBox(
      width: false ? .4.w : 60.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.red.withOpacity(0.8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              ref.read(authNotifierProvider.notifier).login(CurrentUserModel(
                  email: 'eve.holt@reqres.in', password: 'cityslicka'));
            }
          },
          child: false
              ? const FittedBox(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                )),
    );
  }
}
