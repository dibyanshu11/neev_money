import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_model.freezed.dart';
part 'portfolio_model.g.dart';

@freezed
abstract class PortfolioSummary with _$PortfolioSummary {
  const factory PortfolioSummary({
    required double currentValue,
    required double investedAmount,
    required double totalReturns,
    required double totalReturnsPercent,
    required double oneDayChange,
    required double oneDayChangePercent,
    @Default([]) List<AllocationItem> allocation,
    @Default([]) List<PortfolioHolding> holdings,
  }) = _PortfolioSummary;

  factory PortfolioSummary.fromJson(Map<String, dynamic> json) =>
      _$PortfolioSummaryFromJson(json);
}

@freezed
abstract class AllocationItem with _$AllocationItem {
  const factory AllocationItem({
    required String name,
    required double percentage,
  }) = _AllocationItem;

  factory AllocationItem.fromJson(Map<String, dynamic> json) =>
      _$AllocationItemFromJson(json);
}

@freezed
abstract class PortfolioHolding with _$PortfolioHolding {
  const factory PortfolioHolding({
    required String fundId,
    required String fundName,
    required double currentValue,
    required double dailyChange,
    required double dailyChangePercent,
    required double profitLoss,
    required double profitLossPercent,
  }) = _PortfolioHolding;

  factory PortfolioHolding.fromJson(Map<String, dynamic> json) =>
      _$PortfolioHoldingFromJson(json);
}
