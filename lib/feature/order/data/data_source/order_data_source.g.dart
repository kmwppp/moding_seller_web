// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderDataSource)
final orderDataSourceProvider = OrderDataSourceProvider._();

final class OrderDataSourceProvider
    extends
        $FunctionalProvider<OrderDataSource, OrderDataSource, OrderDataSource>
    with $Provider<OrderDataSource> {
  OrderDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderDataSourceHash();

  @$internal
  @override
  $ProviderElement<OrderDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OrderDataSource create(Ref ref) {
    return orderDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderDataSource>(value),
    );
  }
}

String _$orderDataSourceHash() => r'648e50dce3349fa26d49f24aea8b964c053dad1b';
