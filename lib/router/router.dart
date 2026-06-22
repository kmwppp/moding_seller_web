import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_president_web/core/routing/app_navigator_key.dart';
import 'package:moding_president_web/core/routing/seller_entry_target.dart';
import 'package:moding_president_web/core/services/token_storage.dart';
import 'package:moding_president_web/feature/auth/presentation/screens/find_id_page.dart';
import 'package:moding_president_web/feature/auth/presentation/screens/find_id_result_page.dart';
import 'package:moding_president_web/feature/auth/presentation/screens/login_page.dart';
import 'package:moding_president_web/feature/auth/presentation/screens/nice_auth_callback_page.dart';
import 'package:moding_president_web/feature/auth/presentation/screens/reset_password_page.dart';
import 'package:moding_president_web/feature/main/presentation/providers/main_viewmodel.dart';
import 'package:moding_president_web/feature/settlement/presentation/screens/settlement_management_page.dart';
import 'package:moding_president_web/feature/support/domain/enums/support_center_type.dart';
import 'package:moding_president_web/feature/support/presentation/screens/support_center_page.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/seller_profile_info.dart';
import 'package:moding_president_web/feature/business_profile/presentation/screens/seller_profile_edit_page.dart';

import '../feature/claim/presentation/screens/claim_detail_page.dart';
import '../feature/claim/presentation/screens/claim_page.dart';
import '../feature/main/presentation/main_page.dart';
import '../feature/preparing_delivery/presentation/screens/dash_delivery_page.dart';
import '../feature/product/presentation/screens/product_management_page.dart';
import '../feature/product/presentation/screens/product_register_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) async {
      final tokenStorage = ref.read(tokenStorageProvider);
      final isNiceCallback =
          state.uri.queryParameters['niceCallback']?.trim() == '1';
      final forceLogin = state.uri.queryParameters['forceLogin']?.trim() == '1';
      final hasWebViewToken =
          state.uri.queryParameters['webViewToken']?.trim().isNotEmpty ?? false;
      final isLoginRoute =
          state.matchedLocation == '/' || state.matchedLocation == '/login';
      final entryTarget = SellerEntryTarget.fromUri(state.uri);

      if (isLoginRoute && isNiceCallback) {
        final flow = (state.uri.queryParameters['flow']?.trim() ?? '')
            .replaceAll('-', '_');
        final key = state.uri.queryParameters['key']?.trim() ?? '';
        final name = state.uri.queryParameters['name']?.trim() ?? '';
        final phone = state.uri.queryParameters['phone']?.trim() ?? '';

        if (key.isNotEmpty) {
          if (flow == 'find-id') {
            return Uri(
              path: '/find-id',
              queryParameters: {
                'key': key,
                if (name.isNotEmpty) 'name': name,
                if (phone.isNotEmpty) 'phone': phone,
              },
            ).toString();
          }

          if (flow == 'reset_password' ||
              flow == 'identity_verify' ||
              flow == 'identity') {
            return Uri(
              path: '/reset-password',
              queryParameters: {
                'key': key,
                if (flow == 'identity_verify' || flow == 'identity')
                  'mode': 'identityVerify',
                if (name.isNotEmpty) 'name': name,
                if (phone.isNotEmpty) 'phone': phone,
              },
            ).toString();
          }
        }
      }

      if (isLoginRoute && forceLogin) {
        await tokenStorage.deleteAll();
        return null;
      }

      final accessToken = await tokenStorage.getAccessToken();
      final role = await tokenStorage.getRole();
      final hasSellerSession =
          (accessToken?.isNotEmpty ?? false) && role?.toUpperCase() == 'SELLER';

      if (isLoginRoute && hasSellerSession && !hasWebViewToken && !forceLogin) {
        final mainVm = ref.read(mainViewModelProvider.notifier);
        if (entryTarget.mainMenu != null) {
          mainVm.selectMenu(entryTarget.mainMenu!);
        } else {
          mainVm.resetToDashboard();
        }
        return entryTarget.location;
      }

      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/find-id',
        builder: (context, state) => FindIdPage(
          identityVerificationKey: state.uri.queryParameters['key'] ?? '',
          verifiedName: state.uri.queryParameters['name'] ?? '',
          verifiedPhone: state.uri.queryParameters['phone'] ?? '',
        ),
      ),
      GoRoute(
        path: '/find-id/result',
        builder: (context, state) {
          final loginId = state.extra?.toString() ?? '';
          return FindIdResultPage(loginId: loginId);
        },
      ),
      GoRoute(
        path: '/reset-password',
        builder: (context, state) => ResetPasswordPage(
          identityVerificationKey: state.uri.queryParameters['key'] ?? '',
          verifiedName: state.uri.queryParameters['name'] ?? '',
          verifiedPhone: state.uri.queryParameters['phone'] ?? '',
          isIdentityVerifyMode:
              state.uri.queryParameters['mode'] == 'identityVerify',
        ),
      ),
      GoRoute(
        path: '/auth/nice/callback',
        builder: (context, state) => NiceAuthCallbackPage(
          flow: state.uri.queryParameters['flow'] ?? '',
          keyValue: state.uri.queryParameters['key'] ?? '',
          name: state.uri.queryParameters['name'] ?? '',
          phone: state.uri.queryParameters['phone'] ?? '',
        ),
      ),
      GoRoute(path: '/main', builder: (context, state) => const MainPage()),
      GoRoute(
        path: '/dash/preparingForDelivery/read/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final isDashboard =
              state.uri.queryParameters['isDashboard'] == 'true';

          return DashDeliveryPage(orderId: id, isDashboard: isDashboard);
        },
      ),
      GoRoute(
        path: '/product/edit',
        builder: (context, state) {
          return const ProductRegisterPage(productId: null);
        },
      ),
      GoRoute(
        path: '/product/edit/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return ProductRegisterPage(productId: id);
        },
      ),
      GoRoute(
        path: '/product',
        builder: (context, state) => const ProductManagementPage(),
      ),
      GoRoute(path: '/claim', builder: (context, state) => const ClaimPage()),
      GoRoute(
        path: '/claim/detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return ClaimDetailPage(claimId: id);
        },
      ),

      GoRoute(
        path: '/settlement',
        builder: (context, state) => const SettlementManagementPage(),
      ),
      GoRoute(
        path: '/support/notices',
        builder: (context, state) =>
            const SupportCenterPage(type: SupportCenterType.notice),
      ),
      GoRoute(
        path: '/support/faqs',
        builder: (context, state) =>
            const SupportCenterPage(type: SupportCenterType.faq),
      ),
      GoRoute(
        path: '/seller-profile/edit',
        builder: (context, state) => SellerProfileEditPage(
          initialSellerProfile: state.extra is SellerProfileInfo
              ? state.extra as SellerProfileInfo
              : null,
        ),
      ),
    ],
  );
});
