import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_app/domain/models/fund_model.dart';
import 'package:new_app/domain/models/sip_model.dart';

part 'sip_event_state.freezed.dart';

@freezed
sealed class SipEvent with _$SipEvent {
  const factory SipEvent.init(String fundId) = InitSip;
  const factory SipEvent.amountChanged(double amount) = AmountChanged;
  const factory SipEvent.debitDayChanged(int day) = DebitDayChanged;
  const factory SipEvent.paymentMethodChanged(String method) = PaymentMethodChanged;
  const factory SipEvent.loadPaymentMethods() = LoadPaymentMethods;
  const factory SipEvent.submit() = SubmitSip;
}

@freezed
abstract class SipState with _$SipState {
  const factory SipState({
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    FundModel? fund,
    @Default(5000.0) double amount,
    @Default(5) int debitDay,
    @Default('UPI Auto-pay') String paymentMethod,
    @Default(['UPI Auto-pay', 'Net-banking mandate']) List<String> paymentMethods,
    SipConfirmation? confirmation,
    String? error,
  }) = _SipState;

  factory SipState.initial() => const SipState();
}
