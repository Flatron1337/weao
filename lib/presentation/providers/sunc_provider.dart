import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/cached_result.dart';
import '../../data/models/sunc_data.dart';
import 'repository_provider.dart';

part 'sunc_provider.g.dart';

@riverpod
Future<CachedResult<SuncData>?> suncData(Ref ref, SuncRequest request) async {
  if (!request.isValid) return null;

  final repository = ref.watch(weaoRepositoryProvider);
  return repository.getSuncData(scrap: request.scrap, key: request.key);
}
