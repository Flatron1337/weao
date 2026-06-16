class CachedResult<T> {
  const CachedResult({
    required this.data,
    this.isStale = false,
    this.cachedAt,
    this.error,
  });

  final T data;
  final bool isStale;
  final DateTime? cachedAt;
  final Object? error;
}
