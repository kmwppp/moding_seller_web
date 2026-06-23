import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_strings.dart';

part 'main_screen_model.freezed.dart';

@freezed
abstract class MainScreenModel with _$MainScreenModel {
  const factory MainScreenModel({
    @Default(AppStrings.dashBoard) String title,
    @Default("assets/images/icons/homeIcon.png") String iconUrl,
  }) = _MainScreenModel;
}
