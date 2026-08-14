// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FundModel _$FundModelFromJson(Map<String, dynamic> json) => _FundModel(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  riskLevel: json['riskLevel'] as String,
  returns3Y: (json['returns3Y'] as num).toDouble(),
  minSip: (json['minSip'] as num).toDouble(),
  nav: (json['nav'] as num).toDouble(),
  expenseRatio: (json['expenseRatio'] as num).toDouble(),
  fundSize: (json['fundSize'] as num).toDouble(),
  shortCode: json['shortCode'] as String? ?? '',
  planType: json['planType'] as String? ?? 'Direct · Growth',
  rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
  holdings:
      (json['holdings'] as List<dynamic>?)
          ?.map((e) => HoldingModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$FundModelToJson(_FundModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'riskLevel': instance.riskLevel,
      'returns3Y': instance.returns3Y,
      'minSip': instance.minSip,
      'nav': instance.nav,
      'expenseRatio': instance.expenseRatio,
      'fundSize': instance.fundSize,
      'shortCode': instance.shortCode,
      'planType': instance.planType,
      'rating': instance.rating,
      'holdings': instance.holdings,
    };

_HoldingModel _$HoldingModelFromJson(Map<String, dynamic> json) =>
    _HoldingModel(
      name: json['name'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$HoldingModelToJson(_HoldingModel instance) =>
    <String, dynamic>{'name': instance.name, 'percentage': instance.percentage};
