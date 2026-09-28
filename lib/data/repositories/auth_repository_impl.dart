import 'package:fpdart/fpdart.dart';
import 'package:new_app/data/datasources/remote/auth/auth_apis.dart';
import 'package:new_app/core/errors/app_failure.dart';
import 'package:new_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({AuthApis? authApis}) : _authApis = authApis ?? AuthApis();

  final AuthApis _authApis;

  @override
  Future<Either<AppFailure, bool>> sendOtp(String phone) =>
      _authApis.sendOtp(phone);

  @override
  Future<Either<AppFailure, String>> verifyOtp(String phone, String otp) =>
      _authApis.verifyOtp(phone, otp);

  @override
  Future<Either<AppFailure, bool>> saveGoal(String goal) =>
      _authApis.saveGoal(goal);
}
