import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

/// Lightweight logger built on top of `dart:developer`.
///
/// Avoids printing to stdout in release builds (where `kReleaseMode` is true)
/// while still surfacing errors during debug runs and in the Dart DevTools
/// timeline via `dart:developer.log`.
class AppLogger {
  const AppLogger._();

  static void debug(String message, {Object? error, StackTrace? stackTrace}) {
    _log(message, level: 500, error: error, stackTrace: stackTrace);
  }

  static void warning(String message, {Object? error, StackTrace? stackTrace}) {
    _log(message, level: 900, error: error, stackTrace: stackTrace);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    _log(message, level: 1000, error: error, stackTrace: stackTrace);
  }

  static void _log(
    String message, {
    required int level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kReleaseMode) return;

    final suffix = error != null ? ' — $error' : '';
    if (kDebugMode) {
      debugPrint('[${_labelFor(level)}] $message$suffix');
    }
    dev.log(
      message,
      level: level,
      name: 'weao',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static String _labelFor(int level) {
    switch (level) {
      case >= 1000:
        return 'ERROR';
      case >= 900:
        return 'WARN';
      default:
        return 'DEBUG';
    }
  }
}
