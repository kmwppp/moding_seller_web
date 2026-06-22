import 'package:moding_president_web/feature/business_profile/domain/entities/business_profile.dart';

String composeBusinessAddress(BusinessProfile profile) {
  final values = <String>[
    if ((profile.zipCode ?? '').trim().isNotEmpty)
      '(${profile.zipCode!.trim()})',
    if ((profile.address ?? '').trim().isNotEmpty) profile.address!.trim(),
    if ((profile.addressDetail ?? '').trim().isNotEmpty)
      profile.addressDetail!.trim(),
  ];

  return values.isEmpty ? '-' : values.join(' ');
}

String composeBusinessIndustry(BusinessProfile profile) {
  final values = <String>[
    if ((profile.industry ?? '').trim().isNotEmpty) profile.industry!.trim(),
    if ((profile.industryClass ?? '').trim().isNotEmpty)
      profile.industryClass!.trim(),
  ];

  return values.isEmpty ? '-' : values.join(' / ');
}

String composeBusinessCategory(BusinessProfile profile) {
  final values = <String>[
    if ((profile.parentCategoryName ?? '').trim().isNotEmpty)
      profile.parentCategoryName!.trim(),
    if ((profile.businessCategoryName ?? '').trim().isNotEmpty)
      profile.businessCategoryName!.trim(),
  ];

  return values.isEmpty ? '-' : values.join(' / ');
}

String valueOrDash(String? value) {
  final text = value?.trim() ?? '';
  return text.isEmpty ? '-' : text;
}

String mapTaxTypeLabel(String? taxType) {
  switch ((taxType ?? '').trim().toUpperCase()) {
    case 'GENERAL':
      return '일반과세자';
    case 'SIMPLIFIED':
      return '간이과세자';
    case 'EXEMPT':
      return '면세사업자';
    default:
      return valueOrDash(taxType);
  }
}
