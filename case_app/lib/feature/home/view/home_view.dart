import 'package:case_app/core/constants/providers.dart';
import 'package:case_app/feature/home/view/widgets/user_info_card.dart';
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
        appBar: AppBar(
          title: const Text('User List'),
          centerTitle: true,
        ),
        body: userListState.maybeWhen(
            loading: () => const Center(
                  child: CircularProgressIndicator(),
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
                      return UserInfoCard(user: userList[index]);
                    }),
            error: (err, _) => Center(
                  child: Text(err),
                ),
            orElse: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
