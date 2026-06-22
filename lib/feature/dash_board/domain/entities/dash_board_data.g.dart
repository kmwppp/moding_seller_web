// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    _DashboardData(
      operationStats: OperationStats.fromJson(
        json['operationStats'] as Map<String, dynamic>,
      ),
      actionRequired: ActionRequired.fromJson(
        json['actionRequired'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DashboardDataToJson(_DashboardData instance) =>
    <String, dynamic>{
      'operationStats': instance.operationStats,
      'actionRequired': instance.actionRequired,
    };
