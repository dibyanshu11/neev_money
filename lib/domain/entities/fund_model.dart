import 'package:freezed_annotation/freezed_annotation.dart';

part 'fund_model.freezed.dart';
part 'fund_model.g.dart';

@freezed
abstract class FundModel with _$FundModel {
  const factory FundModel({
    required String id,
    required String name,
    required String category,
    required String riskLevel,
    required double returns3Y,
    required double minSip,
    required double nav,
    required double expenseRatio,
    required double fundSize,
    @Default('') String shortCode,
    @Default('Direct · Growth') String planType,
    @Default(4.5) double rating,
    @Default([]) List<HoldingModel> holdings,
  }) = _FundModel;

  factory FundModel.fromJson(Map<String, dynamic> json) =>
      _$FundModelFromJson(json);
}

@freezed
abstract class HoldingModel with _$HoldingModel {
  const factory HoldingModel({
    required String name,
    required double percentage,
  }) = _HoldingModel;

  factory HoldingModel.fromJson(Map<String, dynamic> json) =>
      _$HoldingModelFromJson(json);
}
