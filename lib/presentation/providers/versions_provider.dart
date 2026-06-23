import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/cached_result.dart';
import '../../data/models/roblox_versions.dart';
import 'repository_provider.dart';

part 'versions_provider.g.dart';

enum VersionChannel { current, future, past }

@riverpod
class VersionChannelNotifier extends _$VersionChannelNotifier {
  @override
  VersionChannel build() => VersionChannel.current;

  void setChannel(VersionChannel channel) {
    state = channel;
  }
}

@riverpod
Future<CachedResult<RobloxVersions>> versions(Ref ref) async {
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
}
