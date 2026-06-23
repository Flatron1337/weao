import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/local/local_storage_service.dart';
import 'repository_provider.dart';

part 'settings_provider.g.dart';

class SettingsState {
  const SettingsState({this.themeMode = ThemeMode.system, this.locale});

  final ThemeMode themeMode;
  final Locale? locale;

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    bool clearLocale = false,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: clearLocale ? null : (locale ?? this.locale),
    );
  }
}

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  SettingsState build() {
    final storage = ref.watch(localStorageServiceProvider);

    final themeStr = storage.getThemeMode();
    final localeStr = storage.getLocale();

    ThemeMode mode = ThemeMode.system;
    if (themeStr != null) {
      mode = ThemeMode.values.firstWhere(
        (e) => e.name == themeStr,
        orElse: () => ThemeMode.system,
      );
    }

    Locale? locale;
    if (localeStr != null && localeStr.isNotEmpty) {
      locale = Locale(localeStr);
    }

    return SettingsState(themeMode: mode, locale: locale);
  }

  LocalStorageService get _storage => ref.read(localStorageServiceProvider);

  Future<void> setThemeMode(ThemeMode mode) async {
    await _storage.setThemeMode(mode.name);
    state = state.copyWith(themeMode: mode);
  }

  Future<void> setLocale(Locale? locale) async {
    if (locale == null) {
      await _storage.clearLocale();
      state = state.copyWith(clearLocale: true);
    } else {
      await _storage.setLocale(locale.languageCode);
      state = state.copyWith(locale: locale);
    }
  }

  Future<void> clearCache() async {
    await _storage.clearAllCache();
  }
}
