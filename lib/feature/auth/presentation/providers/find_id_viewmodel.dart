import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:moding_president_web/feature/auth/domain/entities/find_id_result.dart';
import 'package:moding_president_web/feature/auth/presentation/providers/find_id_state.dart';

final findIdViewModelProvider = NotifierProvider<FindIdViewModel, FindIdState>(
  FindIdViewModel.new,
);

class FindIdViewModel extends Notifier<FindIdState> {
  @override
  FindIdState build() => FindIdState.initial();

  Future<FindIdResult> submit(String identityVerificationKey) async {
    if (identityVerificationKey.trim().isEmpty) {
      return const FindIdResult(success: false, message: '본인인증 정보가 없습니다.');
    }

    state = state.copyWith(isLoading: true);

    try {
      final result = await ref
          .read(authRepositoryProvider)
          .findId(identityVerificationKey.trim());

      if (result.success && (result.loginId?.isNotEmpty ?? false)) {
        state = state.copyWith(foundLoginId: result.loginId!);
      }

      return result;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
