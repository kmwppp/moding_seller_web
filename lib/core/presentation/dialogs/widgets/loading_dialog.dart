import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
    );
  }
}
