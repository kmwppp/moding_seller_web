import 'dart:convert';
import 'dart:js' as js;

import 'package:flutter/foundation.dart';

bool get isAppWebView {
  if (!kIsWeb) {
    return false;
  }

  return js.context.hasProperty('AppBridge');
}

void sendAppBridgeMessage({
  required String type,
  Map<String, dynamic>? payload,
}) {
  if (!kIsWeb) return;

  try {
    if (isAppWebView) {
      final message = jsonEncode({
        'type': type,
        if (payload != null) 'payload': payload,
      });

      js.context['AppBridge'].callMethod('postMessage', [message]);
    } else {
      debugPrint('Bridge: AppBridge가 정의되지 않았습니다. (일반 브라우저 환경)');
    }
  } catch (e) {
    debugPrint('Bridge Error: $e');
  }
}

void sendGoMain() {
  sendAppBridgeMessage(type: 'goMain');
}

void sendCurrentMenu(String menu) {
  sendAppBridgeMessage(type: 'menuChanged', payload: {'menu': menu});
}

void sendWebMainReady() {
  sendAppBridgeMessage(type: 'webMainReady');
}

void sendOpenIdentityVerification({
  String successRoute = '/edit_my_info',
}) {
  sendAppBridgeMessage(
    type: 'openIdentityVerification',
    payload: {
      'successRoute': successRoute,
    },
  );
}
