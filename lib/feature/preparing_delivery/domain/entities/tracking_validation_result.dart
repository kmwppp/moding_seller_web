import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_validation_result.freezed.dart';
part 'tracking_validation_result.g.dart';

@freezed
abstract class TrackingValidationResult with _$TrackingValidationResult {
  const factory TrackingValidationResult({
    @Default(false) bool success,
    @Default('') String message,
    TrackingValidationData? data,
  }) = _TrackingValidationResult;

  factory TrackingValidationResult.fromJson(Map<String, dynamic> json) =>
      _$TrackingValidationResultFromJson(json);
}

@freezed
abstract class TrackingValidationData with _$TrackingValidationData {
  const factory TrackingValidationData({
    String? state,
    String? message,
    bool? isValid,
    bool? isRecipientMismatch,
  }) = _TrackingValidationData;

  factory TrackingValidationData.fromJson(Map<String, dynamic> json) =>
      _$TrackingValidationDataFromJson(json);
}
