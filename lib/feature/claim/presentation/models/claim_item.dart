class ClaimItem {
  final String id;
  final String status;
  final String orderNumber;
  final String productName;
  final String claimType;
  final String date;

  const ClaimItem({
    required this.id,
    required this.status,
    required this.orderNumber,
    required this.productName,
    required this.claimType,
    required this.date,
  });
}

const List<ClaimItem> dummyClaims = [
  ClaimItem(
    id: '1',
    status: '대기',
    orderNumber: 'N123456-1234',
    productName: '돈까스 소스 (매운맛)',
    claimType: '수량 문제',
    date: '2026-01-02',
  ),
  ClaimItem(
    id: '2',
    status: '처리중',
    orderNumber: 'N123456-1235',
    productName: '돈까스 소스 (매운맛)',
    claimType: '수량 문제',
    date: '2026-01-02',
  ),
  ClaimItem(
    id: '3',
    status: '완료',
    orderNumber: 'N123456-1236',
    productName: '돈까스 소스 (매운맛)',
    claimType: '수량 문제',
    date: '2026-01-02',
  ),
];
