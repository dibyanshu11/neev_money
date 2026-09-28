import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/errors/app_failure_ext.dart';
import 'package:new_app/core/errors/app_failure_handling.dart';
import 'package:new_app/data/datasources/local/user_prefs.dart';
import 'package:new_app/app/di/injection.dart';
import 'package:new_app/domain/entities/fund_model.dart';
import 'package:new_app/domain/entities/portfolio_model.dart';
import 'package:new_app/domain/entities/user_model.dart';
import 'package:new_app/domain/usecases/fund_usecase.dart';
import 'package:new_app/presentation/blocs/home/home_event_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({FundUseCase? fundUseCase})
      : _fundUseCase = fundUseCase ?? Injection.fundUseCase,
        super(HomeState.initial()) {
    on<LoadHome>(_onLoad);
  }

  final FundUseCase _fundUseCase;

  Future<void> _onLoad(LoadHome event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final prefs = UserPrefs.instance;
    final prefsName = await prefs.getName();
    final prefsEmail = await prefs.getEmail();
    final prefsPhone = await prefs.getPhone();

    final userResult = await _fundUseCase.getUser();
    final portfolioResult = await _fundUseCase.getPortfolio();
    final fundsResult = await _fundUseCase.getFunds();

    if (userResult.isLeft()) {
      final failure = userResult.getLeft().toNullable()!;
      showAppFailure(failure);
      emit(state.copyWith(isLoading: false, error: failure.userMessage));
      return;
    }

    final user = userResult.getRight().toNullable()!;
    final merged = UserModel(
      id: user.id,
      name: prefsName.isNotEmpty ? prefsName : user.name,
      email: prefsEmail.isNotEmpty ? prefsEmail : user.email,
      phone: prefsPhone.isNotEmpty ? prefsPhone : user.phone,
      isKycVerified: user.isKycVerified,
    );

    PortfolioSummary? portfolio;
    if (portfolioResult.isLeft()) {
      showAppFailure(portfolioResult.getLeft().toNullable()!);
    } else {
      portfolio = portfolioResult.getRight().toNullable();
    }

    List<FundModel> funds = const [];
    if (fundsResult.isLeft()) {
      showAppFailure(fundsResult.getLeft().toNullable()!);
    } else {
      funds = fundsResult.getRight().toNullable()!.take(3).toList();
    }

    emit(state.copyWith(
      isLoading: false,
      user: merged,
      portfolio: portfolio,
      funds: funds,
      error: null,
    ));
  }
}
