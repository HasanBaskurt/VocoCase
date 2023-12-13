import 'package:case_app/feature/auth/view/widgets/login_title.dart';
import 'package:case_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xff31353b),
            Color(0xff191b1f),
          ])),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Expanded(
                flex: 2,
                child: FadeInUp(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 750),
                    child: const LoginTitle())),
            const Spacer(
              flex: 2,
            ),
            Expanded(
                child: FadeInUp(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 1000),
                    child: emailField())),
            const Spacer(),
            Expanded(
                child: FadeInUp(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 1250),
                    child: passwordField())),
            const Spacer(
              flex: 2,
            ),
            Expanded(
                flex: 1,
                child: FadeInUp(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 1500),
                    child: loginButton(formKey))),
            const Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    ));
  }
}

TextFormField emailField() {
  return TextFormField(
    initialValue: '',
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red.withOpacity(0.5)),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red.withOpacity(0.5)),
        ),
        prefixIcon: const Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
        hintText: 'Type your email',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        labelStyle: const TextStyle(
          color: Colors.white,
        )),
    onSaved: (value) {},
    validator: (String? value) {
      return (value!.isEmpty) ? "Please enter your email" : null;
    },
  );
}

TextFormField passwordField() {
  return TextFormField(
    initialValue: '',
    style: const TextStyle(color: Colors.white),
    obscureText: false,
    decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red.withOpacity(0.5)),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red.withOpacity(0.5)),
        ),
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          color: Colors.white,
        ),
        suffixIcon: InkWell(
            onTap: () {},
            child: Icon(
              false ? Icons.visibility_off : Icons.visibility,
              color: AppColors.red.withOpacity(0.8),
            )),
        hintText: 'Type your password',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        labelStyle: const TextStyle(
          color: Colors.white,
        )),
    onSaved: (String? value) {},
    validator: (value) {
      return (value!.isEmpty) ? "Please enter your password" : null;
    },
  );
}

Widget loginButton(formKey) {
  return SizedBox(
    width: false ? .4.w : 60.w,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red.withOpacity(0.8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        onPressed: () {
          loginFunc(formKey);
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

loginFunc(formKey) async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
  }
  // Navigator.pushNamed(context, Constants.ROUTE_CUSTOMER_HOME_VIEW);
}
