import 'package:fpdart/fpdart.dart';
import 'package:new_app/data/datasources/remote/fund/fund_apis.dart';
import 'package:new_app/core/errors/app_failure.dart';
import 'package:new_app/domain/entities/fund_model.dart';
import 'package:new_app/domain/entities/portfolio_model.dart';
import 'package:new_app/domain/entities/sip_model.dart';
import 'package:new_app/domain/entities/user_model.dart';
import 'package:new_app/domain/repositories/fund_repository.dart';

class FundRepositoryImpl implements FundRepository {
  FundRepositoryImpl({FundApis? fundApis}) : _fundApis = fundApis ?? FundApis();

  final FundApis _fundApis;

  @override
  Future<Either<AppFailure, List<FundModel>>> getFunds({String? category}) =>
      _fundApis.getFunds(category: category);

  @override
  Future<Either<AppFailure, FundModel>> getFundById(String id) =>
      _fundApis.getFundById(id);

  @override
  Future<Either<AppFailure, PortfolioSummary>> getPortfolio() =>
      _fundApis.getPortfolio();

  @override
  Future<Either<AppFailure, UserModel>> getUser() => _fundApis.getUser();

  @override
  Future<Either<AppFailure, SipConfirmation>> createSip(SipModel sip) =>
      _fundApis.createSip(sip);
}
