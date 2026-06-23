import 'package:moding_seller_web/feature/product/domain/entities/delivery_district_option.dart';

class DirectDeliveryDistrict {
  const DirectDeliveryDistrict({
    required this.code,
    required this.province,
    required this.name,
  });

  final String code;
  final String province;
  final String name;

  factory DirectDeliveryDistrict.fromJson(Map<String, dynamic> json) {
    return DirectDeliveryDistrict(
      code: json['code']?.toString() ?? '',
      province: json['province']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
  }

  DeliveryDistrictOption toOption() {
    return DeliveryDistrictOption(
      code: code,
      province: province,
      name: name,
    );
  }
}
