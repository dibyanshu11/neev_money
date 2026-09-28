import 'package:fpdart/fpdart.dart';
import 'package:new_app/core/network/api_endpoints.dart';
import 'package:new_app/core/network/api_config.dart';
import 'package:new_app/data/datasources/local/token_storage.dart';
import 'package:new_app/core/network/api_requests.dart';
import 'package:new_app/core/errors/app_failure.dart';

/// Remote auth APIs (Dahn connect_apis style).
class AuthApis {
  AuthApis._();
  static final AuthApis _instance = AuthApis._();
  factory AuthApis() => _instance;

  final ApiRequests _api = ApiRequests();

  Future<Either<AppFailure, bool>> sendOtp(String phone) async {
    if (ApiConfig.useMock) {
      await Future.delayed(const Duration(milliseconds: 800));
      if (phone.length < 10) {
        return left(const AppFailure.serverError('Invalid phone number'));
      }
      return right(true);
    }

    final result = await _api.makeRequest(
      method: MethodRequest.post,
      path: ApiEndpoints.sendOtp,
      data: {'phone': phone},
    );
    return result.map((_) => true);
  }

  Future<Either<AppFailure, String>> verifyOtp(String phone, String otp) async {
    if (ApiConfig.useMock) {
      await Future.delayed(const Duration(milliseconds: 800));
      if (otp == '123456' || otp.length == 6) {
        const token = 'mock_jwt_token';
        await TokenStorage().saveToken(token);
        return right(token);
      }
      return left(const AppFailure.serverError('Invalid OTP'));
    }

    final result = await _api.makeRequest(
      method: MethodRequest.post,
      path: ApiEndpoints.verifyOtp,
      data: {'phone': phone, 'otp': otp},
    );
    if (result.isLeft()) {
      return left(result.getLeft().toNullable()!);
    }
    final response = result.getRight().toNullable()!;
    final raw = response.data;
    final token = raw is Map
        ? (raw['token'] ??
                raw['access_token'] ??
                (raw['data'] is Map ? raw['data']['token'] : null))
            ?.toString()
        : null;
    if (token == null || token.isEmpty) {
      return left(const AppFailure.serverError('Token missing in response'));
    }
    await TokenStorage().saveToken(token);
    return right(token);
  }

  Future<Either<AppFailure, bool>> saveGoal(String goal) async {
    if (ApiConfig.useMock) {
      await Future.delayed(const Duration(milliseconds: 400));
      await TokenStorage().saveGoal(goal);
      return right(true);
    }

    final result = await _api.makeRequest(
      method: MethodRequest.post,
      path: '/onboarding/goals',
      data: {'goal': goal},
    );
    return result.map((_) {
      TokenStorage().saveGoal(goal);
      return true;
    });
  }
}
