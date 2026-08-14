import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_app/domain/models/fund_model.dart';

part 'fund_detail_event_state.freezed.dart';

@freezed
sealed class FundDetailEvent with _$FundDetailEvent {
  const factory FundDetailEvent.load(String fundId) = LoadFundDetail;
  const factory FundDetailEvent.chartPeriodChanged(String period) =
      ChartPeriodChanged;
}

@freezed
abstract class FundDetailState with _$FundDetailState {
  const factory FundDetailState({
    @Default(false) bool isLoading,
    FundModel? fund,
    @Default('5Y') String selectedPeriod,
    String? error,
  }) = _FundDetailState;

  factory FundDetailState.initial() => const FundDetailState();
}
