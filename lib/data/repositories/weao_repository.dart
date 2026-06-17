import '../../core/api/weao_api_client.dart';
import '../../core/utils/app_logger.dart';
import '../local/local_storage_service.dart';
import '../models/cached_result.dart';
import '../models/exploit.dart';
import '../models/roblox_versions.dart';
import '../models/sunc_data.dart';

class WeaoRepository {
  WeaoRepository(this._client, this._storage);

  final WeaoApiClient _client;
  final LocalStorageService _storage;

  static const _exploitsCacheFile = 'exploits.json';

  Future<CachedResult<List<Exploit>>> getExploits() async {
    try {
      final data = await _client.getJsonList('/api/status/exploits');
      await _storage.saveJsonCache(_exploitsCacheFile, data);
      return CachedResult(
        data: _parseExploits(data),
        cachedAt: DateTime.now(),
      );
    } catch (e) {
      final cached = await _storage.loadJsonCache(_exploitsCacheFile);
      if (cached != null && cached.data is List) {
        return CachedResult(
          data: _parseExploits(cached.data as List),
          isStale: true,
          cachedAt: cached.cachedAt,
          error: e,
        );
      }
      rethrow;
    }
  }

  /// Fetches a single exploit by name. Falls back to the per-exploit cache on
  /// error, returning a [CachedResult] flagged as stale so the detail screen
  /// can still render offline data (consistent with the other endpoints).
  Future<CachedResult<Exploit>> getExploit(String name) async {
    final cacheFile = 'exploit_$name.json';
    try {
      final data =
          await _client.getJsonObject('/api/status/exploits/$name');
      await _storage.saveJsonCache(cacheFile, data);
      return CachedResult(
        data: Exploit.fromJson(data),
        cachedAt: DateTime.now(),
      );
    } catch (e) {
      final cached = await _storage.loadJsonCache(cacheFile);
      if (cached != null && cached.data is Map) {
        return CachedResult(
          data: Exploit.fromJson(
            Map<String, dynamic>.from(cached.data as Map),
          ),
          isStale: true,
          cachedAt: cached.cachedAt,
          error: e,
        );
      }
      rethrow;
    }
  }

  Future<CachedResult<RobloxVersions>> getCurrentVersions() {
    return _getVersions('current', '/api/versions/current');
  }

  Future<CachedResult<RobloxVersions>> getFutureVersions() {
    return _getVersions('future', '/api/versions/future');
  }

  Future<CachedResult<RobloxVersions>> getPastVersions() {
    return _getVersions('past', '/api/versions/past');
  }

  Future<CachedResult<SuncData>> getSuncData({
    required String scrap,
    required String key,
  }) async {
    final cacheFile = 'sunc_$scrap.json';
    try {
      final data = await _client.getJsonObject(
        '/api/sunc',
        queryParameters: {'scrap': scrap, 'key': key},
      );
      await _storage.saveJsonCache(cacheFile, data);
      return CachedResult(
        data: SuncData.fromJson(data),
        cachedAt: DateTime.now(),
      );
    } catch (e) {
      final cached = await _storage.loadJsonCache(cacheFile);
      if (cached != null && cached.data is Map) {
        return CachedResult(
          data: SuncData.fromJson(
            Map<String, dynamic>.from(cached.data as Map),
          ),
          isStale: true,
          cachedAt: cached.cachedAt,
          error: e,
        );
      }
      rethrow;
    }
  }

  Future<CachedResult<RobloxVersions>> _getVersions(
    String channel,
    String path,
  ) async {
    final cacheFile = 'versions_$channel.json';
    try {
      final data = await _client.getJsonObject(path);
      await _storage.saveJsonCache(cacheFile, data);
      return CachedResult(
        data: RobloxVersions.fromJson(data),
        cachedAt: DateTime.now(),
      );
    } catch (e) {
      final cached = await _storage.loadJsonCache(cacheFile);
      if (cached != null && cached.data is Map) {
        return CachedResult(
          data: RobloxVersions.fromJson(
            Map<String, dynamic>.from(cached.data as Map),
          ),
          isStale: true,
          cachedAt: cached.cachedAt,
          error: e,
        );
      }
      rethrow;
    }
  }

  List<Exploit> _parseExploits(List<dynamic> data) {
    final parsed = <Exploit>[];
    for (final item in data) {
      if (item is! Map) continue;
      try {
        parsed.add(Exploit.fromJson(Map<String, dynamic>.from(item)));
      } catch (e, st) {
        // Skip malformed entries instead of failing the whole list.
        AppLogger.warning('Failed to parse exploit entry', error: e, stackTrace: st);
      }
    }
    return parsed
        .where((e) => !e.hidden)
        .toList()
      ..sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
  }
}
