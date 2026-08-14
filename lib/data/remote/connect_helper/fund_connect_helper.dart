import 'package:fpdart/fpdart.dart';
import 'package:new_app/data/local/mock_data.dart';
import 'package:new_app/domain/entity/app_failure.dart';
import 'package:new_app/domain/models/fund_model.dart';
import 'package:new_app/domain/models/portfolio_model.dart';
import 'package:new_app/domain/models/sip_model.dart';
import 'package:new_app/domain/models/user_model.dart';

class FundConnectHelper {
  FundConnectHelper._();
  static final FundConnectHelper _instance = FundConnectHelper._();
  factory FundConnectHelper() => _instance;

  Future<Either<AppFailure, List<FundModel>>> getFunds({String? category}) async {
    await Future.delayed(const Duration(milliseconds: 600));
    var funds = MockData.funds;
    if (category != null && category != 'For you') {
      funds = funds.where((f) => f.category == category).toList();
    }
    return right(funds);
  }

  Future<Either<AppFailure, FundModel>> getFundById(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    try {
      return right(MockData.funds.firstWhere((f) => f.id == id));
    } catch (_) {
      return left(const AppFailure.notFound());
    }
  }

  Future<Either<AppFailure, PortfolioSummary>> getPortfolio() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return right(MockData.portfolio);
  }

  Future<Either<AppFailure, UserModel>> getUser() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return right(MockData.user);
  }

  Future<Either<AppFailure, SipConfirmation>> createSip(SipModel sip) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return right(
      SipConfirmation(
        folioNumber: 'NEV${DateTime.now().millisecondsSinceEpoch % 100000}',
        nextDebitDate: DateTime.now().add(const Duration(days: 30)),
        amount: sip.amount,
        fundName: sip.fundName,
      ),
    );
  }
}
