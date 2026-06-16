import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/cached_result.dart';
import '../../data/models/sunc_data.dart';
import 'repository_provider.dart';

final suncDataProvider =
    FutureProvider.family<CachedResult<SuncData>?, SuncRequest>((ref, request) async {
  if (!request.isValid) return null;

  final repository = ref.watch(weaoRepositoryProvider);
  return repository.getSuncData(scrap: request.scrap, key: request.key);
});
