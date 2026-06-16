import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/l10n/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/exploits/exploit_detail_screen.dart';
import 'presentation/screens/exploits/exploits_screen.dart';
import 'presentation/screens/shell/main_shell.dart';
import 'presentation/screens/versions/versions_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/exploits',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/exploits',
                builder: (context, state) => const ExploitsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/versions',
                builder: (context, state) => const VersionsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/exploit/:name',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final name = Uri.decodeComponent(state.pathParameters['name']!);
          return ExploitDetailScreen(exploitName: name);
        },
      ),
    ],
  );
});

class WeaoApp extends ConsumerWidget {
  const WeaoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: AppStrings.appTitle,
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
