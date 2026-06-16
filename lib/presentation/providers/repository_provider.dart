import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/api/weao_api_client.dart';
import '../../data/local/local_storage_service.dart';
import '../../data/repositories/weao_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden in main()');
});

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService(ref.watch(sharedPreferencesProvider));
});

final weaoApiClientProvider = Provider<WeaoApiClient>((ref) {
  return WeaoApiClient();
});

final weaoRepositoryProvider = Provider<WeaoRepository>((ref) {
  return WeaoRepository(
    ref.watch(weaoApiClientProvider),
    ref.watch(localStorageServiceProvider),
  );
});
