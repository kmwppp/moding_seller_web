// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_register_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductRegisterViewModel)
final productRegisterViewModelProvider = ProductRegisterViewModelFamily._();

final class ProductRegisterViewModelProvider
    extends $NotifierProvider<ProductRegisterViewModel, ProductRegisterState> {
  ProductRegisterViewModelProvider._({
    required ProductRegisterViewModelFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'productRegisterViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productRegisterViewModelHash();

  @override
  String toString() {
    return r'productRegisterViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductRegisterViewModel create() => ProductRegisterViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRegisterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRegisterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductRegisterViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productRegisterViewModelHash() =>
    r'e3bdafb28152bccd15d1612451b179e12baa8258';

final class ProductRegisterViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductRegisterViewModel,
          ProductRegisterState,
          ProductRegisterState,
          ProductRegisterState,
          String?
        > {
  ProductRegisterViewModelFamily._()
    : super(
        retry: null,
        name: r'productRegisterViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductRegisterViewModelProvider call(String? productId) =>
      ProductRegisterViewModelProvider._(argument: productId, from: this);

  @override
  String toString() => r'productRegisterViewModelProvider';
}

abstract class _$ProductRegisterViewModel
    extends $Notifier<ProductRegisterState> {
  late final _$args = ref.$arg as String?;
  String? get productId => _$args;

  ProductRegisterState build(String? productId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductRegisterState, ProductRegisterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductRegisterState, ProductRegisterState>,
              ProductRegisterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
