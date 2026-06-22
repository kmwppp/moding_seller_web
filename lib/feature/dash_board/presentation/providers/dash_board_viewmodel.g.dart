// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashBoardViewModel)
final dashBoardViewModelProvider = DashBoardViewModelProvider._();

final class DashBoardViewModelProvider
    extends $NotifierProvider<DashBoardViewModel, DashBoardState> {
  DashBoardViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashBoardViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashBoardViewModelHash();

  @$internal
  @override
  DashBoardViewModel create() => DashBoardViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashBoardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashBoardState>(value),
    );
  }
}

String _$dashBoardViewModelHash() =>
    r'92cb43517a9e1b1f5987cbb88c21387adfb6f557';

abstract class _$DashBoardViewModel extends $Notifier<DashBoardState> {
  DashBoardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DashBoardState, DashBoardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DashBoardState, DashBoardState>,
              DashBoardState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
