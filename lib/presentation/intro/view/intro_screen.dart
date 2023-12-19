import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/const/color.dart';
import '../../../core/const/text_style.dart';
import '../../common/layout/default_layout.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../dashboard/view/statistics_screen.dart';
import '../../user/view/login_screen.dart';
import '../../user/viewmodel/user_provider.dart';

class IntroScreen extends ConsumerWidget {
  static const routeName = 'intro';

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider).when(
      data: (data) => data,
      loading: () => null,
      error: (e, s) => null,
    );
    return DefaultLayout(
      body: Scaffold(
        backgroundColor: ColorConst.background,
        appBar: AppBar(
          backgroundColor: ColorConst.background,
          centerTitle: false,
          title: Text(
            'happy aging',
            style:
                TextStyles.titleMedium1.copyWith(color: ColorConst.snowWhite),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                onPressed: () {
                  if(userState != null){
                    context.goNamed(StatisticsScreen.routeName);
                  }
                  else{
                    context.goNamed(LoginScreen.routeName);
                  }
                },
                child: Text(
                  'Dashboard',
                  style: TextStyles.lightContentMedium1
                      .copyWith(color: ColorConst.snowWhite),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                onPressed: () {
                  if(userState != null){
                    ref.read(userProvider.notifier).logout();
                  }
                  else{
                    context.goNamed(LoginScreen.routeName);
                  }
                },
                child: Text(
                  userState == null ? 'Login' : 'Logout',
                  style: TextStyles.lightContentMedium1
                      .copyWith(color: ColorConst.snowWhite),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 160),
              Text('Manage Application',
                  style: TextStyles.bigTitle1.copyWith(
                    color: ColorConst.snowWhite,
                  )),
              const SizedBox(height: 20),
              Text(
                'For admin',
                style: TextStyles.bigTitle1.copyWith(
                  color: ColorConst.mintGreen2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
