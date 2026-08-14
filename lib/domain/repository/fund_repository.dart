import 'package:fpdart/fpdart.dart';
import 'package:new_app/data/remote/connect_helper/fund_connect_helper.dart';
import 'package:new_app/domain/entity/app_failure.dart';
import 'package:new_app/domain/models/fund_model.dart';
import 'package:new_app/domain/models/portfolio_model.dart';
import 'package:new_app/domain/models/sip_model.dart';
import 'package:new_app/domain/models/user_model.dart';

class FundRepository {
  FundRepository._();
  static final FundRepository _instance = FundRepository._();
  factory FundRepository() => _instance;

  final _helper = FundConnectHelper();

  Future<Either<AppFailure, List<FundModel>>> getFunds({String? category}) =>
      _helper.getFunds(category: category);

  Future<Either<AppFailure, FundModel>> getFundById(String id) =>
      _helper.getFundById(id);

  Future<Either<AppFailure, PortfolioSummary>> getPortfolio() =>
      _helper.getPortfolio();

  Future<Either<AppFailure, UserModel>> getUser() => _helper.getUser();

  Future<Either<AppFailure, SipConfirmation>> createSip(SipModel sip) =>
      _helper.createSip(sip);
}
