// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SipModel _$SipModelFromJson(Map<String, dynamic> json) => _SipModel(
  fundId: json['fundId'] as String,
  fundName: json['fundName'] as String,
  amount: (json['amount'] as num).toDouble(),
  debitDay: (json['debitDay'] as num).toInt(),
  paymentMethod: json['paymentMethod'] as String,
  projectedValue: (json['projectedValue'] as num).toDouble(),
);

Map<String, dynamic> _$SipModelToJson(_SipModel instance) => <String, dynamic>{
  'fundId': instance.fundId,
  'fundName': instance.fundName,
  'amount': instance.amount,
  'debitDay': instance.debitDay,
  'paymentMethod': instance.paymentMethod,
  'projectedValue': instance.projectedValue,
};

_SipConfirmation _$SipConfirmationFromJson(Map<String, dynamic> json) =>
    _SipConfirmation(
      folioNumber: json['folioNumber'] as String,
      nextDebitDate: DateTime.parse(json['nextDebitDate'] as String),
      amount: (json['amount'] as num).toDouble(),
      fundName: json['fundName'] as String,
    );

Map<String, dynamic> _$SipConfirmationToJson(_SipConfirmation instance) =>
    <String, dynamic>{
      'folioNumber': instance.folioNumber,
      'nextDebitDate': instance.nextDebitDate.toIso8601String(),
      'amount': instance.amount,
      'fundName': instance.fundName,
    };
