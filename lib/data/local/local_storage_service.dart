import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService(this._prefs);

  static const _favoritesKey = 'favorite_exploit_titles';

  final SharedPreferences _prefs;
  Directory? _cacheDir;

  Future<Directory> get cacheDir async {
    if (_cacheDir != null) return _cacheDir!;
    final appDir = await getApplicationDocumentsDirectory();
    _cacheDir = Directory('${appDir.path}/cache');
    if (!await _cacheDir!.exists()) {
      await _cacheDir!.create(recursive: true);
    }
    return _cacheDir!;
  }

  Future<Set<String>> loadFavorites() async {
    final raw = _prefs.getString(_favoritesKey);
    if (raw == null) return {};
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list.map((e) => e as String).toSet();
    } catch (_) {
      return {};
    }
  }

  Future<void> saveFavorites(Set<String> titles) async {
    final list = titles.toList()..sort();
    await _prefs.setString(_favoritesKey, jsonEncode(list));
  }

  Future<void> saveJsonCache(String fileName, dynamic data) async {
    final dir = await cacheDir;
    final file = File('${dir.path}/$fileName');
    final envelope = {
      'cachedAt': DateTime.now().toUtc().toIso8601String(),
      'data': data,
    };
    await file.writeAsString(jsonEncode(envelope));
  }

  Future<StoredCache?> loadJsonCache(String fileName) async {
    final dir = await cacheDir;
    final file = File('${dir.path}/$fileName');
    if (!await file.exists()) return null;

    try {
      final decoded = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final cachedAtRaw = decoded['cachedAt'] as String?;
      final cachedAt =
          cachedAtRaw != null ? DateTime.tryParse(cachedAtRaw) : null;
      return StoredCache(
        data: decoded['data'],
        cachedAt: cachedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      );
    } catch (_) {
      return null;
    }
  }
}

class StoredCache {
  const StoredCache({required this.data, required this.cachedAt});

  final dynamic data;
  final DateTime cachedAt;
}
