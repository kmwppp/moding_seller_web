import 'package:flutter/material.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

import '../../../../../core/constants/app_colors.dart';

class DeliveryMethodButton extends StatelessWidget {
  const DeliveryMethodButton({
    super.key,
    required this.type,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final bool type;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected
              ? AppColors.pointColor.withOpacity(0.1)
              : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.pointColor : AppColors.mediumGrey,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                type
                    ? "assets/images/icons/truckIcon.png"
                    : "assets/images/icons/carIcon.png",
                width: 40,
                color: isSelected ? AppColors.pointColor : AppColors.darkGrey,
              ),
              SizedBox(height: 6),
              Text(
                label,
                style: context.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.pointColor : AppColors.darkGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
