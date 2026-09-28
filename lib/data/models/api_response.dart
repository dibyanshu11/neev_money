class ApiResponse {
  final dynamic data;
  final int statusCode;
  final String? errorMessage;
  final String? message;
  final bool? hasError;

  ApiResponse({
    required this.data,
    required this.statusCode,
    this.errorMessage,
    this.hasError,
    this.message,
  });
}
