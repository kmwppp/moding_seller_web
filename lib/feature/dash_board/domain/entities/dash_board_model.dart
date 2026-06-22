import 'package:freezed_annotation/freezed_annotation.dart';

import 'dash_board_data.dart';

part 'dash_board_model.freezed.dart';
part 'dash_board_model.g.dart';

@freezed
abstract class DashBoardModel with _$DashBoardModel {
  const factory DashBoardModel({required DashboardData data}) = _DashBoardModel;

  factory DashBoardModel.fromJson(Map<String, dynamic> json) =>
      _$DashBoardModelFromJson(json);
}
