class WeaoException implements Exception {
  WeaoException(this.message, {this.remainingSeconds});

  final String message;
  final int? remainingSeconds;

  bool get isRateLimited => remainingSeconds != null;

  @override
  String toString() => message;
}
