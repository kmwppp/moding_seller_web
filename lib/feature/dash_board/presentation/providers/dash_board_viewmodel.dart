import 'package:flutter/foundation.dart';
import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/core/presentation/widgets/new_order_check.dart';
import 'package:moding_president_web/feature/dash_board/data/repositories/dash_board_repository_impl.dart';
import 'package:moding_president_web/feature/dash_board/presentation/providers/dash_board_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'dash_board_viewmodel.g.dart';

@Riverpod()
class DashBoardViewModel extends _$DashBoardViewModel {
  @override
  DashBoardState build() {
    init();
    return DashBoardState.initial();
  }

  Future<void> init() async {
    await getMyDashBoardInfo();
    await getMyDashBoardOrderList();
    await getMyDashBoardDeliveryList();

    state = state.copyWith(isLoading: false);
  }

  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);

    if (kIsWeb) {
      // 웹 → 새 탭
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication, // 웹에서 새 탭을 여는 가장 안정적인 모드
          webOnlyWindowName: '_blank',
        );
      } else {
        throw 'Could not launch $uri';
      }
    } else {
      // 모바일 → 외부 브라우저 (크롬 등)
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  ///----------------------------------------------------
  /// 대시보드 정보 조회
  ///----------------------------------------------------

  Future<void> getMyDashBoardInfo() async {
    try {
      final repository = ref.read(dashBoardRepositoryProvider);
      final dashboardInfo = await repository.getMyDashboardInfo();

      state = state.copyWith(dashboardInfo: dashboardInfo);
    } catch (e) {
      print(e);
    }
  }

  ///----------------------------------------------------
  /// 대시보드 주문 승인 리스트
  ///----------------------------------------------------

  Future<void> getMyDashBoardOrderList() async {
    try {
      final repository = ref.read(dashBoardRepositoryProvider);
      final orderList = await repository.getMyDashboardOrderList();
      state = state.copyWith(orderList: orderList);
    } catch (e) {
      print(e);
    }
  }

  ///----------------------------------------------------
  /// 대시보드 배송 준비 리스트
  ///----------------------------------------------------

  Future<void> getMyDashBoardDeliveryList() async {
    try {
      final repository = ref.read(dashBoardRepositoryProvider);
      final deliveryList = await repository.getMyDashboardDeliveryList();
      state = state.copyWith(deliveryList: deliveryList);
    } catch (e) {
      print(e);
    }
  }

  Future<ResponseModel> patchOrderConfirm(int orderId) async {
    try {
      final repository = ref.read(dashBoardRepositoryProvider);
      final response = await repository.patchOrderConfirm(orderId);
      // 성공 시 id를 찾아서 리스트에서 제거후 orderlist갱신
      if (response.success) {
        init();
      }
      return response;
    } catch (e) {
      return ResponseModel(success: false, message: "오류가 발생하였습니다.");
    }
  }

  Future<ResponseModel> patchOrderReject(
    int orderId,
    RejectModel rejectModel,
  ) async {
    try {
      final repository = ref.read(dashBoardRepositoryProvider);
      final response = await repository.patchOrderReject(orderId, rejectModel);
      // 성공시 id를 찾아서 리스트에서 제거후 orderlist갱신
      if (response.success) {
        state = state.copyWith(
          orderList: state.orderList.where((e) => e.id != orderId).toList(),
        );
      }

      return response;
    } catch (e) {
      return ResponseModel(success: false, message: "오류가 발생하였습니다.");
    }
  }
}
