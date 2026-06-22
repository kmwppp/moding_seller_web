class ResetPasswordState {
  const ResetPasswordState({
    required this.isLoading,
    required this.loginId,
    required this.newPassword,
    required this.newPasswordConfirm,
  });

  final bool isLoading;
  final String loginId;
  final String newPassword;
  final String newPasswordConfirm;

  factory ResetPasswordState.initial() {
    return const ResetPasswordState(
      isLoading: false,
      loginId: '',
      newPassword: '',
      newPasswordConfirm: '',
    );
  }

  ResetPasswordState copyWith({
    bool? isLoading,
    String? loginId,
    String? newPassword,
    String? newPasswordConfirm,
  }) {
    return ResetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      loginId: loginId ?? this.loginId,
      newPassword: newPassword ?? this.newPassword,
      newPasswordConfirm: newPasswordConfirm ?? this.newPasswordConfirm,
    );
  }
}
