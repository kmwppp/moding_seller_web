import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/core/theme/app_box_styles.dart';
import 'package:moding_president_web/feature/product/presentation/providers/product_management/product_management_viewmodel.dart';
import 'package:moding_president_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_president_web/feature/product/presentation/screens/sections/quick_look_section.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_mobile_list_tile.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_web_list_tile.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../dash_board/presentation/screens/widgets/custom_button.dart';

class ProductManagementPage extends ConsumerStatefulWidget {
  const ProductManagementPage({super.key});

  @override
  ConsumerState<ProductManagementPage> createState() =>
      _ProductManagementPageState();
}

class _ProductManagementPageState extends ConsumerState<ProductManagementPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 280) {
      ref.read(productManagementViewModelProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final size = MediaQuery.of(context).size;
    final isWide = size.width >= 900;
    const searchIcon = "assets/images/icons/searchBarIcon.png";

    final state = ref.watch(productManagementViewModelProvider);
    final notifier = ref.read(productManagementViewModelProvider.notifier);

    return !state.isMainLoading
        ? SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: size.height),
                child: Padding(
                  padding: isWide
                      ? const EdgeInsets.all(24)
                      : const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '상품관리',
                              style: context.title.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (AppResponsiveLayout.isDesktop(context))
                                const Column(
                                  children: [
                                    NotificationBellButton(),
                                    SizedBox(height: 14),
                                  ],
                                ),

                              GestureDetector(
                                onTap: () {
                                  context.push('/product/edit');
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: CustomButton(
                                    title: "+ 상품 등록",
                                    boxColor: AppColors.pointColor,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      QuickLookSection(),

                      const SizedBox(height: 10),

                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.darkGrey),
                        ),
                        child: TextField(
                          onChanged: (String word) =>
                              notifier.changeSearchWord(word),
                          style: context.body,
                          textInputAction: TextInputAction.search,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: AppColors.darkGrey,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "상품명을 입력하세요.",
                            hintStyle: context.body.copyWith(
                              color: AppColors.darkGrey,
                            ),
                            contentPadding: const EdgeInsets.only(left: 14),
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(searchIcon),
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      if (!state.isLoading) _ProductListSection(),
                      if (state.isLoading)
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(isWide ? 200 : 100),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      if (state.isLoadingMore)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(child: LoadingIndicator()),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : LoadingIndicator();
  }
}

class _ProductListSection extends ConsumerWidget {
  const _ProductListSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productManagementViewModelProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.productList.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Text(
                '등록된 상품이 없습니다.',
                style: context.body.copyWith(color: AppColors.darkGrey),
              ),
            ),
          )
        else if (AppResponsiveLayout.isDesktopProductManagementListExcept(
          context,
        ))
          Container(
            decoration: AppBoxStyles.borderBox,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '이미지',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '상품명',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '상품번호',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '카테고리',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '판매가',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '재고',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '상태',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '승인상태',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '수정일',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '관리',
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 10),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.productList.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final p = state.productList[index];
                    return Column(
                      children: [
                        ProductWebListTile(
                          index: index,
                          isWide: AppResponsiveLayout.isDesktop(context),
                          onTap: () => context.push('/product/edit/${p.id}'),
                        ),
                        SizedBox(height: 10),
                        Divider(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        if (!AppResponsiveLayout.isDesktopProductManagementListExcept(context))
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.productList.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final p = state.productList[index];
              return ProductMobileListTile(
                index: index,
                isWide: AppResponsiveLayout.isDesktop(context),
                onTap: () => context.push('/product/edit/${p.id}'),
              );
            },
          ),
      ],
    );
  }
}
