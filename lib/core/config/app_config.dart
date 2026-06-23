class AppConfig {
  static const String env = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'test',
  );

  static const String _apiBaseUrlOverride = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: '',
  );

  static bool get isProd => env == 'prod';

  static bool get isTest => env == 'test';

  static String get apiBaseUrl {
    if (_apiBaseUrlOverride.trim().isNotEmpty) {
      return _normalizeBaseUrl(_apiBaseUrlOverride);
    }

    return _normalizeBaseUrl(_defaultApiBaseUrl);
  }

  static String get _defaultApiBaseUrl {
    switch (env) {
      case 'prod':
        return 'http://moding.iiiii.info:8080';
      case 'test':
      default:
        return 'http://192.168.219.53:8080';
    }
  }

  static String _normalizeBaseUrl(String value) {
    final trimmed = value.trim();
    if (trimmed.endsWith('/')) {
      return trimmed;
    }
    return '$trimmed/';
  }
}
