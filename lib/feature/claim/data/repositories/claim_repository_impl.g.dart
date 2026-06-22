// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(claimRepository)
final claimRepositoryProvider = ClaimRepositoryProvider._();

final class ClaimRepositoryProvider
    extends
        $FunctionalProvider<ClaimRepository, ClaimRepository, ClaimRepository>
    with $Provider<ClaimRepository> {
  ClaimRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'claimRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$claimRepositoryHash();

  @$internal
  @override
  $ProviderElement<ClaimRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClaimRepository create(Ref ref) {
    return claimRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClaimRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClaimRepository>(value),
    );
  }
}

String _$claimRepositoryHash() => r'226a7a55be565a814705887428760e7c21d3ae85';
