import 'package:case_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
