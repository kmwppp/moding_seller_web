import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ProductLabel extends StatelessWidget {
  const ProductLabel(
    this.text, {
    super.key,
    this.isTitle = false,
    this.required = false,
    this.caption,
    this.guide,
    this.learnMore,
  });

  final String text;
  final bool isTitle;
  final bool required;
  final String? caption;
  final Widget? guide;
  final Widget? learnMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              text + (required ? ' *' : ''),
              style: isTitle
                  ? context.bodyLarge.copyWith(fontWeight: FontWeight.w700)
                  : context.body.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w600,
                    ),
            ),
            if (guide != null) ...[
              const SizedBox(width: 4),
              AppTooltip(
                content: guide!,
                child: Icon(
                  Icons.help_outline,
                  size: 18,
                  color: AppColors.pointColor,
                ),
              ),
            ],
          ],
        ),
        if (learnMore != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: AppTooltip(
              content: learnMore!,
              child: Text(
                "자세히보기",
                style: context.bodySmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        if (caption != null)
          Text(
            "* $caption",
            style: context.bodySmall.copyWith(color: AppColors.darkGrey),
          ),
      ],
    );
  }
}

class AppTooltip extends StatelessWidget {
  final Widget child;
  final Widget content;
  final TooltipDirection direction;

  const AppTooltip({
    super.key,
    required this.child,
    required this.content,
    this.direction = TooltipDirection.auto,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return GestureDetector(
        onTap: () {
          showDialog<void>(
            context: context,
            builder: (dialogContext) => Dialog(
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(child: content),
                ),
              ),
            ),
          );
        },
        child: child,
      );
    }

    final controller = SuperTooltipController(); // 내부에서 관리

    return SuperTooltip(
      controller: controller,
      positionConfig: PositionConfiguration(
        preferredDirection: direction,
        minimumOutsideMargin: 20.0,
      ),
      style: const TooltipStyle(
        backgroundColor: Colors.white,
        borderColor: Colors.white,
        borderRadius: 10.0,
        hasShadow: true,
        shadowColor: Colors.black26,
        shadowBlurRadius: 20.0,
        bubbleDimensions: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
      ),
      barrierConfig: const BarrierConfiguration(
        show: true,
        color: Colors.transparent,
      ),
      content: content,
      child: GestureDetector(
        onTap: () => controller.showTooltip(),
        child: child,
      ),
    );
  }
}
