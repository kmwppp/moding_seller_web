// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderSummaryModel _$OrderSummaryModelFromJson(Map<String, dynamic> json) =>
    _OrderSummaryModel(
      total: (json['total'] as num).toInt(),
      ordered: (json['ordered'] as num).toInt(),
      confirmed: (json['confirmed'] as num).toInt(),
      shipped: (json['shipped'] as num).toInt(),
      delivered: (json['delivered'] as num).toInt(),
      claimInProgress: (json['claimInProgress'] as num).toInt(),
    );

Map<String, dynamic> _$OrderSummaryModelToJson(_OrderSummaryModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'ordered': instance.ordered,
      'confirmed': instance.confirmed,
      'shipped': instance.shipped,
      'delivered': instance.delivered,
      'claimInProgress': instance.claimInProgress,
    };
