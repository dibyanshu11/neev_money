import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/app/di/injection.dart';
import 'package:new_app/domain/usecases/fund_usecase.dart';
import 'package:new_app/presentation/blocs/fund_detail/fund_detail_event_state.dart';

class FundDetailBloc extends Bloc<FundDetailEvent, FundDetailState> {
  FundDetailBloc({FundUseCase? fundUseCase})
      : _fundUseCase = fundUseCase ?? Injection.fundUseCase,
        super(FundDetailState.initial()) {
    on<LoadFundDetail>(_onLoad);
    on<ChartPeriodChanged>(_onPeriodChanged);
  }

  final FundUseCase _fundUseCase;

  Future<void> _onLoad(
    LoadFundDetail event,
    Emitter<FundDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _fundUseCase.getFundById(event.fundId);
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: 'Fund not found')),
      (fund) => emit(state.copyWith(isLoading: false, fund: fund)),
    );
  }

  void _onPeriodChanged(
    ChartPeriodChanged event,
    Emitter<FundDetailState> emit,
  ) {
    emit(state.copyWith(selectedPeriod: event.period));
  }
}
