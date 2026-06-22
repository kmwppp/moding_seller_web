import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/product/domain/entities/delivery_district_option.dart';

class DeliveryRegionSelectorSheet extends StatefulWidget {
  const DeliveryRegionSelectorSheet({
    super.key,
    required this.options,
    required this.initialSelectedValues,
  });

  final List<DeliveryDistrictOption> options;
  final List<String> initialSelectedValues;

  @override
  State<DeliveryRegionSelectorSheet> createState() =>
      _DeliveryRegionSelectorSheetState();
}

class _DeliveryRegionSelectorSheetState
    extends State<DeliveryRegionSelectorSheet> {
  late final Set<String> _selectedValues;
  late final Set<String> _expandedProvinces;
  late final TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _selectedValues = widget.initialSelectedValues.toSet();
    _expandedProvinces = widget.options
        .where((option) => _selectedValues.contains(option.code))
        .map((option) => option.province)
        .where((province) => province.trim().isNotEmpty)
        .toSet();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final sheetListHeight = screenHeight * 0.5;
    final options = widget.options;
    final normalizedQuery = _searchQuery.trim().toLowerCase();
    final groupedOptions = <String, List<DeliveryDistrictOption>>{};
    final filteredOptions = normalizedQuery.isEmpty
        ? options
        : options.where((option) {
            final province = option.province.toLowerCase();
            final name = option.name.toLowerCase();
            final display = option.displayLabel.toLowerCase();
            return province.contains(normalizedQuery) ||
                name.contains(normalizedQuery) ||
                display.contains(normalizedQuery);
          }).toList();

    for (final option in filteredOptions) {
      groupedOptions.putIfAbsent(option.province, () => []).add(option);
    }

    final provinces = groupedOptions.keys.toList();

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "직배송 가능 지역을 선택해주세요.",
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              style: context.body,
              decoration: InputDecoration(
                hintText: '시도 또는 시군구 검색',
                hintStyle: context.body.copyWith(color: AppColors.darkGrey),
                prefixIcon: const Icon(Icons.search, color: AppColors.darkGrey),
                filled: true,
                fillColor: const Color(0xFFF6F8F6),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFFDDE6DD)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFFDDE6DD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: sheetListHeight,
                maxHeight: sheetListHeight,
              ),
              child: filteredOptions.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Text(
                          normalizedQuery.isEmpty
                              ? "불러온 지역 목록이 없습니다."
                              : "검색 결과가 없습니다.",
                          style: context.body.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ),
                    )
                  : normalizedQuery.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      itemCount: filteredOptions.length,
                      separatorBuilder: (_, _) =>
                          const Divider(height: 1, color: Color(0xFFE8ECF2)),
                      itemBuilder: (context, index) {
                        final option = filteredOptions[index];
                        final isSelected = _selectedValues.contains(
                          option.code,
                        );

                        return CheckboxListTile(
                          value: isSelected,
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          activeColor: AppColors.primary,
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(
                            '${option.province} > ${option.name}',
                            style: context.body.copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onChanged: (_) {
                            setState(() {
                              if (isSelected) {
                                _selectedValues.remove(option.code);
                              } else {
                                _selectedValues.add(option.code);
                              }
                            });
                          },
                        );
                      },
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: provinces.length,
                      separatorBuilder: (_, _) =>
                          const Divider(height: 1, color: Color(0xFFE8ECF2)),
                      itemBuilder: (context, index) {
                        final province = provinces[index];
                        final districts =
                            groupedOptions[province] ??
                            const <DeliveryDistrictOption>[];
                        final isExpanded = _expandedProvinces.contains(
                          province,
                        );

                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FBF9),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(14),
                                onTap: () {
                                  setState(() {
                                    if (isExpanded) {
                                      _expandedProvinces.remove(province);
                                    } else {
                                      _expandedProvinces.add(province);
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 14,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          province,
                                          style: context.body.copyWith(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${districts.where((district) => _selectedValues.contains(district.code)).length}/${districts.length}',
                                        style: context.bodySmall.copyWith(
                                          color: AppColors.darkGrey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                        isExpanded
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color: AppColors.darkGrey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (isExpanded)
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    8,
                                    0,
                                    8,
                                    8,
                                  ),
                                  child: Column(
                                    children: districts.map((option) {
                                      final isSelected = _selectedValues
                                          .contains(option.code);

                                      return CheckboxListTile(
                                        value: isSelected,
                                        dense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                        activeColor: AppColors.primary,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        title: Text(
                                          option.name,
                                          style: context.body.copyWith(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onChanged: (_) {
                                          setState(() {
                                            if (isSelected) {
                                              _selectedValues.remove(
                                                option.code,
                                              );
                                            } else {
                                              _selectedValues.add(option.code);
                                            }
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.boxBorderGrey),
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: Text(
                      "취소",
                      style: context.body.copyWith(
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pop(_selectedValues.toList()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: Text(
                      "선택 완료",
                      style: context.body.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
