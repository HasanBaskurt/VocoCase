import 'package:case_app/core/constants/providers.dart';
import 'package:case_app/features/auth/view/login_view.dart';
import 'package:case_app/features/home/view/home_view.dart';
import 'package:case_app/utils/routes/app_routes.dart';
import 'package:case_app/utils/theme/custom_dark_theme.dart';
import 'package:case_app/utils/theme/custom_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const ProviderScope(child: CaseApp()));

class CaseApp extends ConsumerWidget {
  const CaseApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.read(authNotifierProvider.notifier);
    final themeColor = Theme.of(context).colorScheme;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          theme: CustomLightTheme().themeData,
          darkTheme: CustomDarkTheme().themeData,
          themeMode: ThemeMode.system,
          title: 'Material App',
          routes: AppRoutes.routes,
          home: FutureBuilder(
              future: authProvider.tryAutoLogin(),
              builder: (context, authResult) {
                if (authResult.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: themeColor.primary,
                  ));
                } else {
                  if (authResult.data != null) {
                    return const HomeView();
                  }
                  return const LoginView();
                }
              }));
    });
  }
}
