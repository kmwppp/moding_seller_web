// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preparing_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(preparingDataSource)
final preparingDataSourceProvider = PreparingDataSourceProvider._();

final class PreparingDataSourceProvider
    extends
        $FunctionalProvider<
          PreparingDataSource,
          PreparingDataSource,
          PreparingDataSource
        >
    with $Provider<PreparingDataSource> {
  PreparingDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preparingDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preparingDataSourceHash();

  @$internal
  @override
  $ProviderElement<PreparingDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PreparingDataSource create(Ref ref) {
    return preparingDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PreparingDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PreparingDataSource>(value),
    );
  }
}

String _$preparingDataSourceHash() =>
    r'99d30a90efcdf4b179a05d5b4085ee01ea085c47';
