import 'package:fpdart/fpdart.dart';
import 'package:new_app/core/errors/app_failure.dart';

/// Domain contract for auth / OTP.
abstract class AuthRepository {
  Future<Either<AppFailure, bool>> sendOtp(String phone);

  Future<Either<AppFailure, String>> verifyOtp(String phone, String otp);

  Future<Either<AppFailure, bool>> saveGoal(String goal);
}
