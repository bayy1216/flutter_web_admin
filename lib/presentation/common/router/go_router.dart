import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'navigation_provider.dart';


final rootNavigatorKey = GlobalKey<NavigatorState>();

const INITAL_ROUTE = '/';

final routerProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(navigationProvider);
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: provider.routes,
    initialLocation: INITAL_ROUTE,
    refreshListenable: provider,
    redirect: provider.redirectLogic,
  );
});