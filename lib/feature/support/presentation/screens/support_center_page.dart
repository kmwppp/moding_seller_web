import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/constants/app_responsive_layout.dart';
import 'package:moding_seller_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_seller_web/core/theme/app_box_styles.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/support/data/repositories/support_repository.dart';
import 'package:moding_seller_web/feature/support/domain/enums/support_center_type.dart';
import 'package:moding_seller_web/feature/support/domain/enums/support_faq_category.dart';
import 'package:moding_seller_web/feature/support/presentation/providers/support_center_state.dart';
import 'package:moding_seller_web/feature/support/presentation/widgets/support_faq_category_chips.dart';
import 'package:moding_seller_web/feature/support/presentation/widgets/support_faq_tile.dart';
import 'package:moding_seller_web/feature/support/presentation/widgets/support_notice_tile.dart';

class SupportCenterPage extends ConsumerStatefulWidget {
  const SupportCenterPage({super.key, required this.type, this.onBack});

  final SupportCenterType type;
  final VoidCallback? onBack;

  @override
  ConsumerState<SupportCenterPage> createState() => _SupportCenterPageState();
}

class _SupportCenterPageState extends ConsumerState<SupportCenterPage> {
  late final ScrollController _scrollController;
  late final SupportRepository _repository;
  SupportCenterState _state = SupportCenterState.initial();

