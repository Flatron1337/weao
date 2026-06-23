import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weao/l10n/generated/app_localizations.dart';

import 'core/theme/app_theme.dart';
import 'data/models/exploit.dart';
import 'presentation/providers/settings_provider.dart';
import 'presentation/screens/exploits/exploit_detail_screen.dart';
import 'presentation/screens/exploits/exploits_screen.dart';
import 'presentation/screens/settings/settings_screen.dart';
import 'presentation/screens/shell/main_shell.dart';
import 'presentation/screens/versions/versions_screen.dart';

part 'app.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
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
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
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
          final exploit = state.extra;
          return ExploitDetailScreen(
            exploitName: name,
            exploit: exploit is Exploit ? exploit : null,
          );
        },
      ),
    ],
  );
}

class WeaoApp extends ConsumerWidget {
  const WeaoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final settings = ref.watch(settingsProvider);

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp.router(
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          theme: AppTheme.light(lightDynamic),
          darkTheme: AppTheme.dark(darkDynamic),
          themeMode: settings.themeMode,
          locale: settings.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
