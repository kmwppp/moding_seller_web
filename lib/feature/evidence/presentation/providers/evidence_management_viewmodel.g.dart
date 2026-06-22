// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidence_management_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EvidenceManagementViewModel)
final evidenceManagementViewModelProvider =
    EvidenceManagementViewModelProvider._();

final class EvidenceManagementViewModelProvider
    extends
        $NotifierProvider<
          EvidenceManagementViewModel,
          EvidenceManagementState
        > {
  EvidenceManagementViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'evidenceManagementViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$evidenceManagementViewModelHash();

  @$internal
  @override
  EvidenceManagementViewModel create() => EvidenceManagementViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EvidenceManagementState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EvidenceManagementState>(value),
    );
  }
}

String _$evidenceManagementViewModelHash() =>
    r'7f362fdf6bf47c70cd42a92cb3dd5566188c4c96';

abstract class _$EvidenceManagementViewModel
    extends $Notifier<EvidenceManagementState> {
  EvidenceManagementState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<EvidenceManagementState, EvidenceManagementState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EvidenceManagementState, EvidenceManagementState>,
              EvidenceManagementState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
