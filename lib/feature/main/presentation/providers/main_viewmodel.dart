import 'dart:async';

import 'package:moding_seller_web/feature/business_profile/presentation/providers/business_profile_viewmodel.dart';
import 'package:moding_seller_web/feature/main/presentation/providers/main_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../main_page.dart';
import '../models/main_screen_model.dart';

part 'main_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class MainViewModel extends _$MainViewModel {
  @override
  MainState build() {
    return MainState.initial();
  }

  void resetToDashboard() {
    state = state.copyWith(
      selectedMenu: MainMenu.dashboard,
      mainScreenModel: MainScreenModel(
        title: MainMenu.dashboard.label,
        iconUrl: MainMenu.dashboard.iconUrl,
      ),
    );
  }

  void selectMenu(MainMenu menu) {
    if (menu == MainMenu.moveToPurchase) {
      // TODO 구매페이지 이동
      return;
    }

    if (menu == MainMenu.setting) {
      unawaited(
        ref
            .read(businessProfileViewModelProvider.notifier)
            .requireReauthOnEntry(),
      );
    }

    state = state.copyWith(
      selectedMenu: menu,
      mainScreenModel: MainScreenModel(
        title: menu.label,
        iconUrl: menu.iconUrl,
      ),
    );
  }
}
