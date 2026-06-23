import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_seller_web/feature/dash_board/domain/entities/dash_board_model.dart';

import '../../../order/domain/entities/order_model.dart';

part 'dash_board_state.freezed.dart';

@freezed
abstract class DashBoardState with _$DashBoardState {
  const DashBoardState._();

  const factory DashBoardState({
    required bool isLoading,
    DashBoardModel? dashboardInfo,
    required List<OrderModel> orderList,
    required List<OrderModel> deliveryList,
  }) = _DashBoardState;

  factory DashBoardState.initial() => DashBoardState(
    isLoading: true,
    dashboardInfo: null,
    orderList: [],
    deliveryList: [],
  );
}
