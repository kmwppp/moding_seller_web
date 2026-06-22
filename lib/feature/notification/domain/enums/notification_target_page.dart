enum NotificationTargetPage {
  sellerOrderDetail('SELLER_ORDER_DETAIL'),
  sellerClaimDetail('SELLER_CLAIM_DETAIL'),
  sellerProductDetail('SELLER_PRODUCT_DETAIL'),
  sellerProductList('SELLER_PRODUCT_LIST'),
  sellerOrderList('SELLER_ORDER_LIST'),
  sellerHome('SELLER_HOME'),
  sellerTaxInvoice('SELLER_TAX_INVOICE'),
  sellerSettlement('SELLER_SETTLEMENT'),
  noticeList('NOTICE_LIST'),
  conversionStatus('CONVERSION_STATUS'),
  unknown('');

  const NotificationTargetPage(this.code);

  final String code;

  static NotificationTargetPage fromCode(String? code) {
    switch (code) {
      case 'SELLER_ORDER_DETAIL':
        return NotificationTargetPage.sellerOrderDetail;
      case 'SELLER_CLAIM_DETAIL':
        return NotificationTargetPage.sellerClaimDetail;
      case 'SELLER_PRODUCT_DETAIL':
        return NotificationTargetPage.sellerProductDetail;
      case 'SELLER_PRODUCT_LIST':
        return NotificationTargetPage.sellerProductList;
      case 'SELLER_ORDER_LIST':
        return NotificationTargetPage.sellerOrderList;
      case 'SELLER_HOME':
        return NotificationTargetPage.sellerHome;
      case 'SELLER_TAX_INVOICE':
        return NotificationTargetPage.sellerTaxInvoice;
      case 'SELLER_SETTLEMENT':
        return NotificationTargetPage.sellerSettlement;
      case 'NOTICE_LIST':
        return NotificationTargetPage.noticeList;
      case 'CONVERSION_STATUS':
        return NotificationTargetPage.conversionStatus;
      default:
        return NotificationTargetPage.unknown;
    }
  }
}
