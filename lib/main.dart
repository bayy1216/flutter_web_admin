import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/application_theme.dart';
import 'presentation/common/router/go_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Admin_Web',


      theme: ApplicationTheme.lightThemeData,
      darkTheme: ApplicationTheme.darkThemeData,
      themeMode: ThemeMode.light,

      routerConfig: router,
    );
  }
}