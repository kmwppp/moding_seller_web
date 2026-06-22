import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/core/utils/app_enum.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_detail/claim_detail_model.dart';

class ClaimHistorySheet extends StatelessWidget {
  const ClaimHistorySheet({super.key, required this.histories});

  final List<ClaimStatusHistoryModel> histories;

  @override
  Widget build(BuildContext context) {
    final sortedHistories = [...histories]
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return SafeArea(
      top: false,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.72,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
          child: sortedHistories.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    child: Text(
                      '클레임 히스토리가 없습니다.',
                      style: context.body.copyWith(
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: sortedHistories.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final history = sortedHistories[index];
                    final statusLabel = _statusLabel(history.status);

                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCFDFC),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFE5ECE5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                history.createdAt.toDataAndTimeNoLineBreak,
                                style: context.bodySmall.copyWith(
                                  color: AppColors.darkGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF7EF),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  statusLabel,
                                  style: context.bodySmall.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            history.memo.isEmpty ? '-' : history.memo,
                            style: context.body.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  String _statusLabel(String status) {
    switch (status.toUpperCase()) {
      case 'REQUESTED':
        return '클레임접수';
      case 'APPROVED':
        return '클레임승인';
      case 'RESHIP_SHIPPED':
        return '재배송발송';
      case 'REJECTED':
        return '클레임거절';
      case 'APPEALED':
        return '이의신청';
      case 'COMPLETED':
        return '처리완료';
      default:
        return status;
    }
  }
}
