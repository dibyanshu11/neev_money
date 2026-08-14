import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/domain/repository/fund_repository.dart';
import 'package:new_app/presentation/blocs/portfolio/portfolio_event_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({FundRepository? repository})
      : _repository = repository ?? FundRepository(),
        super(PortfolioState.initial()) {
    on<LoadPortfolio>(_onLoad);
  }

  final FundRepository _repository;

  Future<void> _onLoad(LoadPortfolio event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _repository.getPortfolio();
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: 'Failed to load')),
      (portfolio) => emit(state.copyWith(isLoading: false, portfolio: portfolio)),
    );
  }
}
