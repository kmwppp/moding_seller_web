import 'package:freezed_annotation/freezed_annotation.dart';

import 'action_required.dart';
import 'operation_stats.dart';

part 'dash_board_data.freezed.dart';
part 'dash_board_data.g.dart';

@freezed
abstract class DashboardData with _$DashboardData {
  const factory DashboardData({
    required OperationStats operationStats,
    required ActionRequired actionRequired,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}
