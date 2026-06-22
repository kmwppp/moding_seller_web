import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_product_summary_model.freezed.dart';
part 'my_product_summary_model.g.dart';

@freezed
abstract class MyProductSummaryModel with _$MyProductSummaryModel {
  const factory MyProductSummaryModel({
    required int total,
    required int active,
    required int inactive,
  }) = _MyProductSummaryModel;

  factory MyProductSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$MyProductSummaryModelFromJson(json);
}
