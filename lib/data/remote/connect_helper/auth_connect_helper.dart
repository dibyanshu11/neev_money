import 'package:fpdart/fpdart.dart';
import 'package:new_app/data/local/token_storage.dart';
import 'package:new_app/domain/entity/app_failure.dart';

class AuthConnectHelper {
  AuthConnectHelper._();
  static final AuthConnectHelper _instance = AuthConnectHelper._();
  factory AuthConnectHelper() => _instance;

  Future<Either<AppFailure, bool>> sendOtp(String phone) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (phone.length < 10) {
      return left(const AppFailure.serverError('Invalid phone number'));
    }
    return right(true);
  }

  Future<Either<AppFailure, String>> verifyOtp(String phone, String otp) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (otp == '123456' || otp.length == 6) {
      const token = 'mock_jwt_token';
      await TokenStorage().saveToken(token);
      return right(token);
    }
    return left(const AppFailure.serverError('Invalid OTP'));
  }

  Future<Either<AppFailure, bool>> saveGoal(String goal) async {
    await Future.delayed(const Duration(milliseconds: 400));
    await TokenStorage().saveGoal(goal);
    return right(true);
  }
}
