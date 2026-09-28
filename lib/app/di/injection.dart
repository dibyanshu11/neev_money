import 'package:new_app/data/repositories/auth_repository_impl.dart';
import 'package:new_app/data/repositories/fund_repository_impl.dart';
import 'package:new_app/domain/repositories/auth_repository.dart';
import 'package:new_app/domain/repositories/fund_repository.dart';
import 'package:new_app/domain/usecases/auth_usecase.dart';
import 'package:new_app/domain/usecases/fund_usecase.dart';

/// Wires clean-architecture layers (service locator).
class Injection {
  Injection._();

  static final FundRepository fundRepository = FundRepositoryImpl();
  static final AuthRepository authRepository = AuthRepositoryImpl();

  static final FundUseCase fundUseCase = FundUseCase(fundRepository);
  static final AuthUseCase authUseCase = AuthUseCase(authRepository);
}
