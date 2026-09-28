/// App API path constants (spreadsheet / Neev backend).
class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const sendOtp = '/auth/otp/send';
  static const verifyOtp = '/auth/otp/verify';
  static const resendOtp = '/auth/otp/resend';

  // User
  static const me = '/users/me';

  // Funds
  static const funds = '/funds';
  static String fundById(String id) => '/funds/$id';
  static const fundSearch = '/funds/search';

  // Portfolio / SIP
  static const portfolio = '/portfolio';
  static const sip = '/sip';
}
