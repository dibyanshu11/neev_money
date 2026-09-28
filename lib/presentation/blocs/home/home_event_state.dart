import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_app/domain/entities/fund_model.dart';
import 'package:new_app/domain/entities/portfolio_model.dart';
import 'package:new_app/domain/entities/user_model.dart';

part 'home_event_state.freezed.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.load() = LoadHome;
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    UserModel? user,
    PortfolioSummary? portfolio,
    @Default([]) List<FundModel> funds,
    String? error,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState();
}
