import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_summary_model.freezed.dart';
part 'claim_summary_model.g.dart';

@freezed
abstract class ClaimSummaryModel with _$ClaimSummaryModel {
  const factory ClaimSummaryModel({
    required int requested,
    required int inProgress,
    required int completed,
  }) = _ClaimSummaryModel;

  factory ClaimSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ClaimSummaryModelFromJson(json);
}
