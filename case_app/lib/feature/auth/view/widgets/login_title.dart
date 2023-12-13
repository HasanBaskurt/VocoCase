import 'package:case_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text('Login', style: TextStyle(color: AppColors.red)),
    );
  }
}
