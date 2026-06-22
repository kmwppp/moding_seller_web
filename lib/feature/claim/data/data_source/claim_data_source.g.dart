// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(claimDataSource)
final claimDataSourceProvider = ClaimDataSourceProvider._();

final class ClaimDataSourceProvider
    extends
        $FunctionalProvider<ClaimDataSource, ClaimDataSource, ClaimDataSource>
    with $Provider<ClaimDataSource> {
  ClaimDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'claimDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$claimDataSourceHash();

  @$internal
  @override
  $ProviderElement<ClaimDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClaimDataSource create(Ref ref) {
    return claimDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClaimDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClaimDataSource>(value),
    );
  }
}

String _$claimDataSourceHash() => r'36624f8a0efdd06804f27e851160b3ecf756040d';
