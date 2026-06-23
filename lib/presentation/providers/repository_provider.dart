import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/api/weao_api_client.dart';
import '../../data/local/local_storage_service.dart';
import '../../data/repositories/weao_repository.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError('SharedPreferences must be overridden in main()');
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageService(ref.watch(sharedPreferencesProvider));
}

@Riverpod(keepAlive: true)
WeaoApiClient weaoApiClient(Ref ref) {
  return WeaoApiClient();
}

@Riverpod(keepAlive: true)
WeaoRepository weaoRepository(Ref ref) {
  return WeaoRepository(
    ref.watch(weaoApiClientProvider),
    ref.watch(localStorageServiceProvider),
  );
}
