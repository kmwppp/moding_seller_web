// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClaimSummaryModel _$ClaimSummaryModelFromJson(Map<String, dynamic> json) =>
    _ClaimSummaryModel(
      requested: (json['requested'] as num).toInt(),
      inProgress: (json['inProgress'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
    );

Map<String, dynamic> _$ClaimSummaryModelToJson(_ClaimSummaryModel instance) =>
    <String, dynamic>{
      'requested': instance.requested,
      'inProgress': instance.inProgress,
      'completed': instance.completed,
    };
