import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/local_storage_service.dart';
import 'repository_provider.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Set<String>>((ref) {
  return FavoritesNotifier(ref.watch(localStorageServiceProvider));
});

class FavoritesNotifier extends StateNotifier<Set<String>> {
  FavoritesNotifier(this._storage) : super({}) {
    _load();
  }

  final LocalStorageService _storage;

  Future<void> _load() async {
    state = await _storage.loadFavorites();
  }

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
