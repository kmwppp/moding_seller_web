import 'package:moding_seller_web/feature/order/domain/enums/order_status_enum.dart';

class AppHttpUrls {
  /// ----------------------------------------
  /// 인증 API
  /// ----------------------------------------
  static const String postLogin = '/api/v1/auth/login';
  static const String postWebViewTokenExchange =
      '/api/v1/auth/webview-tokens/exchange';
  static const String postIdentityVerification =
      '/api/v1/auth/identity-verification';
  static const String postFindId = '/api/v1/auth/find-id';
  static const String patchFindPassword = '/api/v1/auth/password';
  static const String postIdentityVerify = '/api/v1/auth/identity/verify';
  static const String postReauth = '/api/v1/auth/reauth';
  static const String getSellerNotifications = '/api/v1/seller/notifications';
  static const String patchSellerNotificationsReadAll =
      '/api/v1/seller/notifications/read-all';
  static const String getSellerBadges = '/api/v1/seller/badges';
  static const String getMyBusinessProfileInfo = '/api/v1/business-profiles/me';
  static const String getMyUserInfo = '/api/v1/users/me';
  static const String getMySellerProfileInfo = '/api/v1/seller-profiles/me';
  static const String putMySellerProfileInfo = '/api/v1/seller-profiles/me';
  static const String deleteMySellerProfileInfo = '/api/v1/seller-profiles/me';
  static const String getMyRefundAccountInfo = '/api/v1/refund-accounts/me';
  static const String patchMyHanjinContract =
      '/api/v1/seller-profiles/me/hanjin-contract';
  static const String getMetaBankCodes = '/api/v1/meta/bank-codes';

  static String getNoticeList({int page = 0, int size = 10}) {
    return '/api/v1/notices?page=$page&size=$size';
  }

  static String getNoticeDetail(int noticeId) {
    return '/api/v1/notices/$noticeId';
  }

  static String getFaqList({int page = 0, int size = 10, String? category}) {
    final params = <String>['page=$page', 'size=$size'];
    if (category != null && category.isNotEmpty) {
      params.add('category=$category');
    }
    return '/api/v1/faqs?${params.join("&")}';
  }

  static String getFaqDetail(int faqId) {
    return '/api/v1/faqs/$faqId';
  }

