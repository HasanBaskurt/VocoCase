import 'package:case_app/core/constants/providers.dart';
import 'package:case_app/features/auth/model/current_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserProvider = ref.read(currentUserNotifierProvider.notifier);

    final themeColor = Theme.of(context).colorScheme;
    return TextFormField(
      initialValue: '',
      style: TextStyle(color: themeColor.onPrimary),
      decoration: InputDecoration(
          errorStyle: TextStyle(color: themeColor.onPrimary),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: themeColor.onPrimary.withOpacity(0.5))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeColor.primary.withOpacity(0.5)),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: themeColor.onPrimary.withOpacity(0.5)),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeColor.primary.withOpacity(0.5)),
          ),
          prefixIcon: Icon(
            Icons.person_outline_outlined,
            color: themeColor.onPrimary,
          ),
          hintText: 'Type your email',
          hintStyle: TextStyle(color: themeColor.onPrimary.withOpacity(0.5)),
          labelStyle: TextStyle(
            color: themeColor.onPrimary,
          )),
      onSaved: (value) {
        if (value != null) {
          currentUserProvider.state = CurrentUserModel(
              email: value,
              password: currentUserProvider.state?.password ?? '');
        }
      },
      validator: (String? value) {
        return (value!.isEmpty) ? "Please enter your email" : null;
      },
    );
  }
}
