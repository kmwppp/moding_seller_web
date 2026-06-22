// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_validation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackingValidationResult _$TrackingValidationResultFromJson(
  Map<String, dynamic> json,
) => _TrackingValidationResult(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? null
      : TrackingValidationData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TrackingValidationResultToJson(
  _TrackingValidationResult instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_TrackingValidationData _$TrackingValidationDataFromJson(
  Map<String, dynamic> json,
) => _TrackingValidationData(
  state: json['state'] as String?,
  message: json['message'] as String?,
  isValid: json['isValid'] as bool?,
  isRecipientMismatch: json['isRecipientMismatch'] as bool?,
);

Map<String, dynamic> _$TrackingValidationDataToJson(
  _TrackingValidationData instance,
) => <String, dynamic>{
  'state': instance.state,
  'message': instance.message,
  'isValid': instance.isValid,
  'isRecipientMismatch': instance.isRecipientMismatch,
};
