// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'versions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VersionChannelNotifier)
final versionChannelProvider = VersionChannelNotifierProvider._();

final class VersionChannelNotifierProvider
    extends $NotifierProvider<VersionChannelNotifier, VersionChannel> {
  VersionChannelNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'versionChannelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$versionChannelNotifierHash();

  @$internal
  @override
  VersionChannelNotifier create() => VersionChannelNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VersionChannel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VersionChannel>(value),
    );
  }
}

String _$versionChannelNotifierHash() =>
    r'78b7ee2226ab1dd2f0233dec760161713ac87000';

abstract class _$VersionChannelNotifier extends $Notifier<VersionChannel> {
  VersionChannel build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<VersionChannel, VersionChannel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VersionChannel, VersionChannel>,
              VersionChannel,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(versions)
final versionsProvider = VersionsProvider._();

final class VersionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<CachedResult<RobloxVersions>>,
          CachedResult<RobloxVersions>,
          FutureOr<CachedResult<RobloxVersions>>
        >
    with
        $FutureModifier<CachedResult<RobloxVersions>>,
        $FutureProvider<CachedResult<RobloxVersions>> {
  VersionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'versionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$versionsHash();

  @$internal
  @override
  $FutureProviderElement<CachedResult<RobloxVersions>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CachedResult<RobloxVersions>> create(Ref ref) {
    return versions(ref);
  }
}

String _$versionsHash() => r'becaf806bdcb61baf7df82629408c8143336fb06';
