import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SettlementPeriodSelectorSection extends StatelessWidget {
  const SettlementPeriodSelectorSection({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onRangeSelected,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final void Function(DateTime start, DateTime end) onRangeSelected;

  @override
  Widget build(BuildContext context) {
    final start = startDate ?? DateTime.now();
    final end = endDate ?? DateTime.now().add(const Duration(days: 30));

    final periodText = _formatRange(start, end);

    return InkWell(
      onTap: () async {
        await showTableCalendarRangePicker(
          context: context,
          startDate: startDate ?? DateTime.now(),
          endDate: endDate ?? DateTime.now(),
          onRangeSelected: (start, end) {
            onRangeSelected(start, end);
          },
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: AppBoxStyles.borderBox,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '조회 기간',
                    style: context.bodySmall.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    periodText,
                    style: context.body.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F8F3),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '변경',
                    style: context.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showTableCalendarRangePicker({
    required BuildContext context,
    required DateTime startDate,
    required DateTime endDate,
    required Function(DateTime start, DateTime end) onRangeSelected,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        DateTime? rangeStart = startDate;
        DateTime? rangeEnd = endDate;
        DateTime focusedDay = startDate;
        String? selectedPreset = _resolvePresetLabel(startDate, endDate);

        return StatefulBuilder(
          builder: (context, setState) {
            final previewText = _formatRange(rangeStart, rangeEnd);

            return Dialog(
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 22, 22, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '기간 선택',
                        style: context.title.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '빠른 선택이나 달력으로 조회 기간을 정해주세요.',
                        style: context.bodySmall.copyWith(
                          color: AppColors.darkGrey,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6FAF4),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0xFFE4EEE1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '선택 중인 기간',
                              style: context.bodySmall.copyWith(
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              previewText,
                              style: context.bodyLarge.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _QuickRangeChip(
                            label: '오늘',
                            isSelected: selectedPreset == 'today',
                            onTap: () {
                              final preset = _buildQuickRange('today');
                              setState(() {
                                rangeStart = preset.$1;
                                rangeEnd = preset.$2;
                                focusedDay = preset.$2;
                                selectedPreset = 'today';
                              });
                            },
                          ),
                          _QuickRangeChip(
                            label: '7일',
                            isSelected: selectedPreset == '7days',
                            onTap: () {
                              final preset = _buildQuickRange('7days');
                              setState(() {
                                rangeStart = preset.$1;
                                rangeEnd = preset.$2;
                                focusedDay = preset.$2;
                                selectedPreset = '7days';
                              });
                            },
                          ),
                          _QuickRangeChip(
                            label: '30일',
                            isSelected: selectedPreset == '30days',
                            onTap: () {
                              final preset = _buildQuickRange('30days');
                              setState(() {
                                rangeStart = preset.$1;
                                rangeEnd = preset.$2;
                                focusedDay = preset.$2;
                                selectedPreset = '30days';
                              });
                            },
                          ),
                          _QuickRangeChip(
                            label: '이번달',
                            isSelected: selectedPreset == 'thisMonth',
                            onTap: () {
                              final preset = _buildQuickRange('thisMonth');
                              setState(() {
                                rangeStart = preset.$1;
                                rangeEnd = preset.$2;
                                focusedDay = preset.$2;
                                selectedPreset = 'thisMonth';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Flexible(
                        child: TableCalendar(
                          firstDay: DateTime(2020),
                          lastDay: DateTime(2030),
                          locale: 'ko_KR',
                          focusedDay: focusedDay,
                          rangeStartDay: rangeStart,
                          rangeEndDay: rangeEnd,
                          rangeSelectionMode: RangeSelectionMode.toggledOn,
                          onRangeSelected: (start, end, focusedDayParam) {
                            setState(() {
                              rangeStart = start;
                              rangeEnd = end;
                              focusedDay = focusedDayParam;
                              selectedPreset = null;
                            });
                          },
                          calendarStyle: CalendarStyle(
                            defaultTextStyle: context.body.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            weekendTextStyle: context.body.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            outsideTextStyle: context.body.copyWith(
                              color: const Color(0xFFBCC6BC),
                            ),
                            rangeStartDecoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            rangeEndDecoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            withinRangeDecoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.16),
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.pointColor,
                                width: 1.5,
                              ),
                              shape: BoxShape.circle,
                            ),
                            todayTextStyle: context.body.copyWith(
                              color: AppColors.pointColor,
                              fontWeight: FontWeight.w800,
                            ),
                            rangeStartTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            rangeEndTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            withinRangeTextStyle: context.body.copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            leftChevronIcon: const Icon(
                              Icons.chevron_left,
                              color: AppColors.textColor,
                            ),
                            rightChevronIcon: const Icon(
                              Icons.chevron_right,
                              color: AppColors.textColor,
                            ),
                            titleTextStyle: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: context.bodySmall.copyWith(
                              color: AppColors.darkGrey,
                              fontWeight: FontWeight.w700,
                            ),
                            weekendStyle: context.bodySmall.copyWith(
                              color: AppColors.darkGrey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              final preset = _buildQuickRange('today');
                              setState(() {
                                rangeStart = preset.$1;
                                rangeEnd = preset.$2;
                                focusedDay = preset.$2;
                                selectedPreset = 'today';
                              });
                            },
                            child: Text(
                              '초기화',
                              style: context.body.copyWith(
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Spacer(),
                          OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: AppColors.boxBorderGrey,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 14,
                              ),
                            ),
                            child: Text(
                              '취소',
                              style: context.body.copyWith(
                                color: AppColors.darkGrey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 14,
                              ),
                            ),
                            onPressed: () {
                              if (rangeStart != null && rangeEnd != null) {
                                Navigator.pop(context);
                                onRangeSelected(rangeStart!, rangeEnd!);
                              }
                            },
                            child: Text(
                              '적용',
                              style: context.body.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static String _formatRange(DateTime? start, DateTime? end) {
    if (start == null || end == null) {
      return '기간을 선택해주세요';
    }

    return '${_formatDate(start)} - ${_formatDate(end)}';
  }

  static String _formatDate(DateTime date) {
    return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
  }

  static (DateTime, DateTime) _buildQuickRange(String type) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    switch (type) {
      case 'today':
        return (today, today);
      case '7days':
        return (today.subtract(const Duration(days: 6)), today);
      case '30days':
        return (today.subtract(const Duration(days: 29)), today);
      case 'thisMonth':
        return (DateTime(today.year, today.month, 1), today);
      default:
        return (today, today);
    }
  }

  static String? _resolvePresetLabel(DateTime start, DateTime end) {
    final normalizedStart = DateTime(start.year, start.month, start.day);
    final normalizedEnd = DateTime(end.year, end.month, end.day);
    const presetTypes = ['today', '7days', '30days', 'thisMonth'];

    for (final presetType in presetTypes) {
      final preset = _buildQuickRange(presetType);
      if (_isSameDate(preset.$1, normalizedStart) &&
          _isSameDate(preset.$2, normalizedEnd)) {
        return presetType;
      }
    }

    return null;
  }

  static bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _QuickRangeChip extends StatelessWidget {
  const _QuickRangeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFE2EAE2),
          ),
        ),
        child: Text(
          label,
          style: context.bodySmall.copyWith(
            color: isSelected ? Colors.white : AppColors.darkGrey,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
