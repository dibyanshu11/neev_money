class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.neevmoney.com/v1',
  );

  /// `true` until the Neev backend is live. Connect APIs use mock data then.
  static const useMock = bool.fromEnvironment(
    'USE_MOCK_API',
    defaultValue: true,
  );

  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
}
