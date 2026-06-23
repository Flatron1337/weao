import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_models.dart';

class HiveService {
  static const String _favoritesBox = 'favorites_box';
  static const String _cacheBox = 'cache_box';

  static Future<void> init([String? testPath]) async {
    final dirPath = testPath ?? (await getApplicationDocumentsDirectory()).path;
    Hive.init(dirPath);
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(HiveFavoriteAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(HiveCachedResultAdapter());

    await Hive.openBox<HiveFavorite>(_favoritesBox);
    await Hive.openBox<HiveCachedResult>(_cacheBox);
  }

  static Box<HiveFavorite> get favorites => Hive.box<HiveFavorite>(_favoritesBox);
  static Box<HiveCachedResult> get cache => Hive.box<HiveCachedResult>(_cacheBox);
}
