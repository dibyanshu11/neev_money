import 'package:fpdart/fpdart.dart';
import 'package:new_app/core/errors/app_failure.dart';
import 'package:new_app/domain/repositories/auth_repository.dart';

class AuthUseCase {
  AuthUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<AppFailure, bool>> sendOtp(String phone) =>
      _repository.sendOtp(phone);

  Future<Either<AppFailure, String>> verifyOtp(String phone, String otp) =>
      _repository.verifyOtp(phone, otp);

  Future<Either<AppFailure, bool>> saveGoal(String goal) =>
      _repository.saveGoal(goal);
}
