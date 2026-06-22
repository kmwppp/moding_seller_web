// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_management_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderManagementViewModel)
final orderManagementViewModelProvider = OrderManagementViewModelProvider._();

final class OrderManagementViewModelProvider
    extends $NotifierProvider<OrderManagementViewModel, OrderManagementState> {
  OrderManagementViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderManagementViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderManagementViewModelHash();

  @$internal
  @override
  OrderManagementViewModel create() => OrderManagementViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderManagementState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderManagementState>(value),
    );
  }
}

String _$orderManagementViewModelHash() =>
    r'307b979d14eb2c686cb177ed22736974e1f26ea2';

abstract class _$OrderManagementViewModel
    extends $Notifier<OrderManagementState> {
  OrderManagementState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OrderManagementState, OrderManagementState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrderManagementState, OrderManagementState>,
              OrderManagementState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
