import 'package:case_app/core/constants/data_state.dart';
import 'package:case_app/core/constants/providers.dart';
import 'package:case_app/core/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColor = Theme.of(context).colorScheme;
    final authState = ref.watch(authNotifierProvider);
    final currentUserProvider = ref.read(currentUserNotifierProvider.notifier);

    ref.listen<DataState>(authNotifierProvider, (_, state) {
      state.maybeWhen(
        success: (currentUser) {
          currentUserProvider.changeCurrentUser(currentUser);

          Navigator.pushNamed(context, RouteConstants.routeHomeView);
        },
        error: (err, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                err,
                style: TextStyle(color: themeColor.onSecondary),
              ),
              backgroundColor: themeColor.primary,
            ),
          );
        },
        orElse: () {},
      );
    });
    return authState.maybeWhen(
        loading: () => Center(
              child: CircularProgressIndicator(
                color: themeColor.primary,
              ),
            ),
        orElse: () => SizedBox(
            width: 60.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor.primary.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (currentUserProvider.state != null) {
                      await ref.read(authNotifierProvider.notifier).login(
                            email: currentUserProvider.state?.email ?? '-',
                            password:
                                currentUserProvider.state?.password ?? '-',
                          );
                    }
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: themeColor.onSecondary),
                ))));
  }
}
