class LoginState {
  const LoginState({
    required this.isSubmitting,
    required this.isWebViewSigningIn,
  });

  factory LoginState.initial() {
    return const LoginState(isSubmitting: false, isWebViewSigningIn: false);
  }

  final bool isSubmitting;
  final bool isWebViewSigningIn;

  LoginState copyWith({bool? isSubmitting, bool? isWebViewSigningIn}) {
    return LoginState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isWebViewSigningIn: isWebViewSigningIn ?? this.isWebViewSigningIn,
    );
  }
}
