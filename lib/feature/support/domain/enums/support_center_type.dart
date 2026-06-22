enum SupportCenterType {
  notice(
    title: '공지사항',
    description: '판매자 운영에 필요한 새 소식과 점검 안내를 한곳에서 확인할 수 있어요.',
  ),
  faq(title: '자주 묻는 질문', description: '판매자분들이 자주 찾는 질문을 주제별로 빠르게 모아봤어요.');

  const SupportCenterType({required this.title, required this.description});

  final String title;
  final String description;
}
