import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/feature/dash_board/presentation/providers/dash_board_viewmodel.dart';
import 'package:moding_seller_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_seller_web/feature/order/domain/enums/order_status_enum.dart';
import 'package:moding_seller_web/feature/order/presentation/providers/order_management_viewmodel.dart';
import 'package:moding_seller_web/feature/preparing_delivery/domain/enums/delivery_method.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/enums/delivery_execute_tab.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/providers/dash_delivery_state.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/providers/dash_delivery_viewmodel.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/screens/sections/delivery_execute_section.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/screens/sections/order_items_section.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/screens/sections/order_summary_section.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/screens/sections/variable_weight_delivery_complete_sheet.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_box_styles.dart';
import '../../../../core/theme/app_text_styles.dart';

final List<String> deliveryMethodList = ["택배배송", "직접배송"];
final List<String> courierCompanyList = ["CJ대한통운", "한진택배"];

class DashDeliveryPage extends ConsumerStatefulWidget {
  const DashDeliveryPage({super.key, this.orderId, required this.isDashboard});

  final String? orderId;
  final bool isDashboard;

  bool get isEdit => orderId != null && orderId!.isNotEmpty;

  @override
  ConsumerState<DashDeliveryPage> createState() => _DashDeliveryPageState();
}

class _DashDeliveryPageState extends ConsumerState<DashDeliveryPage> {
  bool _isSubmitting = false;

