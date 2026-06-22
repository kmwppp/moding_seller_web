import 'package:flutter/material.dart';

class AppResponsiveLayout {
  // 모바일: 600 미만
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  // 태블릿: 600 이상 1024 미만
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width <= 1024;

  // 웹/데스크톱: 1024 초과
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1024;

  // 대시보드 데스크톱 예외처리
  static bool isDesktopDashBoardExcept(BuildContext context) =>
      MediaQuery.of(context).size.width < 1400;

  // 상품관리 상단 전체/판매충/판매중지 섹션 데스크톱 예외처리
  static bool isDesktopProductManagementTopExcept(BuildContext context) =>
      MediaQuery.of(context).size.width < 1600;

  static bool isDesktopProductManagementTopExcept2(BuildContext context) =>
      MediaQuery.of(context).size.width < 1600 &&
      MediaQuery.of(context).size.width > 1200;

  // // 상품관리 리스트 섹션 데스크톱 예외처리
  static bool isDesktopProductManagementListExcept(BuildContext context) =>
      MediaQuery.of(context).size.width > 1260;

  // 주문관리 상단 섹션 데스크톱 예외처리
  static bool isDesktopOrderManagementTopExcept(BuildContext context) =>
      MediaQuery.of(context).size.width < 1350;

  // 주문관리 상단 섹션 태블릿 예외처리
  static bool isTabletOrderManagementTopExcept(BuildContext context) =>
      MediaQuery.of(context).size.width < 923;
}
