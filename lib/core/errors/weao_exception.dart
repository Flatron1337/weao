/// Categorised application error returned by the API client.
///
/// Carries a [kind] so the UI layer can map it to a localised message via
/// [AppStrings]; [message] is kept for convenience and `toString()`.
class WeaoException implements Exception {
  WeaoException(this.message, {this.kind = WeaoExceptionKind.unknown, this.remainingSeconds});

  final String message;
  final WeaoExceptionKind kind;
  final int? remainingSeconds;

  bool get isRateLimited => kind == WeaoExceptionKind.rateLimited;

  @override
  String toString() => message;
}

/// Stable, localisable error categories independent of the API layer.
enum WeaoExceptionKind {
  rateLimited,
  timeout,
  noConnection,
  unknown,
}
