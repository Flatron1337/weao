import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'data/local/local_storage_service.dart';
import 'presentation/providers/favorites_provider.dart';
import 'presentation/providers/repository_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  // Pre-load favorites so the UI renders the correct state on the first frame
  // (no flicker from an async load inside the notifier's constructor).
  final localStorage = LocalStorageService(prefs);
  final favorites = await localStorage.loadFavorites();
  // Warm up the JSON cache dir so concurrent repository calls don't race on
  // first access.
  await localStorage.initCacheDir();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        localStorageServiceProvider.overrideWithValue(localStorage),
        favoritesSeedProvider.overrideWithValue(favorites),
      ],
      child: const WeaoApp(),
    ),
  );
}
