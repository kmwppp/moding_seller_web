// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashBoardDataSource)
final dashBoardDataSourceProvider = DashBoardDataSourceProvider._();

final class DashBoardDataSourceProvider
    extends
        $FunctionalProvider<
          DashBoardDataSource,
          DashBoardDataSource,
          DashBoardDataSource
        >
    with $Provider<DashBoardDataSource> {
  DashBoardDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashBoardDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashBoardDataSourceHash();

  @$internal
  @override
  $ProviderElement<DashBoardDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashBoardDataSource create(Ref ref) {
    return dashBoardDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashBoardDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashBoardDataSource>(value),
    );
  }
}

String _$dashBoardDataSourceHash() =>
    r'fb7643485f7ad55c255e9415c16caec4116431bc';
