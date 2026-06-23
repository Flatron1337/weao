import 'package:hive_ce/hive.dart';

part 'hive_models.g.dart';

@HiveType(typeId: 0)
class HiveFavorite extends HiveObject {
  @HiveField(0)
  final String title;

  HiveFavorite({required this.title});
}

@HiveType(typeId: 1)
class HiveCachedResult extends HiveObject {
  @HiveField(0)
  final String path;

  @HiveField(1)
  final String jsonBody;

  @HiveField(2)
  final DateTime cachedAt;

  HiveCachedResult({
    required this.path,
    required this.jsonBody,
    required this.cachedAt,
  });
}