  @override
  void initState() {
    super.initState();
    _repository = ref.read(supportRepositoryProvider);
    _scrollController = ScrollController()..addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitial();
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.hasClients &&
        _scrollController.position.extentAfter < 260) {
      _loadMore();
    }
  }

  Future<void> _loadInitial() async {
    await _load(isReset: true);
  }

  Future<void> _loadMore() async {
    await _load(isReset: false);
  }

  Future<void> _load({required bool isReset}) async {
    if (!mounted) {
      return;
    }

    if (!isReset &&
        (_state.isLoading || _state.isLoadingMore || !_state.hasMore)) {
      return;
    }

    setState(() {
      _state = _state.copyWith(isLoading: isReset, isLoadingMore: !isReset);
    });

    try {
      if (widget.type == SupportCenterType.notice) {
        final result = await _repository.getNotices(
          page: isReset ? 0 : _state.page + 1,
          size: 10,
        );
        if (!mounted) {
          return;
        }

        setState(() {
          _state = _state.copyWith(
            isLoading: false,
            isLoadingMore: false,
            hasMore: result.hasMore,
            page: result.page,
            noticeItems: isReset
                ? result.items
                : [..._state.noticeItems, ...result.items],
          );
        });
        return;
      }

      final result = await _repository.getFaqs(
        page: isReset ? 0 : _state.page + 1,
        size: 10,
        category: _state.selectedFaqCategory.queryValue,
      );
      if (!mounted) {
        return;
      }

      setState(() {
        _state = _state.copyWith(
          isLoading: false,
          isLoadingMore: false,
          hasMore: result.hasMore,
          page: result.page,
          faqItems: isReset
              ? result.items
              : [..._state.faqItems, ...result.items],
        );
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _state = _state.copyWith(isLoading: false, isLoadingMore: false);
      });
    }
  }

  Future<void> _selectFaqCategory(SupportFaqCategory category) async {
    if (widget.type != SupportCenterType.faq ||
        _state.selectedFaqCategory == category) {
      return;
    }

    setState(() {
      _state = _state.copyWith(
        selectedFaqCategory: category,
        faqItems: const [],
        expandedFaqIds: <int>{},
        loadingFaqContentIds: <int>{},
        page: 0,
        hasMore: true,
        isLoading: true,
        isLoadingMore: false,
      );
    });

    await _load(isReset: true);
  }

  Future<void> _toggleNotice(int noticeId) async {
    final expanded = <int>{..._state.expandedNoticeIds};
    if (expanded.contains(noticeId)) {
      expanded.remove(noticeId);
      setState(() {
        _state = _state.copyWith(expandedNoticeIds: expanded);
      });
      return;
    }

    expanded.add(noticeId);
    setState(() {
      _state = _state.copyWith(expandedNoticeIds: expanded);
    });

    final item = _findNotice(noticeId);
    if (item == null || (item.content?.isNotEmpty ?? false)) {
      return;
    }

    setState(() {
      _state = _state.copyWith(
        loadingNoticeContentIds: <int>{
          ..._state.loadingNoticeContentIds,
          noticeId,
        },
      );
    });

    try {
      final detail = await _repository.getNoticeDetail(noticeId);
      if (!mounted) {
        return;
      }

      setState(() {
        _state = _state.copyWith(
          noticeItems: _state.noticeItems
              .map(
                (notice) => notice.id == noticeId
                    ? notice.copyWith(content: detail.content)
                    : notice,
              )
              .toList(),
          loadingNoticeContentIds: <int>{..._state.loadingNoticeContentIds}
            ..remove(noticeId),
        );
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _state = _state.copyWith(
          loadingNoticeContentIds: <int>{..._state.loadingNoticeContentIds}
            ..remove(noticeId),
        );
      });
    }
  }

  Future<void> _toggleFaq(int faqId) async {
    final expanded = <int>{..._state.expandedFaqIds};
    if (expanded.contains(faqId)) {
      expanded.remove(faqId);
      setState(() {
        _state = _state.copyWith(expandedFaqIds: expanded);
      });
      return;
    }

    expanded.add(faqId);
    setState(() {
      _state = _state.copyWith(expandedFaqIds: expanded);
    });

    final item = _findFaq(faqId);
    if (item == null || (item.answer?.isNotEmpty ?? false)) {
      return;
    }

    setState(() {
      _state = _state.copyWith(
        loadingFaqContentIds: <int>{..._state.loadingFaqContentIds, faqId},
      );
    });

    try {
      final detail = await _repository.getFaqDetail(faqId);
      if (!mounted) {
        return;
      }

      setState(() {
        _state = _state.copyWith(
          faqItems: _state.faqItems
              .map(
                (faq) =>
                    faq.id == faqId ? faq.copyWith(answer: detail.answer) : faq,
              )
              .toList(),
          loadingFaqContentIds: <int>{..._state.loadingFaqContentIds}
            ..remove(faqId),
        );
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _state = _state.copyWith(
          loadingFaqContentIds: <int>{..._state.loadingFaqContentIds}
            ..remove(faqId),
        );
      });
    }
  }

  dynamic _findNotice(int noticeId) {
    for (final notice in _state.noticeItems) {
      if (notice.id == noticeId) {
        return notice;
      }
    }
    return null;
  }

  dynamic _findFaq(int faqId) {
    for (final faq in _state.faqItems) {
      if (faq.id == faqId) {
        return faq;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final backAction =
        widget.onBack ??
        () {
          Navigator.of(context).maybePop();
        };
    final isDesktop = AppResponsiveLayout.isDesktop(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: isDesktop
              ? const EdgeInsets.all(24)
              : const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: IconButton(
                        onPressed: backAction,
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.type.title,
                            style: context.title.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.type.description,
                            style: context.body.copyWith(
                              color: AppColors.darkGrey,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  decoration: AppBoxStyles.borderBox.copyWith(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.type == SupportCenterType.faq) ...[
                        SupportFaqCategoryChips(
                          selectedCategory: _state.selectedFaqCategory,
                          onSelected: _selectFaqCategory,
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (_state.isLoading)
                        const SizedBox(
                          height: 360,
                          child: Center(child: LoadingIndicator()),
                        )
                      else if (widget.type == SupportCenterType.notice &&
                          _state.noticeItems.isEmpty)
                        const _SupportEmptyState(message: '등록된 공지사항이 없습니다.')
                      else if (widget.type == SupportCenterType.faq &&
                          _state.faqItems.isEmpty)
                        const _SupportEmptyState(message: '등록된 FAQ가 없습니다.')
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.type == SupportCenterType.notice
                              ? _state.noticeItems.length +
                                    (_state.isLoadingMore ? 1 : 0)
                              : _state.faqItems.length +
                                    (_state.isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (widget.type == SupportCenterType.notice) {
                              if (index >= _state.noticeItems.length) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Center(child: LoadingIndicator()),
                                );
                              }

                              final item = _state.noticeItems[index];
                              return SupportNoticeTile(
                                item: item,
                                isExpanded: _state.expandedNoticeIds.contains(
                                  item.id,
                                ),
                                isLoadingContent: _state.loadingNoticeContentIds
                                    .contains(item.id),
                                onTap: () => _toggleNotice(item.id),
                              );
                            }

                            if (index >= _state.faqItems.length) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Center(child: LoadingIndicator()),
                              );
                            }

                            final item = _state.faqItems[index];
                            return SupportFaqTile(
                              item: item,
                              isExpanded: _state.expandedFaqIds.contains(
                                item.id,
                              ),
                              isLoadingContent: _state.loadingFaqContentIds
                                  .contains(item.id),
                              onTap: () => _toggleFaq(item.id),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SupportEmptyState extends StatelessWidget {
  const _SupportEmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Center(
        child: Text(
          message,
          style: context.body.copyWith(color: AppColors.darkGrey),
        ),
      ),
    );
  }
}
