import 'package:flutter/material.dart';

import '../../../../../core/constants/app_responsive_layout.dart';
import '../widgets/claim_mobile_list.dart';
import '../widgets/claim_web_list.dart';

class ClaimListSection extends StatelessWidget {
  const ClaimListSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppResponsiveLayout.isDesktop(context)) {
      return ClaimWebList();
    }
    return ClaimMobileList();
  }
}
