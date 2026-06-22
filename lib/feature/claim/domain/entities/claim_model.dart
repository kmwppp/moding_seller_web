import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/claim_enum.dart';
import '../enums/claim_status.dart';

part 'claim_model.freezed.dart';
part 'claim_model.g.dart';

@freezed
abstract class ClaimModel with _$ClaimModel {
  const factory ClaimModel({
    @Default(0) int id,
    @Default(0) int orderId,
    @Default('') String claimCode,
    @Default('') String productName,
    @JsonKey(unknownEnumValue: ClaimType.CONDITION)
    @Default(ClaimType.CONDITION)
    ClaimType claimType,
    @Default('') String claimReason,

    @JsonKey(unknownEnumValue: ClaimStatus.requested)
    @Default(ClaimStatus.requested)
    ClaimStatus status,

    @Default('') String resolution,
    // @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
    // required DateTime appealDeadlineAt,
    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
    required DateTime createdAt,
  }) = _ClaimModel;

  factory ClaimModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimModelFromJson(json);
}

DateTime _fromJsonDate(String value) => DateTime.parse(value);

String _toJsonDate(DateTime date) => date.toIso8601String();
