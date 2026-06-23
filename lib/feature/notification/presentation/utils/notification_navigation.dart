import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/feature/main/presentation/main_page.dart';
import 'package:moding_seller_web/feature/main/presentation/providers/main_viewmodel.dart';
import 'package:moding_seller_web/feature/notification/domain/entities/notification_item.dart';
import 'package:moding_seller_web/feature/notification/domain/enums/notification_target_page.dart';
import 'package:moding_seller_web/feature/order/presentation/providers/order_management_viewmodel.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_management/product_management_viewmodel.dart';
import 'package:moding_seller_web/feature/settlement/presentation/providers/settlement_viewmodel.dart';

Future<void> navigateByNotification(
  BuildContext context,
  WidgetRef ref,
  NotificationItem item,
) async {
  final mainVm = ref.read(mainViewModelProvider.notifier);

  switch (item.page) {
    case NotificationTargetPage.sellerOrderDetail:
      if (item.referenceId != null) {
        context.go('/dash/preparingForDelivery/read/${item.referenceId}');
      }
      return;
    case NotificationTargetPage.sellerClaimDetail:
      if (item.referenceId != null) {
        context.go('/claim/detail/${item.referenceId}');
      }
      return;
    case NotificationTargetPage.sellerProductDetail:
      if (item.referenceId != null) {
        context.go('/product/edit/${item.referenceId}');
      }
      return;
    case NotificationTargetPage.sellerProductList:
      ref.invalidate(productManagementViewModelProvider);
      mainVm.selectMenu(MainMenu.product);
      context.go('/main');
      return;
    case NotificationTargetPage.sellerOrderList:
      ref.invalidate(orderManagementViewModelProvider);
      mainVm.selectMenu(MainMenu.order);
      context.go('/main');
      return;
    case NotificationTargetPage.sellerHome:
      mainVm.resetToDashboard();
      context.go('/main');
      return;
    case NotificationTargetPage.sellerTaxInvoice:
      mainVm.selectMenu(MainMenu.evidence);
      context.go('/main');
      return;
    case NotificationTargetPage.sellerSettlement:
      ref.invalidate(settlementViewModelProvider);
      mainVm.selectMenu(MainMenu.settlement);
      context.go('/main');
      return;
    case NotificationTargetPage.noticeList:
      return;
    case NotificationTargetPage.conversionStatus:
      return;
    case NotificationTargetPage.unknown:
      return;
  }
}
