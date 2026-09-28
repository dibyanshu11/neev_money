import 'package:new_app/core/errors/app_failure.dart';

extension AppFailureMessage on AppFailure {
  String get userMessage => when(
        serverError: (message) => message.isNotEmpty
            ? message
            : 'Something went wrong. Please try again.',
        connectionFailure: () => 'No internet connection',
        unauthorized: () => 'Session expired. Please login again.',
        notFound: () => 'Resource not found',
        unknown: () => 'Something went wrong. Please try again.',
      );
}
