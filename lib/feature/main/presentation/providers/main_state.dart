import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_president_web/feature/main/presentation/models/main_screen_model.dart';

import '../../../../core/constants/app_strings.dart';
import '../main_page.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const MainState._();

  const factory MainState({
    required MainScreenModel mainScreenModel,
    @Default(MainMenu.dashboard) MainMenu selectedMenu,
  }) = _MainState;

  factory MainState.initial() => MainState(mainScreenModel: MainScreenModel());
}
