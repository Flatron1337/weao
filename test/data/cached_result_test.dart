import 'package:flutter_test/flutter_test.dart';

import 'package:weao/data/models/cached_result.dart';

void main() {
  group('CachedResult', () {
    test('defaults: not stale, no timestamp, no error', () {
      final result = CachedResult<int>(data: 42);

      expect(result.data, 42);
      expect(result.isStale, isFalse);
      expect(result.cachedAt, isNull);
      expect(result.error, isNull);
    });

    test('stale result carries timestamp and error', () {
      final now = DateTime.now();
      final result = CachedResult<String>(
        data: 'cached',
        isStale: true,
        cachedAt: now,
        error: Exception('offline'),
      );

      expect(result.isStale, isTrue);
      expect(result.cachedAt, now);
      expect(result.error, isA<Exception>());
    });

    test('asserts: stale result must have non-null cachedAt', () {
      expect(
        () => CachedResult<int>(data: 1, isStale: true),
        throwsA(isA<AssertionError>()),
      );
    });

    test('non-stale result allows null cachedAt', () {
      final result = CachedResult<int>(data: 1);
      // No assertion, cachedAt null is fine when not stale.
      expect(result.cachedAt, isNull);
    });
  });
}
