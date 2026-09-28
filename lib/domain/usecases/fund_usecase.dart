import 'package:fpdart/fpdart.dart';
import 'package:new_app/core/errors/app_failure.dart';
import 'package:new_app/domain/entities/fund_model.dart';
import 'package:new_app/domain/entities/portfolio_model.dart';
import 'package:new_app/domain/entities/sip_model.dart';
import 'package:new_app/domain/entities/user_model.dart';
import 'package:new_app/domain/repositories/fund_repository.dart';

/// Presentation calls use cases; use cases call domain repositories.
class FundUseCase {
  FundUseCase(this._repository);

  final FundRepository _repository;

  Future<Either<AppFailure, List<FundModel>>> getFunds({String? category}) =>
      _repository.getFunds(category: category);

  Future<Either<AppFailure, FundModel>> getFundById(String id) =>
      _repository.getFundById(id);

  Future<Either<AppFailure, PortfolioSummary>> getPortfolio() =>
      _repository.getPortfolio();

  Future<Either<AppFailure, UserModel>> getUser() => _repository.getUser();

  Future<Either<AppFailure, SipConfirmation>> createSip(SipModel sip) =>
      _repository.createSip(sip);
}
