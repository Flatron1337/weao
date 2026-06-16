import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/local_storage_service.dart';
import 'repository_provider.dart';

/// Seed of favorites loaded synchronously in `main()` before `runApp`.
/// Overridden there so the notifier starts with the real set instead of
/// loading asynchronously and causing a UI flicker.
final favoritesSeedProvider = Provider<Set<String>>((ref) {
  throw UnimplementedError('favoritesSeedProvider must be overridden in main()');
});

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Set<String>>((ref) {
  return FavoritesNotifier(
    ref.watch(localStorageServiceProvider),
    ref.watch(favoritesSeedProvider),
  );
});

class FavoritesNotifier extends StateNotifier<Set<String>> {
  FavoritesNotifier(this._storage, Set<String> seed) : super(seed);

  final LocalStorageService _storage;

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
