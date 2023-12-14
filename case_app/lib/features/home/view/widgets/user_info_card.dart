import 'package:case_app/features/home/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Card(
      shadowColor: themeColor.outline,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.h),
      ),
      elevation: .5.h,
      child: Container(
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h),
        ),
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: Image.network(user.avatar),
            ),
            const Spacer(),
            Expanded(child: Text('${user.firstName} ${user.firstName}')),
            const Spacer(),
            Expanded(child: Text(user.email)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
