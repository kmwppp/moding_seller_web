import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_summary_dto.freezed.dart';
part 'tax_summary_dto.g.dart';

@freezed
abstract class TaxSummaryDto with _$TaxSummaryDto {
  const factory TaxSummaryDto({
    @Default(0) int total,
    @Default(0) int sellerToBuyerCount,
    @Default(0) int modingToSellerCount,
  }) = _TaxSummaryDto;

  factory TaxSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$TaxSummaryDtoFromJson(json);
}
