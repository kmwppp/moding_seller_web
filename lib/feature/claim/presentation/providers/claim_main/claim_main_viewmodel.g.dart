// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_main_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ClaimMainViewModel)
final claimMainViewModelProvider = ClaimMainViewModelProvider._();

final class ClaimMainViewModelProvider
    extends $NotifierProvider<ClaimMainViewModel, ClaimMainState> {
  ClaimMainViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'claimMainViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$claimMainViewModelHash();

  @$internal
  @override
  ClaimMainViewModel create() => ClaimMainViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClaimMainState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClaimMainState>(value),
    );
  }
}

String _$claimMainViewModelHash() =>
    r'f37f10afe1cf1d0a8ce5dfeeb17cd72db8303341';

abstract class _$ClaimMainViewModel extends $Notifier<ClaimMainState> {
  ClaimMainState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ClaimMainState, ClaimMainState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ClaimMainState, ClaimMainState>,
              ClaimMainState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
