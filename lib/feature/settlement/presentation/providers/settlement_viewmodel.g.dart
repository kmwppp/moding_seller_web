// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settlement_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettlementViewModel)
final settlementViewModelProvider = SettlementViewModelProvider._();

final class SettlementViewModelProvider
    extends $NotifierProvider<SettlementViewModel, SettlementState> {
  SettlementViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settlementViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settlementViewModelHash();

  @$internal
  @override
  SettlementViewModel create() => SettlementViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettlementState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettlementState>(value),
    );
  }
}

String _$settlementViewModelHash() =>
    r'924804a36578480b8b3463aed53f0349f21c27f4';

abstract class _$SettlementViewModel extends $Notifier<SettlementState> {
  SettlementState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SettlementState, SettlementState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SettlementState, SettlementState>,
              SettlementState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
