import '../../core/api/weao_api_client.dart';
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
      final data = await _client.get('/api/status/exploits');
      if (data is! List) {
        return CachedResult(data: []);
      }
      await _storage.saveJsonCache(_exploitsCacheFile, data);
      return CachedResult(
        data: _parseExploits(data),
        isStale: false,
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

  Future<Exploit> getExploit(String name) async {
    final data = await _client.get('/api/status/exploits/$name');
    if (data is! Map) {
      throw Exception('Invalid response');
    }
    return Exploit.fromJson(Map<String, dynamic>.from(data));
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
      final data = await _client.get(
        '/api/sunc',
        queryParameters: {'scrap': scrap, 'key': key},
      );
      if (data is! Map) {
        throw Exception('Invalid sUNC response');
      }
      final map = Map<String, dynamic>.from(data);
      await _storage.saveJsonCache(cacheFile, map);
      return CachedResult(
        data: SuncData.fromJson(map),
        isStale: false,
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
      final data = await _client.get(path);
      if (data is! Map) {
        return CachedResult(data: const RobloxVersions(platforms: []));
      }
      final map = Map<String, dynamic>.from(data);
      await _storage.saveJsonCache(cacheFile, map);
      return CachedResult(
        data: RobloxVersions.fromJson(map),
        isStale: false,
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
    return data
        .whereType<Map>()
        .map((item) => Exploit.fromJson(Map<String, dynamic>.from(item)))
        .where((e) => !e.hidden)
        .toList()
      ..sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
  }
}