  void _setSubmitting(bool value) {
    if (!mounted) return;
    setState(() => _isSubmitting = value);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width >= 900;

    final state = ref.watch(dashDeliveryViewModelProvider(widget.orderId));
    final notifier = ref.read(
      dashDeliveryViewModelProvider(widget.orderId).notifier,
    );
    final isPrimaryEnabled = _isPrimaryActionEnabled(state);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        // 스크롤 시 색상 변함 방지
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text('배송준비'),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: Center(child: NotificationBellButton()),
          ),
          IconButton(
            tooltip: '메인으로',
            onPressed: () => context.go('/main'),
            icon: const Icon(Icons.home_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          state.isLoading
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all(isWide ? 200 : 100),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.primary),
                    ),
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      isWide ? 24 : 16,
                      isWide ? 24 : 16,
                      isWide ? 24 : 16,
                      isWide ? 42 : 20,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 920),
                        child: Column(
                          children: [
                            _DashDeliveryHeroCard(state: state),
                            const SizedBox(height: 16),
                            OrderSummarySection(orderId: widget.orderId),
                            const SizedBox(height: 12),
                            OrderItemsSection(orderId: widget.orderId),
                            const SizedBox(height: 12),
                            if (widget.orderId != "0")
                              state.orderStatus.toOrderStatus() ==
                                      OrderStatus.CONFIRMED
                                  ? DeliveryExecuteSection(
                                      orderId: widget.orderId,
                                      onVerifyTracking: () =>
                                          _handleVerifyTracking(notifier),
                                    )
                                  : state.deliveryMethod != null
                                  ? OrderDeliverySection(state: state)
                                  : const SizedBox(),
                            const SizedBox(height: 14),
                            Container(
                              width: double.infinity,
                              decoration: AppBoxStyles.borderBox.copyWith(
                                color: const Color(0xFFFCFDFC),
                              ),
                              padding: const EdgeInsets.all(14),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  textStyle: context.body.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: _isSubmitting || !isPrimaryEnabled
                                    ? null
                                    : () => _handlePrimaryAction(
                                        context,
                                        notifier,
                                        state,
                                      ),
                                child: Text(
                                  _getButtonText(
                                    state.orderStatus.toOrderStatus(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          if (_isSubmitting)
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.35),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }

  bool _isPrimaryActionEnabled(DashDeliveryState state) {
    if (state.orderStatus.toOrderStatus() != OrderStatus.CONFIRMED) {
      return true;
    }

    if (state.selectedDeliveryTab == DeliveryExecuteTab.courier) {
      return state.isTrackingValidated;
    }

    return true;
  }

  Future<void> _handleVerifyTracking(DashDeliveryViewModel notifier) async {
    _setSubmitting(true);

    final result = await notifier.verifyInvoice(widget.orderId);

    _setSubmitting(false);
    if (!mounted) {
      return;
    }

    if (result.success && (result.data?.isRecipientMismatch ?? false)) {
      final confirmed = await AppDialog.showConfirm(
        context,
        message: '송장번호의 수령지와 주문지의 수령지의 우편번호가 일치하지 않습니다. 그래도 보내시겠습니까?',
      );
      if (!mounted) {
        return;
      }
      if (confirmed) {
        notifier.completeTrackingValidation(
          result.message.isNotEmpty
              ? result.message
              : '송장번호를 확인하였습니다.',
        );
      }
      return;
    }

    if (result.success) {
      await AppDialog.showSuccess(context, result.message);
      return;
    }

    if (result.message.isNotEmpty) {
      await AppDialog.showError(context, result.message);
    }
  }

  Future<void> _handlePrimaryAction(
    BuildContext context,
    DashDeliveryViewModel notifier,
    DashDeliveryState state,
  ) async {
    _setSubmitting(true);

    if (state.orderStatus.toOrderStatus() == OrderStatus.CONFIRMED) {
      final result =
          state.selectedDeliveryTab == DeliveryExecuteTab.hanjinOneClick
          ? await notifier.postOrderDeliveryHanjin(widget.orderId)
          : await notifier.postOrderDeliveryShip(widget.orderId);

      _setSubmitting(false);
      if (!mounted) return;

      if (result.success) {
        AppDialog.showSuccess(
          context,
          "상품을 출고 처리하였습니다.",
          onConfirm: () {
            context.pop();
            if (!widget.isDashboard) {
              ref
                  .read(orderManagementViewModelProvider.notifier)
                  .resetToStatus(OrderStatus.CONFIRMED);
            } else {
              ref.read(dashBoardViewModelProvider.notifier).init();
            }
          },
        );
      } else {
        AppDialog.showError(context, result.message);
      }
      return;
    }

    if (state.orderStatus.toOrderStatus() == OrderStatus.SHIPPED) {
      final result = state.isVariableWeight
          ? await _handleVariableWeightDeliveryComplete(
              context,
              notifier,
              state,
            )
          : await notifier.postDeliveryComplete(widget.orderId);

      _setSubmitting(false);
      if (!mounted) return;

      if (result.success) {
        AppDialog.showSuccess(
          context,
          "배송 완료 처리하였습니다.",
          onConfirm: () {
            context.pop();

            if (!widget.isDashboard) {
              ref
                  .read(orderManagementViewModelProvider.notifier)
                  .resetToStatus(OrderStatus.SHIPPED);
            } else {
              ref.read(dashBoardViewModelProvider.notifier).init();
            }
          },
        );
      } else if (result.message.isNotEmpty) {
        AppDialog.showError(context, result.message);
      }
      return;
    }

    _setSubmitting(false);
    if (!mounted) return;
    context.pop();
  }

  String _getButtonText(OrderStatus status) {
    switch (status) {
      case OrderStatus.CONFIRMED:
        return "배송 시작";
      case OrderStatus.SHIPPED:
        return "배송 완료";
      case OrderStatus.ORDERED:
      case OrderStatus.REJECTED:
      case OrderStatus.DELIVERED:
      case OrderStatus.PURCHASE_CONFIRMED:
      case OrderStatus.CLAIM_IN_PROGRESS:
      case OrderStatus.SETTLEMENT_COMPLETED:
      case OrderStatus.CANCELLED:
        return "확인";
    }
  }

  Future<ResponseModel> _handleVariableWeightDeliveryComplete(
    BuildContext context,
    DashDeliveryViewModel notifier,
    DashDeliveryState state,
  ) async {
    final completed = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (sheetContext) {
        return VariableWeightDeliveryCompleteSheet(
          items: state.items,
          onSubmit: (items) {
            return notifier.postDeliveryCompleteVariableWeight(
              widget.orderId,
              items,
            );
          },
        );
      },
    );

    if (completed == true) {
      return ResponseModel(success: true, message: '배송 완료 처리하였습니다.');
    }

    return ResponseModel(success: false, message: '');
  }
}

class _DashDeliveryHeroCard extends StatelessWidget {
  const _DashDeliveryHeroCard({required this.state});

  final DashDeliveryState state;

  @override
  Widget build(BuildContext context) {
    final status = state.orderStatus.toOrderStatus();

    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        color: const Color(0xFFF8FBF8),
      ),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '배송 준비',
                style: context.title.copyWith(fontWeight: FontWeight.w700),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4E8),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: const Color(0xFFFFE2BF)),
                ),
                child: Text(
                  status.label,
                  style: context.bodySmall.copyWith(
                    color: AppColors.pointColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            state.orderCode.isEmpty ? '주문 정보를 불러오는 중입니다.' : state.orderCode,
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            state.items.isEmpty
                ? '배송 정보와 상품 구성을 확인한 뒤 다음 단계를 진행해 주세요.'
                : '${state.items.first.productName}${state.items.length > 1 ? ' 외 ${state.items.length - 1}건' : ''} 배송 처리를 진행할 수 있어요.',
            style: context.body.copyWith(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}

class OrderDeliverySection extends StatelessWidget {
  const OrderDeliverySection({super.key, required this.state});

  final DashDeliveryState state;

  @override
  Widget build(BuildContext context) {
    final isDirect = state.deliveryMethod == DeliveryMethod.DIRECT;

    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        color: const Color(0xFFFCFDFC),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '배송 확인',
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 10,
                //     vertical: 5,
                //   ),
                //   decoration: BoxDecoration(
                //     color: const Color(0xFFEFF7EF),
                //     borderRadius: BorderRadius.circular(999),
                //   ),
                //   child: Text(
                //     '읽기 전용',
                //     style: context.bodySmall.copyWith(
                //       color: AppColors.primary,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 14),
            _DeliveryInfoRow(
              label: '배송방법',
              value: state.deliveryMethod?.label ?? "",
            ),
            if (!isDirect) ...[
              const SizedBox(height: 12),
              _DeliveryInfoRow(
                label: '택배사',
                value: state.delivery?.courierName ?? "",
              ),
              const SizedBox(height: 12),
              _DeliveryInfoRow(
                label: '송장번호',
                value: state.delivery?.trackingNumber ?? "",
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DeliveryInfoRow extends StatelessWidget {
  const _DeliveryInfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5ECE5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 84,
            child: Text(
              label,
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '-' : value,
              style: context.body.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
