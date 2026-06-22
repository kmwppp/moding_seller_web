import 'package:moding_president_web/feature/main/presentation/main_page.dart';

class SellerEntryTarget {
  const SellerEntryTarget({this.targetPath, this.mainMenu});

  final String? targetPath;
  final MainMenu? mainMenu;

  bool get hasTarget =>
      (targetPath != null && targetPath!.isNotEmpty) || mainMenu != null;

  String get location => targetPath?.isNotEmpty == true ? targetPath! : '/main';

  static SellerEntryTarget fromUri(Uri uri) {
    final targetPath = uri.queryParameters['sellerPath']?.trim();
    final menuParam = uri.queryParameters['sellerMenu']?.trim();

    return SellerEntryTarget(
      targetPath: targetPath != null && targetPath.isNotEmpty
          ? targetPath
          : null,
      mainMenu: _menuFromQuery(menuParam),
    );
  }

  static MainMenu? _menuFromQuery(String? value) {
    switch (value) {
      case 'dashboard':
        return MainMenu.dashboard;
      case 'product':
        return MainMenu.product;
      case 'order':
        return MainMenu.order;
      case 'evidence':
        return MainMenu.evidence;
      case 'settlement':
        return MainMenu.settlement;
      default:
        return null;
    }
  }
}
