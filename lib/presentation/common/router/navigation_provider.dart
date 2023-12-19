import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../dashboard/view/statistics_screen.dart';
import '../../intro/view/intro_screen.dart';
import '../../user/view/login_screen.dart';
import '../../user/viewmodel/user_provider.dart';
import 'go_router.dart';

final _shellNoticeKey = GlobalKey<NavigatorState>(debugLabel: 'shellNotice');
final _shellFavoriteKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellFavorite');
final _shellAllKey = GlobalKey<NavigatorState>(debugLabel: 'shellAll');

final navigationProvider = ChangeNotifierProvider<NavigationProvider>((ref) {
  return NavigationProvider(ref: ref);
});

class NavigationProvider extends ChangeNotifier {
  final Ref ref;

  NavigationProvider({required this.ref}) {
    ref.listen(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<RouteBase> get routes => [
        GoRoute(
          path: '/',
          name: IntroScreen.routeName,
          builder: (context, state) => const IntroScreen(),
        ),
        GoRoute(
          path: '/login',
          name: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return DashboardScreen(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/dashboard/statistics',
                  name: StatisticsScreen.routeName,
                  builder: (context, state) => const StatisticsScreen(),
                ),
              ],
            ),
          ],
        ),
      ];

  void logout() {
    ref.read(userProvider.notifier).logout();
  }

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final user = ref.read(userProvider);

    final isTryLogin = state.fullPath == '/login';
    final isIntro = state.fullPath == '/';
    if (isIntro) {
      return null;
    }
    return user.when(
      data: (data) {
        if (data == null) {
          //유저정보 없을시
          //메인 화면으로 가게한다
          return isTryLogin ? null : '/';
        }

        //유저정보 있을시
        //로그인 중이면, 대시보드로 가게한다
        return isTryLogin ? '/dashboard/statistics' : null;
      },
      error: (error, stackTrace) {
        //오류 발생시 로그인 화면으로
        return isTryLogin ? null : '/login';
      },
      loading: () {
        //유저정보 로딩중이면 그대로
        return null;
      },
    );
  }
}
