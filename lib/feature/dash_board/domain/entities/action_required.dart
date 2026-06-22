import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_required.freezed.dart';
part 'action_required.g.dart';

@freezed
abstract class ActionRequired with _$ActionRequired {
  const factory ActionRequired({
    required int approvalPendingCount,
    required int readyToShipCount,
    required int shippingDelayedCount,
  }) = _ActionRequired;

  factory ActionRequired.fromJson(Map<String, dynamic> json) =>
      _$ActionRequiredFromJson(json);
}
