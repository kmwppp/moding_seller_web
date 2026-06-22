import 'package:flutter/material.dart';
import 'package:moding_president_web/core/presentation/dialogs/widgets/confirm_dialog.dart';
import 'package:moding_president_web/core/presentation/dialogs/widgets/loading_dialog.dart';
import 'package:moding_president_web/core/presentation/dialogs/widgets/result_dialog.dart';

class AppDialog {
  /// 결과 다이얼로그
  static Future<void> showResult(
    BuildContext context, {
    required String message,
    bool isSuccess = false,
    VoidCallback? onConfirm,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false, // 바깥 클릭해도 안닫힘
      builder: (_) => ResultDialog(
        message: message,
        isSuccess: isSuccess,
        onConfirm: onConfirm,
      ),
    );
  }

  /// 성공 전용
  static Future<void> showSuccess(
    BuildContext context,
    String message, {
    VoidCallback? onConfirm,
  }) {
    return showResult(
      context,
      message: message,
      isSuccess: true,
      onConfirm: onConfirm,
    );
  }

  /// 실패 전용
  static Future<void> showError(BuildContext context, String message) {
    return showResult(context, message: message, isSuccess: false);
  }

  /// 확인 다이얼로그
  static Future<bool> showConfirm(
    BuildContext context, {
    required String message,
    VoidCallback? onConfirm,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmDialog(message: message, onConfirm: onConfirm),
    );

    return result ?? false;
  }

  /// 로딩 다이얼로그
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const LoadingDialog(),
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
