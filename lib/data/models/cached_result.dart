class CachedResult<T> {
  CachedResult({
    required this.data,
    this.isStale = false,
    this.cachedAt,
    this.error,
  }) {
    // Stale results must always carry a timestamp so consumers can safely
    // use a non-null `cachedAt` when `isStale` is true.
    assert(
      !isStale || cachedAt != null,
      'CachedResult with isStale=true must provide a non-null cachedAt',
    );
  }

  final T data;
  final bool isStale;
  final DateTime? cachedAt;
  final Object? error;
}
