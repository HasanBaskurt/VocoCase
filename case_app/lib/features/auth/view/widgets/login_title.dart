import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return FittedBox(
      child: Text('Login', style: TextStyle(color: themeColor.primary)),
    );
  }
}
