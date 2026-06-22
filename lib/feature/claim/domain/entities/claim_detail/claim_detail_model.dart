import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/enums/delivery_method.dart';

import '../../enums/claim_enum.dart';
import '../../enums/claim_resolution.dart';
import '../../enums/claim_status.dart';

part 'claim_detail_model.freezed.dart';
part 'claim_detail_model.g.dart';

@freezed
abstract class ClaimDetailModel with _$ClaimDetailModel {
  const factory ClaimDetailModel({
    required int id,
    required String claimCode,
    required int orderId,
    required String orderCode,
    required String buyerBusinessName,
    required ClaimType claimType,
    required String claimReason,
    required ClaimStatus status,

    ClaimResolution? resolution,

    @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)
    DateTime? deliveredAt,

    String? rejectReason,
    String? appealReason,

    @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)
    DateTime? appealDeadlineAt,

    DeliveryMethod? reshipDeliveryMethod,
    String? reshipCourierCode,
    String? reshipTrackingNumber,

    List<DeliveryMethod>? productDeliveryMethods,

    @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)
    DateTime? reshipShippedAt,

    /// 배송지 정보
    String? recipientName,
    String? zipCode,
    String? address,
    String? addressDetail,
    String? phone,
    String? deliveryRequest,

    @Default([]) List<ClaimItemModel> items,

    @JsonKey(name: "photoUrls") @Default([]) List<String> photos,

    @Default([]) List<ClaimStatusHistoryModel> statusHistories,

    @Default([]) List<ClaimTrackingEventModel> reshipTrackingEvents,

    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
    required DateTime createdAt,

    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
    required DateTime updatedAt,
  }) = _ClaimDetailModel;

  factory ClaimDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimDetailModelFromJson(json);
}

DateTime _fromJsonDate(String value) => DateTime.parse(value);

DateTime? _fromJsonDateNullable(String? value) =>
    value == null ? null : DateTime.parse(value);

String _toJsonDate(DateTime date) => date.toIso8601String();

String? _toJsonDateNullable(DateTime? date) => date?.toIso8601String();

@freezed
abstract class ClaimItemModel with _$ClaimItemModel {
  const factory ClaimItemModel({
    required int id,
    required int orderItemId,
    required String productName,
    required String optionName,
    required int unitPrice,
    required int quantity,
    required int claimedQuantity,
    required int refundAmount,
  }) = _ClaimItemModel;

  factory ClaimItemModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimItemModelFromJson(json);
}

@freezed
abstract class ClaimStatusHistoryModel with _$ClaimStatusHistoryModel {
  const factory ClaimStatusHistoryModel({
    required int id,
    required String status,
    required String memo,

    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
    required DateTime createdAt,
  }) = _ClaimStatusHistoryModel;

  factory ClaimStatusHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimStatusHistoryModelFromJson(json);
}

@freezed
abstract class ClaimTrackingEventModel with _$ClaimTrackingEventModel {
  const factory ClaimTrackingEventModel({
    required String timeString,
    required String where,
    required String kind,
    required int level,
  }) = _ClaimTrackingEventModel;

  factory ClaimTrackingEventModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimTrackingEventModelFromJson(json);
}
