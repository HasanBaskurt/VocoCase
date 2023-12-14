import 'package:case_app/core/constants/providers.dart';
import 'package:case_app/features/auth/model/current_user_model.dart';
import 'package:case_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserProvider = ref.read(currentUserNotifierProvider.notifier);
    return TextFormField(
      initialValue: '',
      style: TextStyle(color: AppColors.white),
      obscureText: true,
      decoration: InputDecoration(
          errorStyle: TextStyle(color: AppColors.white),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white.withOpacity(0.5))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.red.withOpacity(0.5)),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.red.withOpacity(0.5)),
          ),
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color: AppColors.white,
          ),
          hintText: 'Type your password',
          hintStyle: TextStyle(color: AppColors.white.withOpacity(0.5)),
          labelStyle: TextStyle(
            color: AppColors.white,
          )),
      onSaved: (String? value) {
        if (value != null) {
          currentUserProvider.state = CurrentUserModel(
              email: currentUserProvider.state?.email ?? '', password: value);
        }
      },
      validator: (value) {
        return (value!.isEmpty) ? "Please enter your password" : null;
      },
    );
  }
}
