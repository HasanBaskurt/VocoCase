import 'package:case_app/features/auth/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const ProviderScope(child: CaseApp()));

class CaseApp extends StatelessWidget {
  const CaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(title: 'Material App', home: LoginView());
    });
  }
}
