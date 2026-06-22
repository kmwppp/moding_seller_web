import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/services/web_bridge.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/claim_page.dart';
import 'package:moding_president_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_president_web/feature/review/presentation/screens/review_management_page.dart';
import 'package:moding_president_web/feature/business_profile/presentation/screens/business_profile_management_page.dart';

import 'package:moding_president_web/feature/main/presentation/providers/main_viewmodel.dart';
import 'package:moding_president_web/feature/main/presentation/widgets/side_navigation.dart';
import 'package:moding_president_web/feature/order/presentation/screens/order_management_page.dart';
import 'package:moding_president_web/feature/product/presentation/screens/product_management_page.dart';
import 'package:moding_president_web/feature/settlement/presentation/screens/settlement_management_page.dart';
import 'package:moding_president_web/feature/evidence/presentation/screens/evidence_management_page.dart';

import '../../../core/constants/app_strings.dart';
import '../../dash_board/presentation/screens/dash_board_page.dart';

enum MainMenu {
  dashboard(AppStrings.dashBoard, "assets/images/icons/dashboardIcon.png"),
  product(AppStrings.productManagement, "assets/images/icons/productIcon.png"),
  order(AppStrings.orderManagement, "assets/images/icons/orderIcon.png"),
  claim(AppStrings.claimsManagement, "assets/images/icons/claimIcon.png"),
  settlement(
    AppStrings.invoiceManagement,
    "assets/images/icons/settlementIcon.png",
  ),
  evidence(AppStrings.evidenceManagement, "assets/images/icons/proofIcon.png"),
  // stats(AppStrings.statistics, "assets/images/icons/statsIcon.png"),
  // promotion(
  //   AppStrings.managePromotions,
  //   "assets/images/icons/dashboardIcon.png",
  // ),
  review(AppStrings.reviewManagement, "assets/images/icons/dashboardIcon.png"),
  setting(AppStrings.settings, "assets/images/icons/dashboardIcon.png"),
  moveToPurchase(AppStrings.goToThePurchasePage, "");

  final String label;
  final String iconUrl;

  const MainMenu(this.label, this.iconUrl);

  bool get isBottomItem => this == MainMenu.moveToPurchase;
}

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  MainMenu? _lastReportedMenu;
  bool _didNotifyMainReady = false;

  static final Map<MainMenu, Widget> _pages = {
    MainMenu.dashboard: const DashboardView(),
    MainMenu.product: const ProductManagementPage(),
    MainMenu.order: const OrderManagementPage(),
    MainMenu.claim: const ClaimPage(),
    MainMenu.settlement: const SettlementManagementPage(),
    MainMenu.evidence: const EvidenceManagementPage(),
    MainMenu.review: const ReviewManagementPage(),
    MainMenu.setting: const BusinessProfileManagementPage(),
  };

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final state = ref.watch(mainViewModelProvider);
    final vm = ref.read(mainViewModelProvider.notifier);

    final selected = state.selectedMenu;
    final canPop = selected == MainMenu.dashboard;

    if (_lastReportedMenu != selected) {
      _lastReportedMenu = selected;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        sendCurrentMenu(selected.name);
      });
    }

    if (!_didNotifyMainReady) {
      _didNotifyMainReady = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        sendWebMainReady();
      });
    }

    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && !canPop) {
          vm.selectMenu(MainMenu.dashboard);
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (AppResponsiveLayout.isDesktop(context)) {
            return Scaffold(
              body: Row(
                children: [
                  SideNavigation(selected: selected, onSelected: vm.selectMenu),
                  const VerticalDivider(width: 1),
                  Expanded(child: _buildContent(selected)),
                ],
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Image.asset("assets/images/icons/logo.png", width: 26),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                },
              ),
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Center(child: NotificationBellButton()),
                ),
              ],
            ),
            drawer: Drawer(
              child: SideNavigation(
                selected: selected,
                onSelected: (menu) {
                  Navigator.of(context).pop();
                  vm.selectMenu(menu);
                },
              ),
            ),
            body: SafeArea(child: _buildContent(selected)),
          );
        },
      ),
    );
  }

  Widget _buildContent(MainMenu selected) {
    return _pages[selected] ??
        Center(
          child: Text(
            '${selected.label} 페이지는 준비 중입니다.',
            style: const TextStyle(fontSize: 18),
          ),
        );
  }
}
