// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_detail_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ClaimDetailViewModel)
final claimDetailViewModelProvider = ClaimDetailViewModelFamily._();

final class ClaimDetailViewModelProvider
    extends $NotifierProvider<ClaimDetailViewModel, ClaimDetailState> {
  ClaimDetailViewModelProvider._({
    required ClaimDetailViewModelFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'claimDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$claimDetailViewModelHash();

  @override
  String toString() {
    return r'claimDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ClaimDetailViewModel create() => ClaimDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClaimDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClaimDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ClaimDetailViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$claimDetailViewModelHash() =>
    r'2600fae5828c38260bb36f656c9ead3d9a6b01a0';

final class ClaimDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ClaimDetailViewModel,
          ClaimDetailState,
          ClaimDetailState,
          ClaimDetailState,
          String?
        > {
  ClaimDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'claimDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ClaimDetailViewModelProvider call(String? claimId) =>
      ClaimDetailViewModelProvider._(argument: claimId, from: this);

  @override
  String toString() => r'claimDetailViewModelProvider';
}

abstract class _$ClaimDetailViewModel extends $Notifier<ClaimDetailState> {
  late final _$args = ref.$arg as String?;
  String? get claimId => _$args;

  ClaimDetailState build(String? claimId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ClaimDetailState, ClaimDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ClaimDetailState, ClaimDetailState>,
              ClaimDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
