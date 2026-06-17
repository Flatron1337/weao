import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:weao/core/api/weao_api_client.dart';
import 'package:weao/core/errors/weao_exception.dart';
import 'package:weao/data/local/local_storage_service.dart';
import 'package:weao/data/repositories/weao_repository.dart';

/// Fake API client that returns canned responses or throws, without I/O.
class FakeWeaoApiClient extends WeaoApiClient {
  FakeWeaoApiClient({this.exploitsJson, this.shouldThrow = false});

  final List<dynamic>? exploitsJson;
  final bool shouldThrow;

  int callCount = 0;

  @override
  Future<List<dynamic>> getJsonList(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    callCount++;
    if (shouldThrow) {
      throw WeaoException('offline', kind: WeaoExceptionKind.noConnection);
    }
    return exploitsJson ?? [];
  }
}

Future<WeaoRepository> _buildRepository(
  FakeWeaoApiClient client,
  Directory cacheDir,
) async {
  // SharedPreferences is mocked per-call; only the cache directory matters
  // for these tests.
  final prefs = await SharedPreferences.getInstance();
  return WeaoRepository(
    client,
    LocalStorageService(prefs, cacheDir),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory tempDir;
  late FakeWeaoApiClient client;
  late WeaoRepository repository;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    tempDir = await Directory.systemTemp.createTemp('weao_repo_test_');
    client = FakeWeaoApiClient(
      exploitsJson: [
        const {
          '_id': '1',
          'title': 'Bravo',
          'version': '1.0',
          'updatedDate': '2025-01-01',
          'uncStatus': true,
          'free': true,
          'detected': false,
          'rbxversion': 'v1',
          'updateStatus': true,
        },
        const {
          '_id': '2',
          'title': 'Alpha',
          'version': '2.0',
          'updatedDate': '2025-01-02',
          'uncStatus': false,
          'free': false,
          'detected': true,
          'rbxversion': 'v2',
          'updateStatus': false,
          'hidden': true,
        },
      ],
    );
    repository = await _buildRepository(client, tempDir);
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('WeaoRepository.getExploits', () {
    test('returns fresh sorted data on success', () async {
      final result = await repository.getExploits();

      expect(result.isStale, isFalse);
      expect(result.cachedAt, isNotNull);
      // Hidden exploits are filtered out.
      expect(result.data.length, 1);
      // Sorted alphabetically by title.
      expect(result.data.single.title, 'Bravo');
    });

    test('skips malformed entries without failing the whole list', () async {
      client = FakeWeaoApiClient(
        exploitsJson: [
          const {'title': 'Good'},
          'not-a-map', // malformed, skipped
          const {'title': 'AlsoGood'},
        ],
      );
      repository = await _buildRepository(client, tempDir);

      final result = await repository.getExploits();

      expect(result.data.length, 2);
      expect(result.data.map((e) => e.title), containsAll(['Good', 'AlsoGood']));
    });

    test('falls back to cache and marks stale on error', () async {
      // Prime the cache with a successful call.
      await repository.getExploits();
      expect(client.callCount, 1);

      // Now make the API throw.
      client = FakeWeaoApiClient(shouldThrow: true);
      repository = await _buildRepository(client, tempDir);

      final result = await repository.getExploits();

      expect(result.isStale, isTrue);
      expect(result.cachedAt, isNotNull);
      expect(result.error, isNotNull);
      expect(result.data.length, 1); // cached Bravo
      expect(result.data.single.title, 'Bravo');
    });

    test('rethrows when no cache available on error', () async {
      client = FakeWeaoApiClient(shouldThrow: true);
      repository = await _buildRepository(client, tempDir);

      expect(
        () => repository.getExploits(),
        throwsA(isA<WeaoException>()),
      );
    });
  });
}
