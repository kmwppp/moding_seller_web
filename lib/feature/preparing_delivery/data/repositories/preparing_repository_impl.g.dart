// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preparing_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(preparingRepository)
final preparingRepositoryProvider = PreparingRepositoryProvider._();

final class PreparingRepositoryProvider
    extends
        $FunctionalProvider<
          PreparingRepository,
          PreparingRepository,
          PreparingRepository
        >
    with $Provider<PreparingRepository> {
  PreparingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preparingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preparingRepositoryHash();

  @$internal
  @override
  $ProviderElement<PreparingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PreparingRepository create(Ref ref) {
    return preparingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PreparingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PreparingRepository>(value),
    );
  }
}

String _$preparingRepositoryHash() =>
    r'3c6c3e603e075112b1ae39e1c1ba36796bc1a447';