  static String getSellerReviews({
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) {
    final queryParams = <String>['page=$page', 'size=$size'];

    if (fromDate != null && fromDate.isNotEmpty) {
      queryParams.add('fromDate=$fromDate');
    }

    if (toDate != null && toDate.isNotEmpty) {
      queryParams.add('toDate=$toDate');
    }

    return '/api/v1/seller/reviews?${queryParams.join("&")}';
  }

  static String patchNotificationRead(int notificationId) {
    return '/api/v1/notifications/$notificationId/read';
  }

  /// ----------------------------------------
  /// 대시보드 API
  /// ----------------------------------------
  static final String getMyDashboardInfo = "/api/v1/seller/dashboard";

  /// ----------------------------------------
  /// 내 상품 상태별 건수 요약 API
  /// ----------------------------------------
  static final String getMyProductSummary =
      "/api/v1/seller/products/status-summary";

  /// ----------------------------------------
  /// 내 상품 조회 API
  /// ----------------------------------------

  static String getMyProductList(String status, {int page = 0, int size = 20}) {
    final queryParts = <String>[];

    if (status.isNotEmpty) {
      queryParts.add("status=$status");
    }

    queryParts.add("page=$page");
    queryParts.add("size=$size");

    return "/api/v1/seller/products?${queryParts.join("&")}";
  }

  static String getMyProductDetail(String productId) {
    return "/api/v1/seller/products/$productId";
  }

  /// ----------------------------------------
  /// 내 상품 상태 변경 API
  /// ----------------------------------------
  static String setMyProductStatus(String productId) {
    return "/api/v1/seller/products/$productId/status";
  }

  /// ----------------------------------------
  /// 내 상품 수정 API
  /// ----------------------------------------

  static String putUpdateProduct(String productId) {
    return "/api/v1/seller/products/$productId";
  }

  /// ----------------------------------------
  /// 상품 등록 API
  /// ----------------------------------------
  // 상품 등록
  static final String postCreateProduct = "/api/v1/seller/products";

  // 대분류 카테고리 조회
  static final String getProductMajorCategory = "/api/v1/categories/products";
  static final String getDeliveryDistricts = "/api/v1/delivery-districts";

  // 소분류 카테고리 조회
  static String getProductSubCategory(int majorCategoryId) {
    return "/api/v1/categories/products/$majorCategoryId/children";
  }

  /// ----------------------------------------
  /// 내 주문 목록 조회
  /// ----------------------------------------

  static String getMyOrderList(
    List<OrderStatus>? status,
    String? startDate,
    String? endDate,
    int page, {
    int size = 20,
  }) {
    final List<String> queryParts = [];

    // 1. 상태 리스트 처리 (중복 키 허용)
    if (status != null && status.isNotEmpty) {
      for (var s in status) {
        queryParts.add("statuses=${s.name}");
      }
    }

    // 2. 날짜 처리
    if (startDate != null && startDate.isNotEmpty) {
      queryParts.add("fromDate=$startDate");
    }

    if (endDate != null && endDate.isNotEmpty) {
      queryParts.add("toDate=$endDate");
    }

    queryParts.add("page=$page");
    queryParts.add("size=$size");

    if (queryParts.isEmpty) {
      return "/api/v1/seller/orders";
    }

    return "/api/v1/seller/orders?${queryParts.join("&")}";
  }

  /// ----------------------------------------
  /// 내 주문 상세 조회
  /// ----------------------------------------

  static String getMyOrderDetail(String? orderId) {
    return "/api/v1/seller/orders/$orderId";
  }

  /// ----------------------------------------
  /// 내 주문 상태별 건수 조회
  /// ----------------------------------------

  static String getMyOrderSummary() {
    return "/api/v1/seller/orders/status-summary";
  }

  /// ----------------------------------------
  /// 출고 처리
  /// ----------------------------------------
  static String postOrderDeliveryShip(String? orderId) {
    return "/api/v1/seller/orders/$orderId/delivery/ship";
  }

  static String postOrderDeliveryHanjin(String? orderId) {
    return "/api/v1/seller/orders/$orderId/delivery/hanjin";
  }

  static String postOrderTrackingValidation(String? orderId) {
    return "/api/v1/seller/orders/$orderId/delivery/tracking-validation";
  }

  /// ----------------------------------------
  /// 배송 완료 처리
  /// ----------------------------------------
  static String postOrderDeliveryComplete(String? orderId) {
    return "/api/v1/seller/orders/$orderId/delivery/deliver";
  }

  static String postOrderDeliveryCompleteVariableWeight(String? orderId) {
    return "/api/v1/seller/orders/$orderId/delivery/deliver-variable-weight";
  }

  /// ----------------------------------------
  /// 주문 확인 (배송방법 선택)
  /// ----------------------------------------

  static String patchOrderConfirm(int orderId) {
    return "/api/v1/seller/orders/$orderId/confirm";
  }

  /// ----------------------------------------
  /// 주문 거절 (거절 사유 선택)
  /// ----------------------------------------

  static String patchOrderReject(int orderId) {
    return "/api/v1/seller/orders/$orderId/reject";
  }

  /// ----------------------------------------
  /// 내 클레임 목록 조회
  /// ----------------------------------------
  static String getMyClaimList(
    List<String> status, {
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) {
    final queryParams = <String>[];

    if (status.isNotEmpty) {
      queryParams.addAll(status.map((s) => "statuses=$s"));
    }

    if (fromDate != null && fromDate.isNotEmpty) {
      queryParams.add("fromDate=$fromDate");
    }

    if (toDate != null && toDate.isNotEmpty) {
      queryParams.add("toDate=$toDate");
    }

    queryParams.add("page=$page");
    queryParams.add("size=$size");

    return "/api/v1/seller/claims?${queryParams.join("&")}";
  }

  /// ----------------------------------------
  /// 내 클레임 상태별 건수 조회
  /// ----------------------------------------
  static final String getMyClaimSummary =
      "/api/v1/seller/claims/status-summary";

  /// ----------------------------------------
  /// 내 클레임 상세 조회
  /// ----------------------------------------
  static String getMyClaimDetail(String claimId) {
    return "/api/v1/seller/claims/$claimId";
  }

  /// ----------------------------------------
  /// 클레임 거절
  /// ----------------------------------------
  static String patchClaimReject(String claimId) {
    return "/api/v1/seller/claims/$claimId/reject";
  }

  /// ----------------------------------------
  /// 클레임 승인
  /// ----------------------------------------
  static String patchClaimApprove(String claimId) {
    return "/api/v1/seller/claims/$claimId/approve";
  }

  /// ----------------------------------------
  /// 클레임 재발송 신고
  /// ----------------------------------------
  static String patchClaimReship(String claimId) {
    return "/api/v1/seller/claims/$claimId/ship-reship";
  }

  static String patchClaimReshipHanjin(String claimId) {
    return "/api/v1/seller/claims/$claimId/ship-reship/hanjin";
  }

  static String postClaimTrackingValidation(String claimId) {
    return "/api/v1/seller/claims/$claimId/ship-reship/tracking-validation";
  }

  /// ----------------------------------------
  /// 클레임 배송 수령 완료
  /// ----------------------------------------
  static String patchClaimReshipComplete(String claimId) {
    return "/api/v1/seller/claims/$claimId/deliver-reship";
  }

  /// ----------------------------------------
  /// 내 정산 상태별 금액 요약
  /// ----------------------------------------
  static final String getMySettlementSummary =
      "/api/v1/seller/settlements/status-summary";

  /// ----------------------------------------
  /// 증빙관리 - 세금계산서 목록
  /// ----------------------------------------
  static String getSellerTaxInvoices({
    List<String>? types,
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) {
    final queryParams = <String>['page=$page', 'size=$size'];

    if (types != null && types.isNotEmpty) {
      queryParams.addAll(types.map((type) => 'types=$type'));
    }

    if (fromDate != null && fromDate.isNotEmpty) {
      queryParams.add('fromDate=$fromDate');
    }

    if (toDate != null && toDate.isNotEmpty) {
      queryParams.add('toDate=$toDate');
    }

    return '/api/v1/seller/tax-invoices?${queryParams.join("&")}';
  }

  static const String getSellerTaxInvoicesSummary =
      '/api/v1/seller/tax-invoices/summary';

  static String getOrderTaxInvoice(int orderId) {
    return '/api/v1/seller/orders/$orderId/tax-invoice';
  }

  static String getTaxSummary = '/api/v1/seller/tax-invoices/summary';

  /// ----------------------------------------
  /// 내 정산 내역 목록 조회
  /// ----------------------------------------
  static String getMySettlementList(
    List<String> statuses,
    String? fromDate,
    String? toDate, {
    int page = 0,
    int size = 20,
  }) {
    final queryParams = <String>[];

    // 상태 리스트
    queryParams.addAll(statuses.map((s) => "statuses=$s"));

    // fromDate
    if (fromDate != null && fromDate.isNotEmpty) {
      queryParams.add("fromDate=$fromDate");
    }

    // toDate
    if (toDate != null && toDate.isNotEmpty) {
      queryParams.add("toDate=$toDate");
    }

    queryParams.add("page=$page");
    queryParams.add("size=$size");

    final query = queryParams.join("&");
    return "/api/v1/seller/settlements?$query";
  }

  /// ----------------------------------------
  /// 내 정산 내역 상세 조회
  /// ----------------------------------------
  static String getMySettlementDetail(int settlementId) {
    return "/api/v1/seller/settlements/$settlementId";
  }

  /// ----------------------------------------
  /// 택배사 목록 조회
  /// ----------------------------------------

  static String getCarriers() {
    return "/api/v1/carriers";
  }
}
