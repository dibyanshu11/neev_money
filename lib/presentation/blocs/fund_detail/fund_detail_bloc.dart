import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/domain/repository/fund_repository.dart';
import 'package:new_app/presentation/blocs/fund_detail/fund_detail_event_state.dart';

class FundDetailBloc extends Bloc<FundDetailEvent, FundDetailState> {
  FundDetailBloc({FundRepository? repository})
      : _repository = repository ?? FundRepository(),
        super(FundDetailState.initial()) {
    on<LoadFundDetail>(_onLoad);
    on<ChartPeriodChanged>(_onPeriodChanged);
  }

  final FundRepository _repository;

  Future<void> _onLoad(LoadFundDetail event, Emitter<FundDetailState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _repository.getFundById(event.fundId);
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
