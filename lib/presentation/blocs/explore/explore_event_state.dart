import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_app/domain/entities/fund_model.dart';

part 'explore_event_state.freezed.dart';

@freezed
sealed class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.load() = LoadExplore;
  const factory ExploreEvent.filterChanged(String category) = FilterChanged;
  const factory ExploreEvent.searchChanged(String query) = SearchChanged;
}

@freezed
abstract class ExploreState with _$ExploreState {
  const factory ExploreState({
    @Default(false) bool isLoading,
    @Default([]) List<FundModel> funds,
    @Default([]) List<FundModel> filteredFunds,
    @Default('For you') String selectedFilter,
    @Default('') String searchQuery,
    String? error,
  }) = _ExploreState;

  factory ExploreState.initial() => const ExploreState();
}
