import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/app_logger.dart';

class LocalStorageService {
  LocalStorageService(this._prefs, [this._cacheDir]);

  static const _favoritesKey = 'favorite_exploit_titles';
  static const _themeKey = 'app_theme_mode';
  static const _localeKey = 'app_locale';

  final SharedPreferences _prefs;
  Directory? _cacheDir;

  /// Pre-warm the cache directory. Call once during app bootstrap (e.g. in
  /// `main()`) so subsequent [saveJsonCache]/[loadJsonCache] calls are
  /// synchronous-ish and there's no first-access race between concurrent
  /// repository calls.
  Future<void> initCacheDir() async {
    if (_cacheDir != null) return;
    final appDir = await getApplicationDocumentsDirectory();
    _cacheDir = Directory('${appDir.path}/cache');
    if (!_cacheDir!.existsSync()) {
      await _cacheDir!.create(recursive: true);
    }
  }

  Future<Directory> get cacheDir async {
    if (_cacheDir != null) return _cacheDir!;
    await initCacheDir();
    return _cacheDir!;
  }

  Future<Set<String>> loadFavorites() async {
    final raw = _prefs.getString(_favoritesKey);
    if (raw == null) return {};
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list.map((e) => e as String).toSet();
    } catch (e, st) {
      AppLogger.warning(
        'Failed to decode favorites, resetting',
        error: e,
        stackTrace: st,
      );
      return {};
    }
  }

  Future<void> saveFavorites(Set<String> titles) async {
    final list = titles.toList()..sort();
    await _prefs.setString(_favoritesKey, jsonEncode(list));
  }

  String? getThemeMode() => _prefs.getString(_themeKey);
  Future<void> setThemeMode(String mode) => _prefs.setString(_themeKey, mode);

  String? getLocale() => _prefs.getString(_localeKey);
  Future<void> setLocale(String languageCode) =>
      _prefs.setString(_localeKey, languageCode);
  Future<void> clearLocale() => _prefs.remove(_localeKey);

  Future<void> clearAllCache() async {
    final dir = await cacheDir;
    if (dir.existsSync()) {
      for (final entity in dir.listSync()) {
        await entity.delete(recursive: true);
      }
    }
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
    if (!file.existsSync()) return null;

    try {
      final decoded =
          jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final cachedAtRaw = decoded['cachedAt'] as String?;
      final cachedAt = cachedAtRaw != null
          ? DateTime.tryParse(cachedAtRaw)
          : null;
      return StoredCache(
        data: decoded['data'],
        cachedAt: cachedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
      );
    } catch (e, st) {
      AppLogger.warning(
        'Failed to read cache file "$fileName"',
        error: e,
        stackTrace: st,
      );
      return null;
    }
  }
}

class StoredCache {
  const StoredCache({required this.data, required this.cachedAt});

  final dynamic data;
  final DateTime cachedAt;
}
