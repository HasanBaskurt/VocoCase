import 'package:case_app/features/auth/view/widgets/email_field.dart';
import 'package:case_app/features/auth/view/widgets/login_button.dart';
import 'package:case_app/features/auth/view/widgets/login_title.dart';
import 'package:case_app/features/auth/view/widgets/password_field.dart';
import 'package:case_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(resizeToAvoidBottomInset: false, body: buildBody(formKey));
  }

  Widget buildBody(GlobalKey<FormState> formKey) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      color: AppColors.darkgrey,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Spacer(
              flex: 6,
            ),
            Expanded(
                flex: 2,
                child: FadeInDown(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 750),
                    child: const LoginTitle())),
            const Spacer(
              flex: 2,
            ),
            Expanded(
                child: FadeInLeft(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 1000),
                    child: const EmailField())),
            const Spacer(
              flex: 2,
            ),
            Expanded(
                child: FadeInRight(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 1250),
                    child: const PasswordField())),
            const Spacer(
              flex: 2,
            ),
            Expanded(
                child: FadeInUp(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 1500),
                    child: LoginButton(
                      formKey: formKey,
                    ))),
            const Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
