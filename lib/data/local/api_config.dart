class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.neevmoney.com/v1',
  );

  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
}
