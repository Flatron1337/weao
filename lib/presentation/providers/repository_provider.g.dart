// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'0fb0f4db2208b78d9c9145870e7168da608ae359';

@ProviderFor(localStorageService)
final localStorageServiceProvider = LocalStorageServiceProvider._();

final class LocalStorageServiceProvider
    extends
        $FunctionalProvider<
          LocalStorageService,
          LocalStorageService,
          LocalStorageService
        >
    with $Provider<LocalStorageService> {
  LocalStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localStorageServiceHash();

  @$internal
  @override
  $ProviderElement<LocalStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalStorageService create(Ref ref) {
    return localStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalStorageService>(value),
    );
  }
}

String _$localStorageServiceHash() =>
    r'44802982a66a1f134a706a216757e197947967c9';

@ProviderFor(weaoApiClient)
final weaoApiClientProvider = WeaoApiClientProvider._();

final class WeaoApiClientProvider
    extends $FunctionalProvider<WeaoApiClient, WeaoApiClient, WeaoApiClient>
    with $Provider<WeaoApiClient> {
  WeaoApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weaoApiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weaoApiClientHash();

  @$internal
  @override
  $ProviderElement<WeaoApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WeaoApiClient create(Ref ref) {
    return weaoApiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeaoApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeaoApiClient>(value),
    );
  }
}

String _$weaoApiClientHash() => r'fa3fbe9617d7f707d6ee99eb73401572357d7420';

@ProviderFor(weaoRepository)
final weaoRepositoryProvider = WeaoRepositoryProvider._();

final class WeaoRepositoryProvider
    extends $FunctionalProvider<WeaoRepository, WeaoRepository, WeaoRepository>
    with $Provider<WeaoRepository> {
  WeaoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weaoRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weaoRepositoryHash();

  @$internal
  @override
  $ProviderElement<WeaoRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WeaoRepository create(Ref ref) {
    return weaoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeaoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeaoRepository>(value),
    );
  }
}

String _$weaoRepositoryHash() => r'45501de8ab588f9617e2986bd6e5b8f637d9b436';
