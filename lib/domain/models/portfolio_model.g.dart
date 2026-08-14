// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioSummary _$PortfolioSummaryFromJson(Map<String, dynamic> json) =>
    _PortfolioSummary(
      currentValue: (json['currentValue'] as num).toDouble(),
      investedAmount: (json['investedAmount'] as num).toDouble(),
      totalReturns: (json['totalReturns'] as num).toDouble(),
      totalReturnsPercent: (json['totalReturnsPercent'] as num).toDouble(),
      oneDayChange: (json['oneDayChange'] as num).toDouble(),
      oneDayChangePercent: (json['oneDayChangePercent'] as num).toDouble(),
      allocation:
          (json['allocation'] as List<dynamic>?)
              ?.map((e) => AllocationItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      holdings:
          (json['holdings'] as List<dynamic>?)
              ?.map((e) => PortfolioHolding.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PortfolioSummaryToJson(_PortfolioSummary instance) =>
    <String, dynamic>{
      'currentValue': instance.currentValue,
      'investedAmount': instance.investedAmount,
      'totalReturns': instance.totalReturns,
      'totalReturnsPercent': instance.totalReturnsPercent,
      'oneDayChange': instance.oneDayChange,
      'oneDayChangePercent': instance.oneDayChangePercent,
      'allocation': instance.allocation,
      'holdings': instance.holdings,
    };

_AllocationItem _$AllocationItemFromJson(Map<String, dynamic> json) =>
    _AllocationItem(
      name: json['name'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$AllocationItemToJson(_AllocationItem instance) =>
    <String, dynamic>{'name': instance.name, 'percentage': instance.percentage};

_PortfolioHolding _$PortfolioHoldingFromJson(Map<String, dynamic> json) =>
    _PortfolioHolding(
      fundId: json['fundId'] as String,
      fundName: json['fundName'] as String,
      currentValue: (json['currentValue'] as num).toDouble(),
      dailyChange: (json['dailyChange'] as num).toDouble(),
      dailyChangePercent: (json['dailyChangePercent'] as num).toDouble(),
      profitLoss: (json['profitLoss'] as num).toDouble(),
      profitLossPercent: (json['profitLossPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$PortfolioHoldingToJson(_PortfolioHolding instance) =>
    <String, dynamic>{
      'fundId': instance.fundId,
      'fundName': instance.fundName,
      'currentValue': instance.currentValue,
      'dailyChange': instance.dailyChange,
      'dailyChangePercent': instance.dailyChangePercent,
      'profitLoss': instance.profitLoss,
      'profitLossPercent': instance.profitLossPercent,
    };
