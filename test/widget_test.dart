import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:weao/app.dart';
import 'package:weao/core/api/weao_api_client.dart';
import 'package:weao/core/l10n/app_strings.dart';
import 'package:weao/data/local/local_storage_service.dart';
import 'package:weao/data/models/exploit.dart';
import 'package:weao/data/repositories/weao_repository.dart';
import 'package:weao/presentation/providers/favorites_provider.dart';
import 'package:weao/presentation/providers/repository_provider.dart';

/// A fake API client that returns canned data without any network I/O.
class FakeWeaoApiClient extends WeaoApiClient {
  FakeWeaoApiClient(this._exploits);

  final List<Exploit> _exploits;

  Map<String, dynamic> _exploitToMap(Exploit e) => <String, dynamic>{
    '_id': e.id,
    'title': e.title,
    'version': e.version,
    'updatedDate': e.updatedDate,
    'uncStatus': e.uncStatus,
    'free': e.free,
    'detected': e.detected,
    'rbxversion': e.rbxversion,
    'updateStatus': e.updateStatus,
  };

  @override
  Future<Map<String, dynamic>> getJsonObject(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final match = _exploits
        .where((e) => e.title == path.split('/').last)
        .firstOrNull;
    if (match != null) return _exploitToMap(match);
    throw Exception('Not found');
  }

  @override
  Future<List<dynamic>> getJsonList(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _exploits.map(_exploitToMap).toList();
  }
}

const _testExploit = Exploit(
  id: '1',
  title: 'TestExploit',
  version: '1.0',
  updatedDate: '2025-01-01',
  uncStatus: true,
  free: true,
  rbxversion: 'v123',
  updateStatus: true,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempCacheDir;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    tempCacheDir = await Directory.systemTemp.createTemp('weao_widget_test_');
  });

  tearDown(() async {
    try {
      if (tempCacheDir.existsSync()) {
        await tempCacheDir.delete(recursive: true);
      }
    } catch (_) {}
  });

  /// Pumps frames until [finder] resolves or a frame budget is exhausted.
  /// Interleaves plain `pump()` (for microtasks / FutureProvider resolution)
  /// with timed pumps (for animations).
  Future<void> pumpUntil(
    WidgetTester tester,
    Finder finder, {
    int maxFrames = 50,
  }) async {
    for (var i = 0; i < maxFrames; i++) {
      await tester.pump();
      if (tester.any(finder)) return;
      await tester.pump(const Duration(milliseconds: 50));
      if (tester.any(finder)) return;
    }
  }

  Future<Widget> buildApp({
    List<Exploit> exploits = const [_testExploit],
    Set<String> favorites = const {},
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final storage = LocalStorageService(prefs, tempCacheDir);
    final apiClient = FakeWeaoApiClient(exploits);
    final repository = WeaoRepository(apiClient, storage);

    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        localStorageServiceProvider.overrideWithValue(storage),
        favoritesSeedProvider.overrideWithValue(favorites),
        weaoApiClientProvider.overrideWithValue(apiClient),
        weaoRepositoryProvider.overrideWithValue(repository),
      ],
      child: const WeaoApp(),
    );
  }

  testWidgets('App renders exploits tab with filter labels', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(await buildApp());
    await pumpUntil(tester, find.text(AppStrings.filterFavorites));

    expect(find.text(AppStrings.tabExploits), findsWidgets);
    expect(find.text(AppStrings.filterFreeOnly), findsOneWidget);
    expect(find.text(AppStrings.filterFavorites), findsOneWidget);
  });
}
