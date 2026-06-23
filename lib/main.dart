import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'data/database/hive_service.dart';
import 'data/local/local_storage_service.dart';
import 'presentation/providers/favorites_provider.dart';
import 'presentation/providers/repository_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  await HiveService.init();

  final localStorage = LocalStorageService(prefs);
  final favorites = await localStorage.loadFavorites();

  await SentryFlutter.init(
    (options) {
      options.dsn = const String.fromEnvironment('SENTRY_DSN');
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          localStorageServiceProvider.overrideWithValue(localStorage),
          favoritesSeedProvider.overrideWithValue(favorites),
        ],
        child: const WeaoApp(),
      ),
    ),
  );
}
