// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashBoardRepository)
final dashBoardRepositoryProvider = DashBoardRepositoryProvider._();

final class DashBoardRepositoryProvider
    extends
        $FunctionalProvider<
          DashBoardRepository,
          DashBoardRepository,
          DashBoardRepository
        >
    with $Provider<DashBoardRepository> {
  DashBoardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashBoardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashBoardRepositoryHash();

  @$internal
  @override
  $ProviderElement<DashBoardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashBoardRepository create(Ref ref) {
    return dashBoardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashBoardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashBoardRepository>(value),
    );
  }
}

String _$dashBoardRepositoryHash() =>
    r'c269fbe4a05395f2b3c4ee87932fc37e46f73284';
