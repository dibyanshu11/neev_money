import 'package:fpdart/fpdart.dart';
import 'package:new_app/core/errors/app_failure.dart';
import 'package:new_app/domain/entities/fund_model.dart';
import 'package:new_app/domain/entities/portfolio_model.dart';
import 'package:new_app/domain/entities/sip_model.dart';
import 'package:new_app/domain/entities/user_model.dart';

/// Domain contract — no data-layer imports.
abstract class FundRepository {
  Future<Either<AppFailure, List<FundModel>>> getFunds({String? category});

  Future<Either<AppFailure, FundModel>> getFundById(String id);

  Future<Either<AppFailure, PortfolioSummary>> getPortfolio();

  Future<Either<AppFailure, UserModel>> getUser();

  Future<Either<AppFailure, SipConfirmation>> createSip(SipModel sip);
}
