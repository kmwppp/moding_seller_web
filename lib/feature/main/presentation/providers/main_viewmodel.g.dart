// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainViewModel)
final mainViewModelProvider = MainViewModelProvider._();

final class MainViewModelProvider
    extends $NotifierProvider<MainViewModel, MainState> {
  MainViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainViewModelHash();

  @$internal
  @override
  MainViewModel create() => MainViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MainState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MainState>(value),
    );
  }
}

String _$mainViewModelHash() => r'f781afcf4f771508f5d61ad032e961e23fe16888';

abstract class _$MainViewModel extends $Notifier<MainState> {
  MainState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MainState, MainState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MainState, MainState>,
              MainState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
