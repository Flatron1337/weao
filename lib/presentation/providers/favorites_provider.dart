import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/local/local_storage_service.dart';
import 'repository_provider.dart';

part 'favorites_provider.g.dart';

@Riverpod(keepAlive: true)
Set<String> favoritesSeed(Ref ref) {
  throw UnimplementedError(
    'favoritesSeedProvider must be overridden in main()',
  );
}

@Riverpod(keepAlive: true)
class Favorites extends _$Favorites {
  @override
  Set<String> build() {
    return ref.watch(favoritesSeedProvider);
  }

  LocalStorageService get _storage => ref.read(localStorageServiceProvider);

  bool isFavorite(String title) => state.contains(title);

  Future<void> toggle(String title) async {
    final next = Set<String>.from(state);
    if (next.contains(title)) {
      next.remove(title);
    } else {
      next.add(title);
    }
    state = next;
    await _storage.saveFavorites(next);
  }
}
