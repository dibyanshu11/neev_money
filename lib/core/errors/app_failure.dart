import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
sealed class AppFailure with _$AppFailure {
  const factory AppFailure.serverError(String message) = ServerError;
  const factory AppFailure.connectionFailure() = ConnectionFailure;
  const factory AppFailure.unauthorized() = Unauthorized;
  const factory AppFailure.notFound() = NotFound;
  const factory AppFailure.unknown() = UnknownFailure;
}
