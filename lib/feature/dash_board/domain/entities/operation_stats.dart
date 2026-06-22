import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_stats.freezed.dart';
part 'operation_stats.g.dart';

@freezed
abstract class OperationStats with _$OperationStats {
  const factory OperationStats({
    required int thisMonthSales,
    required int confirmedSettlementAmount,
    required int scheduledSettlementAmount,
    required int readyToShipCount,
    required int shippingCount,
  }) = _OperationStats;

  factory OperationStats.fromJson(Map<String, dynamic> json) =>
      _$OperationStatsFromJson(json);
}
