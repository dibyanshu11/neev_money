import 'package:fpdart/fpdart.dart';
import 'package:new_app/core/network/api_endpoints.dart';
import 'package:new_app/core/network/api_config.dart';
import 'package:new_app/data/datasources/local/mock_data.dart';
import 'package:new_app/data/models/api_response.dart';
import 'package:new_app/core/network/api_requests.dart';
import 'package:new_app/core/errors/app_failure.dart';
import 'package:new_app/domain/entities/fund_model.dart';
import 'package:new_app/domain/entities/portfolio_model.dart';
import 'package:new_app/domain/entities/sip_model.dart';
import 'package:new_app/domain/entities/user_model.dart';

/// Remote fund / portfolio / SIP APIs (Dahn connect_apis style).
class FundApis {
  FundApis._();
  static final FundApis _instance = FundApis._();
  factory FundApis() => _instance;

  final ApiRequests _api = ApiRequests();

  Future<Either<AppFailure, List<FundModel>>> getFunds({String? category}) async {
    if (ApiConfig.useMock) {
      await Future.delayed(const Duration(milliseconds: 600));
      var funds = MockData.funds;
      if (category != null && category != 'For you') {
        funds = funds.where((f) => f.category == category).toList();
      }
      return right(funds);
    }

    final result = await _api.makeRequest(
      method: MethodRequest.get,
      path: ApiEndpoints.funds,
      queryParameters: {
        if (category != null && category != 'For you') 'category': category,
      },
    );
    return result.flatMap(_parseFundList);
  }

  Future<Either<AppFailure, FundModel>> getFundById(String id) async {
    if (ApiConfig.useMock) {
      await Future.delayed(const Duration(milliseconds: 400));
      try {
        return right(MockData.funds.firstWhere((f) => f.id == id));
      } catch (_) {
        return left(const AppFailure.notFound());
      }
    }

    final result = await _api.makeRequest(
      method: MethodRequest.get,
      path: ApiEndpoints.fundById(id),
    );
    return result.flatMap(_parseFund);
  }

  Future<Either<AppFailure, PortfolioSummary>> getPortfolio() async {
    if (ApiConfig.useMock) {
      await Future.delayed(const Duration(milliseconds: 600));
      return right(MockData.portfolio);
    }

    final result = await _api.makeRequest(
      method: MethodRequest.get,
      path: ApiEndpoints.portfolio,
    );
    return result.flatMap(_parsePortfolio);
  }

  Future<Either<AppFailure, UserModel>> getUser() async {
    if (ApiConfig.useMock) {
      await Future.delayed(const Duration(milliseconds: 400));
      return right(MockData.user);
    }

    final result = await _api.makeRequest(
      method: MethodRequest.get,
      path: ApiEndpoints.me,
    );
    return result.flatMap(_parseUser);
  }

  Future<Either<AppFailure, SipConfirmation>> createSip(SipModel sip) async {
    if (ApiConfig.useMock) {
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

    final result = await _api.makeRequest(
      method: MethodRequest.post,
      path: ApiEndpoints.sip,
      data: sip.toJson(),
    );
    return result.flatMap(_parseSipConfirmation);
  }

  Either<AppFailure, List<FundModel>> _parseFundList(ApiResponse response) {
    try {
      final raw = response.data;
      final list = raw is Map ? raw['data'] ?? raw['funds'] : raw;
      if (list is! List) {
        return left(const AppFailure.serverError('Invalid funds response'));
      }
      return right(
        list
            .whereType<Map>()
            .map((e) => FundModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (_) {
      return left(const AppFailure.serverError('Failed to parse funds'));
    }
  }

  Either<AppFailure, FundModel> _parseFund(ApiResponse response) {
    try {
      final raw = response.data;
      final map = raw is Map && raw['data'] is Map ? raw['data'] : raw;
      if (map is! Map) {
        return left(const AppFailure.serverError('Invalid fund response'));
      }
      return right(FundModel.fromJson(Map<String, dynamic>.from(map)));
    } catch (_) {
      return left(const AppFailure.serverError('Failed to parse fund'));
    }
  }

  Either<AppFailure, PortfolioSummary> _parsePortfolio(ApiResponse response) {
    try {
      final raw = response.data;
      final map = raw is Map && raw['data'] is Map ? raw['data'] : raw;
      if (map is! Map) {
        return left(const AppFailure.serverError('Invalid portfolio response'));
      }
      return right(PortfolioSummary.fromJson(Map<String, dynamic>.from(map)));
    } catch (_) {
      return left(const AppFailure.serverError('Failed to parse portfolio'));
    }
  }

  Either<AppFailure, UserModel> _parseUser(ApiResponse response) {
    try {
      final raw = response.data;
      final map = raw is Map && raw['data'] is Map ? raw['data'] : raw;
      if (map is! Map) {
        return left(const AppFailure.serverError('Invalid user response'));
      }
      return right(UserModel.fromJson(Map<String, dynamic>.from(map)));
    } catch (_) {
      return left(const AppFailure.serverError('Failed to parse user'));
    }
  }

  Either<AppFailure, SipConfirmation> _parseSipConfirmation(ApiResponse response) {
    try {
      final raw = response.data;
      final map = raw is Map && raw['data'] is Map ? raw['data'] : raw;
      if (map is! Map) {
        return left(const AppFailure.serverError('Invalid SIP response'));
      }
      return right(SipConfirmation.fromJson(Map<String, dynamic>.from(map)));
    } catch (_) {
      return left(const AppFailure.serverError('Failed to parse SIP'));
    }
  }
}
