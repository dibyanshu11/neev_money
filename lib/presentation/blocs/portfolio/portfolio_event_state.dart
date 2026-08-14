import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_app/domain/models/portfolio_model.dart';

part 'portfolio_event_state.freezed.dart';

@freezed
sealed class PortfolioEvent with _$PortfolioEvent {
  const factory PortfolioEvent.load() = LoadPortfolio;
}

@freezed
abstract class PortfolioState with _$PortfolioState {
  const factory PortfolioState({
    @Default(false) bool isLoading,
    PortfolioSummary? portfolio,
    String? error,
  }) = _PortfolioState;

  factory PortfolioState.initial() => const PortfolioState();
}
