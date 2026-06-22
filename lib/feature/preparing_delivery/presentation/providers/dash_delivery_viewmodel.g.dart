// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_delivery_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashDeliveryViewModel)
final dashDeliveryViewModelProvider = DashDeliveryViewModelFamily._();

final class DashDeliveryViewModelProvider
    extends $NotifierProvider<DashDeliveryViewModel, DashDeliveryState> {
  DashDeliveryViewModelProvider._({
    required DashDeliveryViewModelFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'dashDeliveryViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dashDeliveryViewModelHash();

  @override
  String toString() {
    return r'dashDeliveryViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DashDeliveryViewModel create() => DashDeliveryViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashDeliveryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashDeliveryState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DashDeliveryViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dashDeliveryViewModelHash() =>
    r'4a3f0d65714d96cf5bd790c4fafabf9fbddb2cf4';

final class DashDeliveryViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          DashDeliveryViewModel,
          DashDeliveryState,
          DashDeliveryState,
          DashDeliveryState,
          String?
        > {
  DashDeliveryViewModelFamily._()
    : super(
        retry: null,
        name: r'dashDeliveryViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DashDeliveryViewModelProvider call(String? orderId) =>
      DashDeliveryViewModelProvider._(argument: orderId, from: this);

  @override
  String toString() => r'dashDeliveryViewModelProvider';
}

abstract class _$DashDeliveryViewModel extends $Notifier<DashDeliveryState> {
  late final _$args = ref.$arg as String?;
  String? get orderId => _$args;

  DashDeliveryState build(String? orderId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DashDeliveryState, DashDeliveryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DashDeliveryState, DashDeliveryState>,
              DashDeliveryState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
