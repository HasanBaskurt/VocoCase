import 'package:animate_do/animate_do.dart';
import 'package:case_app/core/constants/providers.dart';
import 'package:case_app/features/home/view/widgets/user_info_card.dart';
import 'package:case_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(homeNotifierProvider.notifier).getUserList('1');
  }

  @override
  Widget build(BuildContext context) {
    final userListState = ref.watch(homeNotifierProvider);
    return Scaffold(
        backgroundColor: AppColors.darkgrey,
        appBar: AppBar(
          title: Text(
            'User List',
            style: TextStyle(color: AppColors.red),
          ),
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
        body: Container(
          child: userListState.maybeWhen(
              loading: () => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red,
                    ),
                  ),
              success: (userList) => (userList.isEmpty)
                  ? const Center(
                      child: Text('No Data'),
                    )
                  : GridView.builder(
                      itemCount: userList.length,
                      padding: EdgeInsets.all(1.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 1.h,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return FadeInUp(
                            duration: const Duration(milliseconds: 300),
                            delay: Duration(milliseconds: index * 300),
                            child: UserInfoCard(user: userList[index]));
                      }),
              error: (err, _) => Center(
                    child: Text(err),
                  ),
              orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
        ));
  }
}
