import 'package:flutter_test/flutter_test.dart';

import 'package:weao/data/models/sunc_data.dart';

void main() {
  const samplePassedJson = <String, dynamic>{
    'name': 'test_a',
    'description': 'Test A description',
    'library': 'CoreLib',
    'status': 'passed',
  };

  const sampleFailedJson = <String, dynamic>{
    'name': 'test_b',
    'description': 'Test B description',
    'library': 'CoreLib',
    'status': 'failed',
    'reason': 'Timeout exceeded',
  };

  final fullJson = <String, dynamic>{
    'timestamp': 1718000000.0,
    'version': '2.1.0',
    'timeTaken': 12.5,
    'executor': 'TestExecutor',
    'outdated': true,
    'bibip': false,
    'tests': {
      'passed': [samplePassedJson],
      'failed': [sampleFailedJson],
    },
  };

  group('SuncTest', () {
    test('fromJson parses all fields', () {
      final test = SuncTest.fromJson(sampleFailedJson);

      expect(test.name, 'test_b');
      expect(test.description, 'Test B description');
      expect(test.library, 'CoreLib');
      expect(test.status, 'failed');
      expect(test.reason, 'Timeout exceeded');
    });

    test('isPassed / isFailed', () {
      expect(SuncTest.fromJson(samplePassedJson).isPassed, isTrue);
      expect(SuncTest.fromJson(samplePassedJson).isFailed, isFalse);
      expect(SuncTest.fromJson(sampleFailedJson).isFailed, isTrue);
      expect(SuncTest.fromJson(sampleFailedJson).isPassed, isFalse);
    });

    test('fromJson defaults for missing fields', () {
      const emptyJson = <String, dynamic>{};
      final test = SuncTest.fromJson(emptyJson);

      expect(test.name, isEmpty);
      expect(test.library, 'Other');
      expect(test.status, 'unknown');
      expect(test.reason, isNull);
    });
  });

  group('SuncData', () {
    test('fromJson parses full object', () {
      final data = SuncData.fromJson(fullJson);

      expect(data.timestamp, 1718000000.0);
      expect(data.version, '2.1.0');
      expect(data.timeTaken, 12.5);
      expect(data.executor, 'TestExecutor');
      expect(data.outdated, isTrue);
      expect(data.bibip, isFalse);
      expect(data.passed.length, 1);
      expect(data.failed.length, 1);
    });

    test('allTests combines passed and failed', () {
      final data = SuncData.fromJson(fullJson);

      expect(data.allTests.length, 2);
      expect(
        data.allTests.map((t) => t.name),
        containsAll(['test_a', 'test_b']),
      );
    });

    test('fromJson handles missing tests block', () {
      final data = SuncData.fromJson(<String, dynamic>{});

      expect(data.passed, isEmpty);
      expect(data.failed, isEmpty);
      expect(data.allTests, isEmpty);
      expect(data.version, '—');
    });

    test('toJson round-trips correctly', () {
      final original = SuncData.fromJson(fullJson);
      final json = original.toJson();
      final restored = SuncData.fromJson(json);

      expect(restored.version, original.version);
      expect(restored.timeTaken, original.timeTaken);
      expect(restored.executor, original.executor);
      expect(restored.outdated, original.outdated);
      expect(restored.passed.length, original.passed.length);
      expect(restored.failed.length, original.failed.length);
      expect(restored.passed.first.name, original.passed.first.name);
      expect(restored.failed.first.reason, original.failed.first.reason);
    });
  });

  group('SuncRequest', () {
    test('isValid returns true for non-empty values', () {
      const request = SuncRequest(scrap: 'abc', key: 'xyz');
      expect(request.isValid, isTrue);
    });

    test('isValid returns false for empty values', () {
      expect(const SuncRequest(scrap: '', key: 'xyz').isValid, isFalse);
      expect(const SuncRequest(scrap: 'abc', key: '').isValid, isFalse);
      expect(const SuncRequest(scrap: '', key: '').isValid, isFalse);
    });

    test('equality', () {
      const a = SuncRequest(scrap: 'a', key: 'b');
      const b = SuncRequest(scrap: 'a', key: 'b');
      const c = SuncRequest(scrap: 'a', key: 'x');

      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(a.hashCode, equals(b.hashCode));
    });
  });
}
