// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sunc_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(suncData)
final suncDataProvider = SuncDataFamily._();

final class SuncDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<CachedResult<SuncData>?>,
          CachedResult<SuncData>?,
          FutureOr<CachedResult<SuncData>?>
        >
    with
        $FutureModifier<CachedResult<SuncData>?>,
        $FutureProvider<CachedResult<SuncData>?> {
  SuncDataProvider._({
    required SuncDataFamily super.from,
    required SuncRequest super.argument,
  }) : super(
         retry: null,
         name: r'suncDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$suncDataHash();

  @override
  String toString() {
    return r'suncDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CachedResult<SuncData>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CachedResult<SuncData>?> create(Ref ref) {
    final argument = this.argument as SuncRequest;
    return suncData(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SuncDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$suncDataHash() => r'fa428b04c8f7d61fa903790a4c3ba0e350aed174';

final class SuncDataFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CachedResult<SuncData>?>,
          SuncRequest
        > {
  SuncDataFamily._()
    : super(
        retry: null,
        name: r'suncDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SuncDataProvider call(SuncRequest request) =>
      SuncDataProvider._(argument: request, from: this);

  @override
  String toString() => r'suncDataProvider';
}
