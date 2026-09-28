import 'package:freezed_annotation/freezed_annotation.dart';

part 'sip_model.freezed.dart';
part 'sip_model.g.dart';

@freezed
abstract class SipModel with _$SipModel {
  const factory SipModel({
    required String fundId,
    required String fundName,
    required double amount,
    required int debitDay,
    required String paymentMethod,
    required double projectedValue,
  }) = _SipModel;

  factory SipModel.fromJson(Map<String, dynamic> json) =>
      _$SipModelFromJson(json);
}

@freezed
abstract class SipConfirmation with _$SipConfirmation {
  const factory SipConfirmation({
    required String folioNumber,
    required DateTime nextDebitDate,
    required double amount,
    required String fundName,
  }) = _SipConfirmation;

  factory SipConfirmation.fromJson(Map<String, dynamic> json) =>
      _$SipConfirmationFromJson(json);
}
