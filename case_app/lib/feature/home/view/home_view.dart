import 'package:case_app/core/constants/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        body: Visibility(
            visible: ref.watch(homeNotifierProvider.notifier).loading,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
                itemCount: userListState.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(index.toString()),
                  );
                })));
  }
}
