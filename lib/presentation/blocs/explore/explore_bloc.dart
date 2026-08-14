import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/domain/repository/fund_repository.dart';
import 'package:new_app/domain/models/fund_model.dart';
import 'package:new_app/presentation/blocs/explore/explore_event_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc({FundRepository? repository})
      : _repository = repository ?? FundRepository(),
        super(ExploreState.initial()) {
    on<LoadExplore>(_onLoad);
    on<FilterChanged>(_onFilterChanged);
    on<SearchChanged>(_onSearchChanged);
  }

  final FundRepository _repository;

  Future<void> _onLoad(LoadExplore event, Emitter<ExploreState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _repository.getFunds();
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: 'Failed to load')),
      (funds) => emit(state.copyWith(
        isLoading: false,
        funds: funds,
        filteredFunds: funds,
      )),
    );
  }

  Future<void> _onFilterChanged(
    FilterChanged event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, selectedFilter: event.category));
    final result = await _repository.getFunds(category: event.category);
    result.fold(
      (f) => emit(state.copyWith(isLoading: false)),
      (funds) {
        final filtered = _applySearch(funds, state.searchQuery);
        emit(state.copyWith(
          isLoading: false,
          funds: funds,
          filteredFunds: filtered,
        ));
      },
    );
  }

  void _onSearchChanged(SearchChanged event, Emitter<ExploreState> emit) {
    final filtered = _applySearch(state.funds, event.query);
    emit(state.copyWith(searchQuery: event.query, filteredFunds: filtered));
  }

  List<FundModel> _applySearch(List<FundModel> funds, String query) {
    if (query.isEmpty) return funds;
    return funds
        .where((f) => f.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
