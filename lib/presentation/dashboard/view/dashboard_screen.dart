import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/const/color.dart';
import '../../common/component/custom_divider.dart';
import '../../common/layout/default_layout.dart';
import '../../user/viewmodel/user_provider.dart';

class DashboardScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = navigationShell.currentIndex;
    return DefaultLayout(
      body: Row(
        children: [
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text('statistics'),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text('statistics'),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text('statistics'),
                ),
                const CustomDivider(),
                GestureDetector(
                  onTap: () {
                    ref.read(userProvider.notifier).logout();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.logout,color: ColorConst.dividerGrey,size: 20),
                        SizedBox(width: 10),
                        Text('Logout'),
                      ],
                    ),
                  ),
                ),
                const CustomDivider(),
              ],
            ),
          ),
          CustomDivider(vertical: true),
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }
}
