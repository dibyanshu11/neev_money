import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/domain/models/sip_model.dart';
import 'package:new_app/domain/repository/fund_repository.dart';
import 'package:new_app/presentation/blocs/sip/sip_event_state.dart';

class SipBloc extends Bloc<SipEvent, SipState> {
  SipBloc({FundRepository? repository})
      : _repository = repository ?? FundRepository(),
        super(SipState.initial()) {
    on<InitSip>(_onInit);
    on<AmountChanged>(_onAmountChanged);
    on<DebitDayChanged>(_onDebitDayChanged);
    on<PaymentMethodChanged>(_onPaymentMethodChanged);
    on<LoadPaymentMethods>((event, emit) {});
    on<SubmitSip>(_onSubmit);
  }

  final FundRepository _repository;

  /// SIP future value at ~14% p.a. over 10 years (matches design copy).
  static double futureValue(
    double monthly, {
    double annualRate = 0.14,
    int months = 120,
  }) {
    final r = annualRate / 12;
    if (r == 0) return monthly * months;
    return monthly * (math.pow(1 + r, months) - 1) / r * (1 + r);
  }

  Future<void> _onInit(InitSip event, Emitter<SipState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _repository.getFundById(event.fundId);
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: 'Fund not found')),
      (fund) => emit(state.copyWith(isLoading: false, fund: fund)),
    );
  }

  void _onAmountChanged(AmountChanged event, Emitter<SipState> emit) {
    emit(state.copyWith(amount: event.amount));
  }

  void _onDebitDayChanged(DebitDayChanged event, Emitter<SipState> emit) {
    emit(state.copyWith(debitDay: event.day));
  }

  void _onPaymentMethodChanged(
    PaymentMethodChanged event,
    Emitter<SipState> emit,
  ) {
    emit(state.copyWith(paymentMethod: event.method));
  }

  Future<void> _onSubmit(SubmitSip event, Emitter<SipState> emit) async {
    if (state.fund == null) return;
    emit(state.copyWith(isSubmitting: true, error: null));
    final sip = SipModel(
      fundId: state.fund!.id,
      fundName: state.fund!.name,
      amount: state.amount,
      debitDay: state.debitDay,
      paymentMethod: state.paymentMethod,
      projectedValue: futureValue(state.amount),
    );
    final result = await _repository.createSip(sip);
    result.fold(
      (f) => emit(state.copyWith(isSubmitting: false, error: 'Payment failed')),
      (confirmation) => emit(
        state.copyWith(isSubmitting: false, confirmation: confirmation),
      ),
    );
  }

  double get projectedValue => futureValue(state.amount);

  double get investedOver10Y => state.amount * 12 * 10;
}
