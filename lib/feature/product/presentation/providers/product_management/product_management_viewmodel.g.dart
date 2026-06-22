// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_management_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductManagementViewModel)
final productManagementViewModelProvider =
    ProductManagementViewModelProvider._();

final class ProductManagementViewModelProvider
    extends
        $NotifierProvider<ProductManagementViewModel, ProductManagementState> {
  ProductManagementViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productManagementViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productManagementViewModelHash();

  @$internal
  @override
  ProductManagementViewModel create() => ProductManagementViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductManagementState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductManagementState>(value),
    );
  }
}

String _$productManagementViewModelHash() =>
    r'49ac5254ad4fd6e5b3875589d9f587577a3bcbfb';

abstract class _$ProductManagementViewModel
    extends $Notifier<ProductManagementState> {
  ProductManagementState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ProductManagementState, ProductManagementState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductManagementState, ProductManagementState>,
              ProductManagementState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
