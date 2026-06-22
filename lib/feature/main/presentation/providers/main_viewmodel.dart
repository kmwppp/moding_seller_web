import 'package:moding_president_web/feature/main/presentation/providers/main_state.dart';
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

    state = state.copyWith(
      selectedMenu: menu,
      mainScreenModel: MainScreenModel(
        title: menu.label,
        iconUrl: menu.iconUrl,
      ),
    );
  }
}
