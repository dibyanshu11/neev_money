import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/app/di/injection.dart';
import 'package:new_app/domain/usecases/fund_usecase.dart';
import 'package:new_app/presentation/blocs/portfolio/portfolio_event_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({FundUseCase? fundUseCase})
      : _fundUseCase = fundUseCase ?? Injection.fundUseCase,
        super(PortfolioState.initial()) {
    on<LoadPortfolio>(_onLoad);
  }

  final FundUseCase _fundUseCase;

  Future<void> _onLoad(LoadPortfolio event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _fundUseCase.getPortfolio();
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: 'Failed to load')),
      (portfolio) =>
          emit(state.copyWith(isLoading: false, portfolio: portfolio)),
    );
  }
}
