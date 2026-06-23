import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/app_logger.dart';
import '../../presentation/providers/exploits_provider.dart';
import '../database/hive_models.dart';
import '../database/hive_service.dart';

class LocalStorageService {
  LocalStorageService(this._prefs);

  static const _themeKey = 'app_theme_mode';
  static const _localeKey = 'app_locale';
  static const _filtersKey = 'exploit_filters';

  final SharedPreferences _prefs;

  Future<Set<String>> loadFavorites() async {
    try {
      final box = HiveService.favorites;
      return box.values.map((e) => e.title).toSet();
    } catch (e, st) {
      AppLogger.warning('Failed to load favorites', error: e, stackTrace: st);
      return {};
    }
  }

  Future<void> saveFavorites(Set<String> titles) async {
    try {
      final box = HiveService.favorites;
      await box.clear();
      final items = titles.map((t) => HiveFavorite(title: t)).toList();
      await box.addAll(items);
    } catch (e, st) {
      AppLogger.warning('Failed to save favorites', error: e, stackTrace: st);
    }
  }

  String? getThemeMode() => _prefs.getString(_themeKey);
  Future<void> setThemeMode(String mode) => _prefs.setString(_themeKey, mode);

  String? getLocale() => _prefs.getString(_localeKey);
  Future<void> setLocale(String languageCode) => _prefs.setString(_localeKey, languageCode);
  Future<void> clearLocale() => _prefs.remove(_localeKey);

  ExploitFilters getFilters() {
    final raw = _prefs.getString(_filtersKey);
    if (raw == null) return const ExploitFilters();
    try {
      return ExploitFilters.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return const ExploitFilters();
    }
  }

  Future<void> saveFilters(ExploitFilters filters) =>
      _prefs.setString(_filtersKey, jsonEncode(filters.toJson()));

  Future<void> clearAllCache() async {
    try {
      await HiveService.cache.clear();
    } catch (e, st) {
      AppLogger.warning('Failed to clear cache', error: e, stackTrace: st);
    }
  }

  Future<void> saveJsonCache(String fileName, dynamic data) async {
    try {
      final box = HiveService.cache;
      final cachedResult = HiveCachedResult(
        path: fileName,
        jsonBody: jsonEncode(data),
        cachedAt: DateTime.now().toUtc(),
      );
      await box.put(fileName, cachedResult);
    } catch (e, st) {
      AppLogger.warning('Failed to save cache for "$fileName"', error: e, stackTrace: st);
    }
  }

  Future<StoredCache?> loadJsonCache(String fileName) async {
    try {
      final box = HiveService.cache;
      final cached = box.get(fileName);
      if (cached == null) return null;
      
      final data = jsonDecode(cached.jsonBody);
      return StoredCache(
        data: data,
        cachedAt: cached.cachedAt,
      );
    } catch (e, st) {
      AppLogger.warning('Failed to load cache for "$fileName"', error: e, stackTrace: st);
      return null;
    }
  }
}

class StoredCache {
  const StoredCache({required this.data, required this.cachedAt});

  final dynamic data;
  final DateTime cachedAt;
}
