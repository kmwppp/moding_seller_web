import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/main/presentation/main_page.dart';
import 'package:moding_president_web/feature/main/presentation/providers/main_viewmodel.dart';
import 'package:moding_president_web/router/router.dart';

import 'core/constants/app_colors.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  StreamSubscription<html.MessageEvent>? _bridgeSubscription;

  @override
  void initState() {
    super.initState();
    _bridgeSubscription = html.window.onMessage.listen(_handleBridgeMessage);
  }

  @override
  void dispose() {
    _bridgeSubscription?.cancel();
    super.dispose();
  }

  void _handleBridgeMessage(html.MessageEvent event) {
    final data = event.data;
    if (data is! String || data.isEmpty) {
      return;
    }

    try {
      final decoded = jsonDecode(data);
      if (decoded is! Map<String, dynamic>) {
        return;
      }

      final type = decoded['type']?.toString();
      final payload = decoded['payload'] is Map
          ? Map<String, dynamic>.from(decoded['payload'] as Map)
          : <String, dynamic>{};
      final router = ref.read(goRouterProvider);

      if (type == 'navigateToPath') {
        final path = payload['path']?.toString();
        if (path != null && path.isNotEmpty) {
          router.go(path);
        }
        return;
      }

      if (type == 'selectMainMenu') {
        final menu = _menuFromPayload(payload['menu']?.toString());
        if (menu != null) {
          ref.read(mainViewModelProvider.notifier).selectMenu(menu);
          router.go('/main');
        }
      }
    } catch (_) {}
  }

  MainMenu? _menuFromPayload(String? value) {
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

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.pointColor,
          selectionHandleColor: AppColors.pointColor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      // --- 한국어 설정을 위한 핵심 코드 ---
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'), // 한국어
        Locale('en', 'US'), // 영어 (선택 사항)
      ],
      locale: const Locale('ko', 'KR'), // 기본 언어를 한국어로 강제 설정
    );
  }
}
