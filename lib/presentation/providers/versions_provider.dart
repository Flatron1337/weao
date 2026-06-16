import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/cached_result.dart';
import '../../data/models/roblox_versions.dart';
import 'repository_provider.dart';

enum VersionChannel { current, future, past }

final versionChannelProvider =
    StateProvider<VersionChannel>((ref) => VersionChannel.current);

final versionsProvider =
    FutureProvider<CachedResult<RobloxVersions>>((ref) async {
  final repository = ref.watch(weaoRepositoryProvider);
  final channel = ref.watch(versionChannelProvider);

  switch (channel) {
    case VersionChannel.current:
      return repository.getCurrentVersions();
    case VersionChannel.future:
      return repository.getFutureVersions();
    case VersionChannel.past:
      return repository.getPastVersions();
  }
});
