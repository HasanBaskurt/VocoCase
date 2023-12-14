import 'package:case_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
