// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_required.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActionRequired _$ActionRequiredFromJson(Map<String, dynamic> json) =>
    _ActionRequired(
      approvalPendingCount: (json['approvalPendingCount'] as num).toInt(),
      readyToShipCount: (json['readyToShipCount'] as num).toInt(),
      shippingDelayedCount: (json['shippingDelayedCount'] as num).toInt(),
    );

Map<String, dynamic> _$ActionRequiredToJson(_ActionRequired instance) =>
    <String, dynamic>{
      'approvalPendingCount': instance.approvalPendingCount,
      'readyToShipCount': instance.readyToShipCount,
      'shippingDelayedCount': instance.shippingDelayedCount,
    };
